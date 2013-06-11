IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE 
ROUTINE_NAME = 'CheckdefaultRoleandName')
	DROP PROCEDURE CheckdefaultRoleandName
GO
--execute CheckdefaultRoleandName  null, 'role for dilip1'
CREATE PROCEDURE [dbo].[CheckdefaultRoleandName] 
(@RoleId int = NULL, @RoleName varchar(50) = NULL )
AS
BEGIN

	declare  @iNameExist int = 0 ;
	declare @iDefaultRoleExist int = 0 ; 
	
	IF (@RoleId IS NULL)
		SELECT @iNameExist = COUNT(isnull(ROLE_ID,0)) FROM  tblRoles where role_name =@RoleName 
	ELSE
		SELECT  @iNameExist = COUNT(isnull(ROLE_ID,0)) FROM  tblRoles where role_name =@RoleName and ROLE_ID <> @RoleId 		
		
		
		IF (@RoleId IS NULL)
		SELECT @iDefaultRoleExist = COUNT(isnull(ROLE_ID,0)) FROM  tblRoles where defaultRole = 'Y'
	ELSE
		SELECT  @iDefaultRoleExist = COUNT(isnull(ROLE_ID,0)) FROM  tblRoles where defaultRole = 'Y' and ROLE_ID <> @RoleId
		
	select 	@iNameExist as RoleNameCount , @iDefaultRoleExist 'DeafultRoleCount'
END
--SELECT  * FROM tblRoles 