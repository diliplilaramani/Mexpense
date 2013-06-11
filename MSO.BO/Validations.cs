using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace MSO.BO
{
   public  class Validations
    {
       public bool isDouble(string fieldtext)
       {
           Double result;
           return Double.TryParse(fieldtext, System.Globalization.NumberStyles.Integer,
               System.Globalization.CultureInfo.CurrentCulture, out result);
       }

       public bool IsInteger(string strNumber)
       {
            System.Text.RegularExpressions.Regex _RegexNotIntPattern = new System.Text.RegularExpressions.Regex("[^0-9-]");
            System.Text.RegularExpressions.Regex _RegexIntPattern = new System.Text.RegularExpressions.Regex("^-[0-9]+$|^[0-9]+$");
            return !_RegexNotIntPattern.IsMatch(strNumber) && _RegexIntPattern.IsMatch(strNumber);
        }

    }
}
