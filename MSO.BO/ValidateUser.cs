using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using MSO.DAO; 


namespace MSO.BO
{
    public class ValidateUser
    {
        RolesDAO objRolesDAO = new RolesDAO();

        public bool IsValiduser(string UserId, string password, out SessionContainer obj)
        {

            DataSet ds = null;
            bool _isValidUser = false;

            SessionContainer objSession = new SessionContainer();
            obj = objSession;
            try
            {

                _isValidUser = objRolesDAO.isValidUser(UserId, password, out ds);

                if (ds != null)
                {
                    if (ds.Tables[0].Rows.Count >0) 
                    {
                        objSession.UserId = Convert.ToString(ds.Tables[0].Rows[0]["User_Id"]);
                        int Uid = 0;

                        int.TryParse(ds.Tables[0].Rows[0]["UID"].ToString(), out Uid);
                        obj.UID = Uid;
                        objSession.EmployeeId = Convert.ToString(ds.Tables[0].Rows[0]["EmployeeId"]);
                        obj = objSession;
                    }
                }
            }
            catch (Exception ex)
            {
                //UtilityDAO. .LogException(ex);
            }

            return _isValidUser; 
           
        }
    }
}
