using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MSO.Controls;
using MSO.BO;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MSO.Web.View
{
    public partial class Login : System.Web.UI.Page
    {

        ValidateUser objUser = new ValidateUser();

        protected void Page_Load(object sender, EventArgs e)
        {
           txtUserName.Text = "dilip";
            txtPassword.Text = "test";
        }



        private void ValidDateUser()
        {

            SessionContainer obj = new SessionContainer();

            if (objUser.IsValiduser(txtUserName.Text, txtPassword.Text, out obj))
            {
                Session["UserDetails"] = obj;
                Response.Redirect("~/view/home.aspx");
            }
            else
            {
                Message.Show("Ïnvalid  UserId/Password");
            }


        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ValidDateUser();
        }
    }
}