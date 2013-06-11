using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MSO.BO;
using MSO.Controls;

namespace MSO.Web.View
{
    public partial class AddAdditionalRoletoEmp : System.Web.UI.Page
    {

     
        RolesBO objRoles = new RolesBO();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Emproles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

                string sUserId =Convert.ToString(row.Cells[3].Text); 
                //string sEmpId =Convert.ToString(row.Cells[1].Text);

                string sEmpId = string.Empty;

                if (isValidEntry() == false)
                {
                    return;
                }
                else
                {
                    if (txtEmpID.Text.Trim().Length>0)
                        sEmpId = txtEmpID.Text;
                }

               
                int UID = Convert.ToInt32(Emproles.DataKeys[row.RowIndex].Values[0]);
                
                DropDownList drp  =(DropDownList)  row.FindControl("drpDownUnassignedRoles");
                SessionContainer objSession = Session["UserDetails"] as SessionContainer;

                int RoleId =Convert.ToInt32(drp.SelectedValue);
               
                if (objRoles.CreateUserandInsertRoles(UID,  sUserId, sEmpId, RoleId, objSession.UID) > 0)
                {
                    Message.Show("Role has been Added Successfully");
                        LoadAlssignedAndUnAssignedRole();
                }
                {
                    Message.Show ( "Unable to assign Role! Please contact to Administrator");
                }
            }
        }
        protected void Emproles_DataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt  = (DataTable)ViewState["UnAssigendRolesList"];
                if (dt != null && dt.Rows.Count > 0)
                {
                    DropDownList drp = (DropDownList)e.Row.FindControl("drpDownUnassignedRoles");
                    drp.DataTextField ="ROLE_NAME";
                    drp.DataValueField = "ROLE_ID";
                    drp.DataSource = dt;
                    drp.DataBind();
                }
            }
        }
        protected void gridempshowroles_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Remove")
            {
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);


                int User_Role_ID = Convert.ToInt32(gridempshowroles.DataKeys[row.RowIndex].Values[0]);
                SessionContainer obj = (SessionContainer) Session["UserDetails"];

                if (objRoles.RemoveRoles(User_Role_ID, obj.UID) > 0)
                {
                    Message.Show("Role has been removed successfully");
                    LoadAlssignedAndUnAssignedRole();
                }
                else
                {
                    Message.Show("Unable to remove the role! Please contact to administrator");
                }
            }
                    
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bool _isValidEntry =true;

            if (txtUserid.Text.Trim().Length == 0)
            {
                lblErrUserId.Text = "Please input User Id";
                lblUserId.Visible = true;
                _isValidEntry = false;
            }
            else
            {
                lblUserId.Visible = false;
            }

           
            if (_isValidEntry ==true)
                LoadAlssignedAndUnAssignedRole();
            
        }
        private void LoadAlssignedAndUnAssignedRole()
        {
            DataSet ds = null;
            SessionContainer objSession = Session["UserDetails"] as SessionContainer;
            

            ds = objRoles.GetAssignedRolestoUser(txtUserid.Text);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    txtUserid.MSOID = Convert.ToString(ds.Tables[0].Rows[0]["UID"]);
                    txtEmpID.Text = Convert.ToString(ds.Tables[0].Rows[0]["EMP_ID"]);
                    txtEmpName.Text = Convert.ToString(ds.Tables[0].Rows[0]["EMP_NAME"]);
                    txtEmpID.Enabled = false;
                    txtEmpName.Enabled = false;

                    ViewState["UnAssigendRolesList"] = ds.Tables[2];

                    Emproles.DataSource = ds.Tables[0];
                    Emproles.DataBind();

                    gridempshowroles.DataSource = ds.Tables[1];
                    gridempshowroles.DataBind();

                    if (txtEmpID.Text.Trim().Length > 0)
                        chkNotEmployee.Checked = false;

                    chkNotEmployee.Enabled = false;



                }
                else
                {
                    ViewState["UnAssigendRolesList"] = ds.Tables[2];
                    Emproles.DataSource = ds.Tables[3];
                    Emproles.DataBind();

                    gridempshowroles.DataSource = null;
                    gridempshowroles.DataBind();

                    chkNotEmployee.Checked = false;


                    Message.Show("No User exist with Id" + " " + txtUserid.Text + " " + " New User Id will be created");
                }

            }
            else
                Message.Show("No User exist with Id" + " " + txtUserid.Text + " " + " New User Id will be created");
 

        }
        protected void chkNotEmployee_CheckedChanged(object sender, EventArgs e)
        {

            string s  ="N";
            if (IsPostBack)
            {
                if (chkNotEmployee.Checked)
                    s  ="Y";

          }
            

            

            if (s == "Y")
            {
                txtEmpID.Enabled = false;
                txtEmpName.Enabled = false;
                ViewState["Checked"] = "N";
            }
            else
            {
                txtEmpID.Enabled = true;
                txtEmpName.Enabled = true;
                ViewState["Checked"] = "Y";
            }

        }
        private bool isValidEntry()

        {
            bool _isValidEntry = true;
            if (chkNotEmployee.Checked == false)
            {
                if (txtEmpID.Text == string.Empty)
                {
                    lblErrEmployeeId.Text = "Please input employee Id";
                    lblErrEmployeeId.Visible = true;
                    _isValidEntry = false;
                }
                else if (objRoles.isValidEmployeeId(txtEmpID.Text))
                {
                    lblErrEmployeeId.Visible = false;
                }
                else
                {
                    lblErrEmployeeId.Text = "Invalid Employee Id";
                    lblErrEmployeeId.Visible = true;
                    _isValidEntry = false;
                }

            }
            return _isValidEntry;
        }

    }
}