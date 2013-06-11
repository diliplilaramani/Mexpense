using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace MSO.DAO
{
   public class Common
    {

       SqlHelper hlpr = new SqlHelper(); 
        public DataTable GetAllowedActions(int ScreenId)
        {
            SqlHelper hlpr = new SqlHelper();
            DataSet ds = new DataSet();

            
            List<SqlParameter> sqlParams = new List<SqlParameter>();

            sqlParams.Add(new SqlParameter("@MenuId", ScreenId));
            try
            {
                ds = hlpr.ExecuteDataSet("GetAllowedActiontoScreen", sqlParams.ToArray());
            }
            catch (Exception ex)
            {
                SqlHelper.LogException(ex);

            }

            return ds.Tables[0];
        }
        public DateTime ConverttoDateWithTime(string sDate = "")
        {

            if (sDate == string.Empty)
            {
                sDate = DateTime.Now.ToString();
            }

            DateTime d1 = Convert.ToDateTime(sDate);
            string dd = d1.Day.ToString();
            string mm = month(d1.Month);
            string yyyy = d1.Year.ToString();


            DateTime validDate = Convert.ToDateTime(dd + "-" + mm + "-" + yyyy + " " + d1.Hour + ":" + d1.Minute + ":" + d1.Second);
            return validDate;
        }
        public string ConverttoDateWithoutTime(string sDate)
        {

            if (sDate == string.Empty)
            {
                sDate = DateTime.Now.ToString();
            }

            DateTime d1 = Convert.ToDateTime(sDate);
            string dd = d1.Day.ToString();
            string mm = month(d1.Month);
            string yyyy = d1.Year.ToString();
            string validDate = dd + "-" + mm + "-" + yyyy;
            return validDate;
        }
        private  string month(int month)
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

        public void LogException(Exception ex)
        {
            SqlHelper.LogException(ex);
        }

        public DataTable GetDataforDropDown(string sValueField, string sTextField, string sTableName)
        {
            DataTable dt = null;
          
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
                            DataRow row = dt.NewRow();
                            if (dt.Rows.Contains("ValueField") && dt.Rows.Contains("TextField"))
                            {
                                row["ValueField"] = "0";
                                row["TextField"] = "Select";
                                dt.Rows.InsertAt(row, 0);
                            }

                        }
                }
                
            }
            catch (Exception ex)
            {
                LogException(ex);
            }

            return dt;
        }

    }
}
