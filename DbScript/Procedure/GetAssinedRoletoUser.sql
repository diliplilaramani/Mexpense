IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetAssinedRoletoUser')
	DROP PROCEDURE GetAssinedRoletoUser
GO
-- exec GetAssinedRoletoUser 'testuser' 
CREATE PROCEDURE [dbo].[GetAssinedRoletoUser] (@UserId varchar(100))
AS
BEGIN 

	 declare @UID int; 
	 
	SELECT	USERS.EMP_ID, (emp.FirstName + ' ' +  emp.MiddleInitial  + ' ' +  emp.LastName) AS EMP_NAME ,USERS.[UID],
	 USERS.[USER_ID] AS [USER_ID],USERS.IsEnable,USERS.IsFirstLogin,USERS.LoginAttempt
	FROM TBLUSERS    USERS  LEFT OUTER JOIN  TBLEMPLOYEEMASTER EMP ON EMP.employeeid = USERS.emp_id
	WHERE USERS.[USER_ID] = @UserId
	
	SELECT @UID = UID  FROM  TBLUSERS    USERS  WHERE USERS.[USER_ID] = @UserId
	

	SELECT roleConfig.User_Role_ID, roleConfig.UID,roleConfig.Role_Id, Roles.ROLE_NAME, Roles.ROLE_DESC 
	FROM			tblUserRoleConfig roleConfig 
	LEFT OUTER JOIN tblRoles  Roles ON Roles.ROLE_ID =roleConfig.Role_id
	where roleConfig.UID = @UID
	
	IF (@UID >0)		
		SELECT  * FROM  tblRoles WHERE  ROLE_ID NOT IN (select ROLE_ID from tblUserRoleConfig where UID = @UID)
	ELSE
		SELECT  * FROM  tblRoles 
	
	--IN CASE OF NEW USER RETURN THE DATASET SO THAT CAN BE BIND EASILY TO GRID
	SELECT ''  AS EMP_ID, '' AS EMP_NAME ,0 AS  [UID], @UserId AS [USER_ID]	 
--sp_help tblemployeemaster	 	
END