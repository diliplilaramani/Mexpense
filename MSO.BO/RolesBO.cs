using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MSO.DAO;

namespace MSO.BO
{
    public class RolesBO
    {
        RolesDAO role = new RolesDAO();


        public DataSet GetMenuListasPerRoles(string UserId)
        {
            return role.GetMenuListasPerRoles(UserId);
        }

        public DataSet GetRolesDeatails(int RoleId, string RoleName)
        {
            return role.GetRolesDeatails(RoleId, RoleName);
        }

        public DataSet GetAssignedMenutoRole(int RoleId, string RoleName)
        {
            return role.GetAssignedMenutoRole(RoleId, RoleName);
        }



        public DataSet GetDefaultRole()
        {
            return role.GetDefaultRole();
        }




        public DataSet GetSubMenuList(int MainMenuId)
        {

            return role.GetSubMenuList(MainMenuId);
        }

        public DataSet GetActionIds()
        {
            DataSet ds = null;
            ds = role.GetActionIds();
            return ds;
        }

        public int SaveUpdateRoles(int RoleId, string sRoleName, string sRoleDesc, string DefaultRole, int UID, DataTable dtmenu_actionsId)
        {
            int ret = -1;
            ret = role.SaveUpdateRoles(RoleId, sRoleName, sRoleDesc, DefaultRole, UID, dtmenu_actionsId);
            return ret;

        }

        public bool isRoleNameAlreadyExist(int RoleId, string RoleName, out bool isDeafaultRoleExist)
        {
            return role.isRoleNameAlreadyExist(RoleId, RoleName, out isDeafaultRoleExist);
        }

        public DataSet GetAssignedRolestoUser(string User_Id)
        {
            DataSet ds = null;
            ds = role.GetAssignedRolestoUser(User_Id);
            return ds;
        }

        public bool isUserIdExist(string User_id)
        {
            bool _isUserIdExist = false;
            _isUserIdExist = role.isUserIdExist(User_id);

            return _isUserIdExist;

        }

        public bool isValidEmployeeId(string EmpId)
        {
           return role.isValidEmployeeId(EmpId);           
        }



        public int CreateUserandInsertRoles(int UID,  string User_Id, string EmpId,  int RoleId, int Add_userId )
        
        {
            Common objCommon = new Common();
            string Password = string.Empty;
            int ret = -1;
            string _EmpId = string.Empty;
            string _User_Id = string.Empty; 

            if (EmpId != "&nbsp;")
            {
                _EmpId = EmpId;
            }

            if (User_Id != "&nbsp;")
            {
                _User_Id = User_Id;
            }

            try
            {
                Password = objCommon.GeneratePwd();
                ret = role.CreateUserandInsertRoles(UID, _User_Id, _EmpId, Password, RoleId, Add_userId);
            }
            catch (Exception ex)
            {
                objCommon.LogException(ex);   
            }

            return ret;
        }

        public int RemoveRoles(int User_Role_ID, int Remove_by_UID)
        {
            return role.RemoveRoles(User_Role_ID, Remove_by_UID);
        }

    }
}