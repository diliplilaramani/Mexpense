using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using MSO.Controls;
using MSO.BO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Linq.Expressions;
using System.Collections;


namespace MSO.Web.MasterPages
{
    public partial class MSOMaster : System.Web.UI.MasterPage
    {
        RolesBO objRoles = new RolesBO();
        MSO.BO.Common objCommon = new BO.Common();     
        string SELECTEDINDEX = "SelectedIndex";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMenuAsPerAccess();
            
            if (!IsPostBack)
            {
                //lblLastLogin.Text = DateTime.Now.ToString();

                AccordionMenu.SelectedIndex = SelectedIndex;        
            }
        }

        public int SelectedIndex
        {

            set
            {   
                Session[SELECTEDINDEX] = value;
            }
            get
            {
                if (Session[SELECTEDINDEX] != null)
                {
                    return Convert.ToInt32(Session[SELECTEDINDEX].ToString());
                }
                return 0;
            }
        }

        
        private void LoadMenuAsPerAccess()
        {

            RolesBO roles = new RolesBO();
            AccordionPane pane = null;
            Label lbl = null;
            MSOLinkButton linkBtn1;
            Hashtable ht = new Hashtable();
            try
            {
                
               
                DataSet ds = null;
                SessionContainer objSesn = (SessionContainer) Session["UserDetails"];
                try
                {
                    ds = objRoles.GetMenuListasPerRoles(objSesn.UserId);
                }
                catch (Exception ex)

                {
                    
                    //ExceptionLog.LogException(ex);
                    Response.Redirect("~/view/Login.aspx");
                }
                
              if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0] != null)
                        {

                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                try
                                {
                                    string name = dr["MenuName"].ToString();
                                    int mainmenuId = Convert.ToInt32(dr["MainMenuId"].ToString());

                                    pane = new AccordionPane();
                                    pane.ID = name;

                                    lbl = new Label();
                                    lbl.Text = name;
                                    lbl.CssClass = "HeaderMenu";
                                    pane.HeaderContainer.Controls.Add(lbl);
                                    
                                    DataTable subrows = ds.Tables[1].AsEnumerable()
                                                    .Where(i => i.Field<int>("MainMenuId") == mainmenuId)
                                                    .CopyToDataTable();

                                    foreach (DataRow dr1 in subrows.Rows)
                                    {
                                        linkBtn1 = new MSOLinkButton();
                                        ListItem lst = new ListItem();

                                        ht.Add(dr1["submenu_id"].ToString(), dr1["SubMenuUrl"].ToString());
                                        //linkBtn1.PostBackUrl = dr1["SubMenuUrl"].ToString();
                                        linkBtn1.Text = dr1["SubMenuName"].ToString();
                                        linkBtn1.Click += new EventHandler(linkBtn_Click);
                                        linkBtn1.MSOID = Convert.ToString(dr1["submenu_id"]);
                                        pane.ContentContainer.Controls.Add(linkBtn1);
                                    }
                                    AccordionMenu.Panes.Add(pane);
                                }
                                catch (Exception mex)
                                {
                                     objCommon.LogException(mex);

                                }
                            }
           
                            Session["ht"] = ht;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                objCommon.LogException(ex);
            }

        }

        protected void linkBtn_Click(object sender, EventArgs e)
        {

            MSOLinkButton bt;
            bt = (MSOLinkButton)sender;
            //hd.Value= bt.Text.ToString();
            lblUserName.Text = bt.Text.ToString();
            int menuid = Convert.ToInt32(bt.MSOID);
            string sUrl = "";
            int index = AccordionMenu.SelectedIndex;
            SelectedIndex = index;

            AccordionMenu.SelectedIndex = SelectedIndex;
            if (Session["ht"] != null)
            {
                Hashtable ht = (Hashtable)Session["ht"];

                foreach (DictionaryEntry item in ht)
                {
                    if (Convert.ToInt32(item.Key) == menuid)
                    {
                        sUrl = Convert.ToString(item.Value);
                        break;
                    }
                }

                Session["selectedmenuid"] = menuid;
                GetAllowedActions();
                
                if (sUrl != "")
                    Response.Redirect(sUrl);
           
            }
        }
        private void  GetAllowedActions()
        {
            int menuId = -1;
            if (Session["selectedmenuid"] != null)
                menuId = Convert.ToInt32(Session["selectedmenuid"]);
            SessionContainer obj = (SessionContainer) Session["UserDetails"]  ;
            if (obj != null)
            {
                obj = objCommon.GetAllowedActions(menuId, obj);
                obj.isAddAccess = true;
                obj.isEditAccess = true;
                obj.isViewAccess = true;
                obj.isDeleteAccess = true;
                Session["UserDetails"] = obj;
            }
            else
                Response.Redirect("~/View/Login.aspx");
        }
        protected void btnLogOff_Click(object sender, EventArgs e)
        {
            SessionContainer  objSesn = (SessionContainer) Session["UserDetails"] ;
           
            //write session log out code here 

            Session.Abandon();
            Response.Redirect("~/view/Login.aspx");
        }
    }
}