using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace MSO.DAO
{
    public class UtilityDAO
    {

        SqlHelper hlpr = new SqlHelper();
        public static int ConvertToInteger(string sText)
        {
            int iReturnValue = 0;
            bool b =true; 
            if (sText.Trim() == "" ||sText ==string.Empty)
            {
                iReturnValue = 0;
            }
            else
                 b = int.TryParse(sText, out iReturnValue);
                 
            return iReturnValue;
        }

        public  static DateTime ConverttoDate(string sDate = "")
        {

            if (sDate == string.Empty)
            {
                sDate = DateTime.Now.ToString();
            }

            DateTime d1 = Convert.ToDateTime(sDate);
            string dd = d1.Day.ToString();
            string mm = GetMonth(d1.Month);
            string yyyy = d1.Year.ToString();


            DateTime validDate = Convert.ToDateTime(dd + "-" + mm + "-" + yyyy + " " + d1.Hour + ":" + d1.Minute + ":" + d1.Second);
            return validDate;
        }


        public   static string ConverttoDateWithTime(string sDate = "")
        {

            if (sDate == string.Empty)
            {
                sDate = DateTime.Now.ToString();
            }

            DateTime d1 = Convert.ToDateTime(sDate);
            string dd = d1.Day.ToString();
            string mm = GetMonth(d1.Month);
            string yyyy = d1.Year.ToString();


            string validDate = dd + "-" + mm + "-" + yyyy + " " + d1.Hour + ":" + d1.Minute + ":" + d1.Second;
            return validDate;
        }

        private static string GetMonth(int month)
        {
            string sMonth = null;

            if (month == 0 || month > 12)
                return sMonth;

            switch (month)
            {
                case 1:
                    {
                        sMonth = "Jan";
                        break;
                    }

                case 2:
                    {
                        sMonth = "Feb";
                        break;
                    }

                case 3:
                    {
                        sMonth = "Mar";
                        break;
                    }

                case 4:
                    {
                        sMonth = "April";
                        break;
                    }


                case 5:
                    {
                        sMonth = "May";
                        break;
                    }


                case 6:
                    {
                        sMonth = "Jun";
                        break;
                    }

                case 7:
                    {
                        sMonth = "Jul";
                        break;
                    }

                case 8:
                    {
                        sMonth = "Aug";
                        break;
                    }

                case 9:
                    {
                        sMonth = "Sep";
                        break;
                    }


                case 10:
                    {
                        sMonth = "Oct";
                        break;
                    }

                case 11:
                    {
                        sMonth = "Nov";
                        break;
                    }

                default:
                    {
                        sMonth = "Dec";
                        break;
                    }

            }
            return sMonth;
        }

        //below function will return only date 
        public static string ConverttoDateWithoutTime(string sDate)
        {

            string[] date;
            string sDt;
            if (sDate == string.Empty)
                sDt = sDate;
            else
            {
                date = sDate.Split(' ');
                sDt = date[0].ToString();
            }

            return sDt;
        }

        public static string ConvertZeroToNull(int Value)
        {

            return Value == 0 ? null : Value.ToString();
        }

        public static bool isDouble(string fieldtext)
        {
            Double result;
            return Double.TryParse(fieldtext, System.Globalization.NumberStyles.Integer,
                System.Globalization.CultureInfo.CurrentCulture, out result);
        }

        public static bool IsInteger(string strNumber)
        {
            System.Text.RegularExpressions.Regex _RegexNotIntPattern = new System.Text.RegularExpressions.Regex("[^0-9-]");
            System.Text.RegularExpressions.Regex _RegexIntPattern = new System.Text.RegularExpressions.Regex("^-[0-9]+$|^[0-9]+$");
            return !_RegexNotIntPattern.IsMatch(strNumber) && _RegexIntPattern.IsMatch(strNumber);
        }

        public  DataTable GetDataforDropDown(string sValueField, string sTextField, string sTableName, out int iStatus)
        {
            DataTable dt = null;
            iStatus = 0;

            try
            {
                string spName = "GetDataforDropDown";
                DataSet ds = new DataSet();
                List<SqlParameter> prm = new List<SqlParameter>();
                prm.Add(new SqlParameter("@valueField", sValueField));
                prm.Add(new SqlParameter("@textField", sTextField));
                prm.Add(new SqlParameter("@TableName", sTableName));

                ds = hlpr.ExecuteDataSet(spName, prm.ToArray());

                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            dt = ds.Tables[0];
                        }
                }
                else
                {
                    iStatus = 10; //// number can be used from 1 to 10  
                }

            }
            catch (Exception ex)
            {
                SqlHelper.LogException(ex);
            }

            return dt;
        }


    }
}
