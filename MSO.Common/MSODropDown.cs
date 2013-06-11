using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace MSO.Controls
{
   public class MSODropDown : System.Web.UI.WebControls.DropDownList
    {
        public string MSOID
        {
            get;

            set;
        }
    }
}