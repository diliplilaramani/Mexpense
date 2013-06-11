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
    public partial class Roles : System.Web.UI.Page
    {
       
        RolesBO objRoles = new RolesBO();

        MSO.BO.Common objCommon = new MSO.BO.Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if  (! IsPostBack)           {
                LoadMenuSubMenu();
                EnableDisablePanels(MSO.BO.Common.sView);
            }
            
        }


        private void EnableDisablePanels(string Action)
        
        {

            LoadMenuSubMenu();
            if (Action == MSO.BO.Common.sAdd)  // for add 
            {
                pnlSearchRole.Visible = false;
                pnlAddRole.Visible = true;
                btnAdd.Text = "Save";
                btnSave.Text = "Save";
                btnDelete.Visible = false;
                drpDwnModuleName.SelectedValue = "0";
                txtRoleName.Text = string.Empty;
                txtRoleDescription.Text = string.Empty;

            
            }
            else if (Action == MSO.BO.Common.sEdit) //for edit 
            {
                pnlSearchRole.Visible = false;
                pnlAddRole.Visible = true;
                btnSave.Text = "Update";
                btnDelete.Visible = true;
                GetAssignedMenutoSelectedRole();
                
            }
            else if (Action == MSO.BO.Common.sDelete) // for delete  
            {
                pnlSearchRole.Visible = true;
                pnlAddRole.Visible = false;
                drpDwnModuleName.SelectedValue = "0";
                            }
            else if (Action == MSO.BO.Common.sView) //for view  
            {
                pnlSearchRole.Visible = true;
                pnlAddRole.Visible = false;
                drpDwnModuleName.SelectedValue = "0";
                LoadRole(0, txtSearchRole.Text);
                
            }

           
        }


        private void GetAssignedMenutoSelectedRole()
        {
            DataSet ds = null;
            ds = objRoles.GetAssignedMenutoRole(Convert.ToInt32(HdnRoleId.Value), string.Empty);
            if (ds!=null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtRoleName.Text = Convert.ToString(ds.Tables[0].Rows[0]["ROLE_NAME"]);
                    txtRoleDescription.Text =Convert.ToString(ds.Tables[0].Rows[0]["ROLE_DESC"]);
                    string isDeafaultRole = Convert.ToString(ds.Tables[0].Rows[0]["DefaultRole"]);
                    if (isDeafaultRole == "Y")
                        chkDefault.Checked = true;
                    else
                        chkDefault.Checked = false;

                }

                int MenuId;
                int iAddId;
                int iEditId;
                int iDeleteId;
                int iViewId;
                
                if (ds.Tables[1].Rows.Count > 0)
                {
                    foreach (GridViewRow row in gridMenuList.Rows)
                    {

                        MenuId = 0;
                        iAddId = 0;
                        iEditId = 0;
                        iDeleteId = 0;
                        iViewId = 0;

                        MenuId = Convert.ToInt32(gridMenuList.DataKeys[row.RowIndex].Values[0]);


                        DataRow[] SubMenu = ds.Tables[1].Select("submenu_id =" + MenuId);
                        if (SubMenu.Length > 0)
                        {
                            int.TryParse(SubMenu[0]["ADD"].ToString(), out iAddId);
                            int.TryParse(SubMenu[0]["EDIT"].ToString(), out iEditId);
                            int.TryParse(SubMenu[0]["DELETE"].ToString(), out iDeleteId);
                            int.TryParse(SubMenu[0]["VIEW"].ToString(), out iViewId);    
                        }

                        CheckBox chkAdd = row.FindControl("chkAdd") as CheckBox;
                        CheckBox chkModify = row.FindControl("chkModify") as CheckBox;
                        CheckBox chkDelete = row.FindControl("chkDelete") as CheckBox;
                        CheckBox chkView = row.FindControl("chkview") as CheckBox;


                        if (iAddId > 0)
                            chkAdd.Checked = true;
                        else
                            chkAdd.Checked = false;

                        if (iEditId > 0)
                            chkModify.Checked = true;
                        else
                            chkModify.Checked = false;

                        if (iDeleteId > 0)
                            chkDelete.Checked = true;
                        else
                            chkDelete.Checked = false;

                        if (iViewId > 0)
                            chkView.Checked = true;
                        else
                            chkView.Checked = false;

                        

                    }
                }
            }
        }


        private void LoadMenuSubMenu()
        {
            DataSet ds = null;
            int MainMenuId = 0;
            if (drpDwnModuleName.Items.Count > 0)
            {
                MainMenuId = Convert.ToInt32(drpDwnModuleName.SelectedValue);
            }

             ds =objRoles.GetSubMenuList(MainMenuId);
             if (ds != null)
             {
                 if (ds.Tables[1].Rows.Count > 0)
                 {
                     if (!IsPostBack)
                     {
                         drpDwnModuleName.DataTextField = "MAINMENU_NAME";
                         drpDwnModuleName.DataValueField = "MAINMENU_ID";
                         drpDwnModuleName.DataSource = ds.Tables[1];
                         drpDwnModuleName.DataBind();
                     }
                     else
                     {
                         drpDwnModuleName.SelectedValue = Convert.ToString(MainMenuId);
                     }
                 }

                 if (ds.Tables[0].Rows.Count > 0) 
                 {
                     gridMenuList.DataSource = ds.Tables[0];
                     gridMenuList.DataBind();
                 }
             }
        }
        protected void drpDwnModuleName_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadMenuSubMenu();
            if (Convert.ToInt32( HdnRoleId.Value) > 0)  
                GetAssignedMenutoSelectedRole();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
           SessionContainer objsession  = Session["UserDetails"] as SessionContainer;
           if (objsession.isAddAccess)
               EnableDisablePanels(MSO.BO.Common.sAdd);
           else
               Message.Show( MSO.BO.Common.NoAddPermission);
        }

        protected void btnBackAdd_Click(object sender, EventArgs e)
        {
            EnableDisablePanels(MSO.BO.Common.sView);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SessionContainer obj = Session["UserDetails"] as SessionContainer;
            if (btnSave.Text == "Save")
            {
                if (obj.isAddAccess == false)
                {
                    Message.Show(MSO.BO.Common.NoAddPermission);
                    return;
                }

            }

            if (btnSave.Text == "Update")
            {
                if (obj.isEditAccess == false)
                {
                    Message.Show( MSO.BO.Common.NoEditPermission);
                    return;
                }
            }       
                SaveUpdateRole();
        }

        private void SaveUpdateRole()
        {
            if (isValidRecord())
            {
                DataTable dtMenuAccess = new DataTable();
                DataSet ds = null;
                DataTable dtActions = new DataTable("Actions");

                DataColumn dtFieldName = new DataColumn();
                dtFieldName.ColumnName = "SubMenuId";
                dtFieldName.DataType = Type.GetType("System.Int32");

                DataColumn dtFieldValue = new DataColumn();
                dtFieldValue.ColumnName = "ActionId";
                dtFieldValue.DataType = Type.GetType("System.Int32");

                dtActions.Columns.Add(dtFieldName);
                dtActions.Columns.Add(dtFieldValue);
                
                int subMenuId= 0;

                int iAddId = 0;
                int iEditId = 0;
                int iDeleteId = 0;
                int iViewId = 0;

                ds = objRoles.GetActionIds();

                if (ds != null)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        int.TryParse(ds.Tables[0].Rows[0]["ADD"].ToString(), out iAddId);
                        int.TryParse(ds.Tables[0].Rows[0]["EDIT"].ToString(), out iEditId);
                        int.TryParse(ds.Tables[0].Rows[0]["DELETE"].ToString(), out iDeleteId);
                        int.TryParse(ds.Tables[0].Rows[0]["VIEW"].ToString(), out iViewId);
                    }
                }
                
                ///CHECK IF ANY MASTER ENTRY IS MISSING
                if (iAddId <= 0 || iEditId <= 0 || iDeleteId <= 0 || iViewId <= 0)
                {
                    Message.Show("Invalid Actions! Please contact to administrator");
                   return;
                }


                bool isAnyRowSelected = false;
                foreach (GridViewRow gr in gridMenuList.Rows)
                {
                    
                    subMenuId = Convert.ToInt32(gridMenuList.DataKeys[gr.RowIndex].Values[0]);
                    CheckBox chkAdd = gr.FindControl("chkAdd") as CheckBox;
                    CheckBox chkModify = gr.FindControl("chkModify") as CheckBox;
                    CheckBox chkDelete = gr.FindControl("chkDelete") as CheckBox;
                    CheckBox chkView = gr.FindControl("chkview") as CheckBox;

                    if (chkAdd.Checked)
                    {
                       DataRow row = dtActions.NewRow();
                       row["SubMenuId"] = subMenuId;
                       row["ActionId"] = iAddId;
                       dtActions.Rows.Add(row);
                       isAnyRowSelected = true;
                    }

                    if (chkModify.Checked)
                    {
                        DataRow row = dtActions.NewRow();
                        row["SubMenuId"] = subMenuId;
                        row["ActionId"] = iEditId;
                        dtActions.Rows.Add(row);
                        isAnyRowSelected = true;
                    }

                    if (chkDelete.Checked)
                    {
                        DataRow row = dtActions.NewRow();
                        row["SubMenuId"] = subMenuId;
                        row["ActionId"] = iDeleteId;
                        dtActions.Rows.Add(row);
                        isAnyRowSelected = true;
                    }

                    if (chkView.Checked)
                    {
                        DataRow row = dtActions.NewRow();
                        row["SubMenuId"] = subMenuId;
                        row["ActionId"] = iViewId;
                        dtActions.Rows.Add(row);
                        isAnyRowSelected = true;
                    }

                }

                if (isAnyRowSelected == false)
                {
                    lblErrGrid.Text = "Please select atleast one menu for role";
                    lblErrGrid.Visible = true;
                    return;
                }
                else
                    lblErrGrid.Visible = true;

                string sDefault = "N";
                
                if (chkDefault.Checked)
                       sDefault ="Y";

               SessionContainer objSession = Session["UserDetails"] as SessionContainer;
               string RoleId =Convert.ToString(HdnRoleId.Value);

               int i = objRoles.SaveUpdateRoles(Convert.ToInt32(RoleId), txtRoleName.Text, 
                                                txtRoleDescription.Text, sDefault, objSession.UID, dtActions);

               if (i > 0)
               {
                   if(btnSave.Text =="Save")  
                        Message.Show( MSO.BO.Common.sAddMessage);
                   else
                       Message.Show( MSO.BO.Common.sUpdateMessage);

                   EnableDisablePanels( MSO.BO.Common.sView);
               }
               else
                   Message.Show( MSO.BO.Common.sOperationFail);
               

            }
        }

        private bool isValidRecord()
        {
             bool  _isValidRecord = true;

             if (txtRoleName.Text.Trim().Length == 0)
             {
                 lblErrRoleName.Text = "Role Name can not blank";
                 lblErrRoleName.Visible = true;
                 _isValidRecord = false;

             }
             else
             {
                 lblErrRoleName.Visible = false;
             }

             if (txtRoleDescription.Text.Trim().Length == 0)
             {
                 lblErrDescription.Text = "Role Description can not blank";
                 lblErrDescription.Visible = true;
                 _isValidRecord = false;
             }
             else
             {
                 lblErrDescription.Visible = false; 
             }

            bool isDeafaultRoleExist = false;
             
            if (objRoles.isRoleNameAlreadyExist(Convert.ToInt32(HdnRoleId.Value), txtRoleName.Text, out isDeafaultRoleExist) == true)

             {
                 lblErrRoleName.Text = "Role Name is Already Exist in system";
                 lblErrRoleName.Visible = true;
                 _isValidRecord = false;

             }
             else
             {  
                if (lblErrRoleName.Visible ==false)
                 lblErrRoleName.Visible = false;
             }


             if (chkDefault.Checked)
             {
                 if (isDeafaultRoleExist == true)
                 {
                     lblErrDefault.Text = "Default Role is already exist in system";
                     lblErrDefault.Visible = true;
                     _isValidRecord = false;
                 }
                 else
                 {
                     lblErrDefault.Visible = false;
                 }
             }

             return _isValidRecord;
        }

        protected void GrdRoleList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GrdRoleList.PageIndex = e.NewPageIndex;
            LoadRole(0, "");
        }

        protected void GrdRoleList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int RoleId;
            if (e.CommandName == "Edits")
            {
                GridViewRow row = (GridViewRow)(((MSOLinkButton)e.CommandSource).NamingContainer);
                RoleId = Convert.ToInt32(GrdRoleList.DataKeys[row.RowIndex].Values[0]);
                
                SessionContainer objsession;
                objsession = Session["UserDetails"] as SessionContainer;

                HdnRoleId.Value = RoleId.ToString();
                if (objsession.isEditAccess == true)
                {
                    EnableDisablePanels(MSO.BO.Common.sEdit);
                }
                else if (objsession.isViewAccess == true)
                    EnableDisablePanels( MSO.BO.Common.sView);
                else
                {
                    Message.Show("Sorry! You dont have Edit/View permission");
                    HdnRoleId.Value = "0";
                }
                    
            }
        }

        protected void GrdRoleList_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
           //LoadRolesToGrid();
        }

        private void LoadRole(int RoleId, string sRoleName )
        {
            DataSet ds = null;
            ds = objRoles.GetRolesDeatails(RoleId, sRoleName);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GrdRoleList.DataSource = ds.Tables[0];
                    GrdRoleList.DataBind();
                }
                else
                {
                    GrdRoleList.DataSource = null;
                    GrdRoleList.DataBind();
                }

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadRole(0, txtSearchRole.Text);
        }

        protected void chkSearchDefault_CheckedChanged(object sender, EventArgs e)
        {
            DataSet ds = null;
            if (chkDefault.Checked)
            {
                ds = objRoles.GetDefaultRole();
            }
            else
            {
                LoadRole(0, txtSearchRole.Text);
            }

        }

       
       
    }
}