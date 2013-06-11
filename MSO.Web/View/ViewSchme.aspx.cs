using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MSO.BO;

namespace MSO.Web.View
{
    public partial class ViewSchme : System.Web.UI.Page
    {


        SchmeandRulesBO objCraeateSchmeandRuleBO = new SchmeandRulesBO();  

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
           
            {
                LoadSchemeAndAssignedRuleDetails();
            }
            
        }

        private void LoadSchemeAndAssignedRuleDetails()
        {
            DataSet ds = null;
           
            ds = objCraeateSchmeandRuleBO.GetSchemeandAssignedRuleBO("");
            if (ds!=null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                  
                }
            }

        }
    }
}