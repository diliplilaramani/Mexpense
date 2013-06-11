using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MSO.DAO;
using System.Data;
using System.Data.SqlClient;

namespace MSO.BO
{
    public class Common
    {

            public const string  sAdd = "A";
            public const string  sEdit = "E";
            public const string  sDelete = "D";
            public const string  sView = "V";

            public const string sAddMessage = "Record Saved Successfully.";
            public const string sUpdateMessage = "Record Updaed Successfully.";
            public const string sDeleteMessage = "Record Deleted Successfully.";
            public const string sOperationFail = "System Error! Please contact administrator.";

            public const string NoAddPermission = "Sorry! You do not have Add permission";
            public const string NoEditPermission = "Sorry! You do not have Edit permission";
            public const string NoViewPermission = "Sorry! You do not have View permission";

            public const string sAddMessageFail = "Record Saved Failed! Please contact to administrator.";
            public const string sUpdateMessageFail = "Record Update Failed! Please contact to administrator.";
            public const string sDeleteMessageFail = "Fail to Delete Recode! Please contact to administrator.";
            



            
                        
             
        
            SqlHelper hlpr = new SqlHelper();
            MSO.DAO.Common objCommon = new MSO.DAO.Common();
            public DateTime ConverttoDate(string sDate = "")
            {

                return objCommon.ConverttoDateWithTime(sDate);
            }           
            public string ConverttoDateWithoutTime(string sDate)
            {
                return objCommon.ConverttoDateWithoutTime(sDate);
            }
            public SessionContainer GetAllowedActions(int screenid, SessionContainer objSession)
            {

                
                DataTable dt = new DataTable();
                string sTemp = string.Empty;
                try
                {
                    dt = objCommon.GetAllowedActions(screenid);

                    if (dt != null && dt.Rows.Count > 0)
                    {

                        if (dt.Rows[0]["ADD"] != DBNull.Value)
                        {
                            if (Convert.ToInt32(dt.Rows[0]["ADD"].ToString()) > 0)
                            {
                                objSession.isAddAccess = true;
                            }
                            else
                                objSession.isAddAccess = false;

                        }
                        else
                            objSession.isAddAccess = false;


                        if (dt.Rows[0]["EDIT"] != DBNull.Value)
                        {
                            if (Convert.ToInt32(dt.Rows[0]["EDIT"].ToString()) > 0)
                                objSession.isEditAccess = true;
                            else
                                objSession.isEditAccess = false;
                        }
                        else
                        {
                            objSession.isEditAccess = false;
                        }


                        if (dt.Rows[0]["VIEW"] != DBNull.Value)
                        {
                            if (Convert.ToInt32(dt.Rows[0]["VIEW"].ToString()) > 0)
                                objSession.isViewAccess = true;
                            else
                                objSession.isViewAccess = false;

                        }
                        else
                            objSession.isViewAccess = false;


                        if (dt.Rows[0]["DELETE"] != DBNull.Value)
                        {
                            if (Convert.ToInt32(dt.Rows[0]["DELETE"].ToString()) > 0)
                                objSession.isDeleteAccess = true;
                            else
                                objSession.isDeleteAccess = false;
                        }
                        else
                            objSession.isDeleteAccess = false;
                    }
                    else
                    {
                        objSession.isAddAccess = false;
                        objSession.isEditAccess = false;
                        objSession.isViewAccess = false;
                        objSession.isDeleteAccess = false;
                    }

                }
                catch (Exception ex)
                {
                   objCommon.LogException(ex);
                }

                return objSession;
            }

            public void LogException(Exception ex)
            {
                SqlHelper.LogException(ex);
            }


            public DataTable GetDataforDropDown(string sValueField, string sTextField, string sTableName)
            {
                return objCommon.GetDataforDropDown(sValueField, sTextField, sTableName);    
            }


            public string GeneratePwd()
            {
                return "test";  /// later we will replacde this function with actual generating password
            }

    }
}
