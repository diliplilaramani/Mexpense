using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace MSO.DAO
{
   public class RolesDAO
    {
       SqlHelper _SqlHelper = new SqlHelper();
       public DataSet GetMenuListasPerRoles(string UserId)
       {
           DataSet ds = null;
           try
           {
               string spName = "GetAssinedMenuListAsperRole";
               List<SqlParameter> sqlParams = new List<SqlParameter>();
               sqlParams.Add(new SqlParameter("@UserId", UserId));
               ds = _SqlHelper.ExecuteDataSet(spName, sqlParams.ToArray());
           }

           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }
           return ds;

       }
       public DataSet GetSubMenuList(int MainMenuId)
       {
           DataSet ds = null;
           try
           {
               List<SqlParameter> sqlParams = new List<SqlParameter>();
               if (MainMenuId > 0)
                   sqlParams.Add(new SqlParameter("@MainMenu_Id", MainMenuId));
               ds = _SqlHelper.ExecuteDataSet("GetMenuSubMenuList", sqlParams.ToArray());
           }

           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }
           return ds;

       }
       public DataSet GetRolesDeatails(int RoleId, string RoleName)
       {

           DataSet ds = null;
           try
           {
               List<SqlParameter> sqlParams = new List<SqlParameter>();
               if (RoleId > 0)
                   sqlParams.Add(new SqlParameter("@RoleId", RoleId));


               if (RoleName.ToString().Trim().Length > 0)
                   sqlParams.Add(new SqlParameter("@RoleName", RoleName));

               ds = _SqlHelper.ExecuteDataSet("GetAssignedMenutoRole", sqlParams.ToArray());
           }

           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }
           return ds;

       }
       public DataSet GetDefaultRole()
       {

           DataSet ds = null;
           try
           {
               List<SqlParameter> sqlParams = new List<SqlParameter>();
               ds = _SqlHelper.ExecuteDataSet("GetDefaultRole", sqlParams.ToArray());
           }

           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }
           return ds;

       }
       public DataSet GetAssignedMenutoRole(int RoleId, string RoleName )
       {

           DataSet ds = null;
           try
           {
               List<SqlParameter> sqlParams = new List<SqlParameter>();
               if (RoleId > 0)
                   sqlParams.Add(new SqlParameter("@RoleId", RoleId));


               if (RoleName.ToString().Trim().Length > 0)
                   sqlParams.Add(new SqlParameter("@RoleName", RoleName));

               ds = _SqlHelper.ExecuteDataSet("GetAssignedMenutoRole", sqlParams.ToArray());
           }

           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }
           return ds;

       }
       public DataSet GetActionIds()
       {
           DataSet ds = null;
           try
           {
               List<SqlParameter> sqlParams = new List<SqlParameter>();
               ds = _SqlHelper.ExecuteDataSet("GetActionIds", sqlParams.ToArray());
           }

           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }
           return ds;

       }
       public int SaveUpdateRoles(int RoleId, string sRoleName, string sRoleDesc, string DefaultRole, int UID, DataTable dtmenu_actionsId)
       {
           int ret = -1;

           try
           {
                List<SqlParameter> sqlParams = new List<SqlParameter>();

               if (RoleId> 0)
                sqlParams.Add(new SqlParameter("@RoleID", RoleId));

                sqlParams.Add(new SqlParameter("@RoleName", sRoleName));
                sqlParams.Add(new SqlParameter("@RoleDesc", sRoleDesc));
                sqlParams.Add(new SqlParameter("@UserId", UID));
                sqlParams.Add(new SqlParameter("@DefaultRole", DefaultRole));
              
                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@SubMenu_Action_Link";
                parameter.SqlDbType = System.Data.SqlDbType.Structured;
                parameter.Value = dtmenu_actionsId;

                sqlParams.Add(parameter);
                ret =  _SqlHelper.ExcecuteNonQuery("InsertUpdateRoles" ,sqlParams.ToArray());
           }
           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }

           return ret;
       }
       public bool isValidUser(string UserId, string password, out DataSet ds)
       {
           bool isValidUser = false;

           List<SqlParameter> sqlParams = new List<SqlParameter>();
           sqlParams.Add(new SqlParameter("@UserId", UserId));
           sqlParams.Add(new SqlParameter("@Pwd", password));
           
           ds = _SqlHelper.ExecuteDataSet("GetUserDetails", sqlParams.ToArray());
           if (ds!= null)
           {
               if (ds.Tables[0].Rows.Count >0)
                    isValidUser = true;
           }

           return isValidUser;
       }
       public bool isRoleNameAlreadyExist(int RoleId, string RoleName, out bool isDeafaultRoleExist)
        {
            bool _isRoleNameAlreadyExist = false;
            isDeafaultRoleExist = false;
            DataSet ds = null;

            try
            {

                List<SqlParameter> sqlParams = new List<SqlParameter>();
                if (RoleId> 0)
                    sqlParams.Add(new SqlParameter("@UserId", RoleId));

                if (RoleName.Trim().Length >0)
                    sqlParams.Add(new SqlParameter("@RoleName", RoleName));

                ds = _SqlHelper.ExecuteDataSet("CheckdefaultRoleandName", sqlParams.ToArray());

                if (ds != null)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToInt32(ds.Tables[0].Rows[0][0]) > 0)
                        {
                            _isRoleNameAlreadyExist = true;
                        }

                        if (Convert.ToInt32(ds.Tables[0].Rows[0][1]) > 0)
                        {
                            isDeafaultRoleExist = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                SqlHelper.LogException(ex);
            }

            return _isRoleNameAlreadyExist;
        }
       public DataSet GetAssignedRolestoUser(string User_Id)
       {
           DataSet ds = null;
           List<SqlParameter> sqlParams = new List<SqlParameter>();
           sqlParams.Add(new SqlParameter("@UserId", User_Id));
           ds = _SqlHelper.ExecuteDataSet("GetAssinedRoletoUser", sqlParams.ToArray());           
           return ds;   
       }


       public int  RemoveRoles(int User_Role_ID, int Remove_by_UID)
       {
           int ret = -1;
           try
           {
               List<SqlParameter> sqlParams = new List<SqlParameter>();
               sqlParams.Add(new SqlParameter("@User_Role_ID", User_Role_ID));
              
               sqlParams.Add(new SqlParameter("@Add_Userid", Remove_by_UID  ));
               ret = _SqlHelper.ExcecuteNonQuery("RemoveRoles", sqlParams.ToArray());
           }
           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }

           return ret;
       }

       public int CreateUserandInsertRoles(int UID,  string User_Id, string EmpId, string Password, int RoleId, int Add_userId )
       {

           int ret = -1;
           List<SqlParameter> sqlParams = new List<SqlParameter>();

           try
           {
               if (User_Id != string.Empty) 
                   sqlParams.Add(new SqlParameter("@User_Id", User_Id));

               if (UID>0)
                   sqlParams.Add(new SqlParameter("@UIDPK", UID));

               if (EmpId != string.Empty ) 
                    sqlParams.Add(new SqlParameter("@EmpId", EmpId));
               
               if (Password!= string.Empty)
                sqlParams.Add(new SqlParameter("@Password", Password));



               sqlParams.Add(new SqlParameter("@RoleId", RoleId));
               sqlParams.Add(new SqlParameter("@Add_Userid",Add_userId));

               ret = _SqlHelper.ExcecuteNonQuery("CreateUserandInsertRoles", sqlParams.ToArray());
           }
           catch (Exception ex)
           {
               SqlHelper.LogException(ex);
           }

           return ret;

           
       }

       public bool isUserIdExist(string UserId)
       {
           bool _isUserIdExist = false;
           DataSet ds = null;

           List<SqlParameter> sqlParams = new List<SqlParameter>();
           sqlParams.Add(new SqlParameter("@UserId", UserId));
           ds = _SqlHelper.ExecuteDataSet("GetUserDetails", sqlParams.ToArray());
           if (ds != null)
           {
               if (ds.Tables[0].Rows.Count > 0)
                   _isUserIdExist = true;
           }
           return _isUserIdExist;
       }

       public bool isValidEmployeeId(string EmpId)
       {
           bool _isValidEmployeeId = false;
           DataSet ds = null;

           List<SqlParameter> sqlParams = new List<SqlParameter>();
           sqlParams.Add(new SqlParameter("@EmpId", EmpId));
           ds = _SqlHelper.ExecuteDataSet("EmployeeExist", sqlParams.ToArray());
           if (ds != null)
           {
               if (ds.Tables[0].Rows.Count > 0)
                   _isValidEmployeeId = true;
           }
           return _isValidEmployeeId;
       }


     
    

    }
}
