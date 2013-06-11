IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'InsertUpdateRoles')
	DROP PROCEDURE InsertUpdateRoles
GO
CREATE PROCEDURE [dbo].[InsertUpdateRoles] (
@RoleID int = null ,
@RoleName varchar(50),
@RoleDesc varchar(max),
@UserId varchar(50),
@DefaultRole  char(1),
@SubMenu_Action_Link  Type_RoleMenuActions READONLY 
)
AS
BEGIN 

	BEGIN TRANSACTION 

	DECLARE @Role_Id int; 
	
	
	--if roleid is null then insert new record 
	IF (@RoleID IS NULL)
	BEGIN
		INSERT INTO TBLROLES (ROLE_NAME, ROLE_DESC, DefaultRole, ADD_USERID,ADD_TIMESTAMP,[VERSION])
		VALUES(@RoleName, @RoleDesc,@DefaultRole, @UserId, GETDATE(), 0) 
		IF (@@ERROR <> 0) 
			GOTO RollbackTrans
		
		SET @Role_Id = IDENT_CURRENT( 'TBLROLES')

		if (@Role_Id =0)
			GOTO RollbackTrans
			
		--SP_HELP tblRoleSubMenuConfig
		--SP_HELP TPYE 
		INSERT INTO tblRoleSubMenuConfig (SUBMENU_ID, ROLE_ID, ACTION_ID, ADD_USERID,ADD_TIMESTAMP, [VERSION])
		SELECT SUB_MENUID, @Role_Id, ACTION_ID, @UserId, GETDATE(), 0 FROM @SubMenu_Action_Link
		IF (@@ERROR <> 0) 
			GOTO RollbackTrans
		
	END
	ELSE
	BEGIN	
		INSERT INTO Audit_tblRoles SELECT * FROM TBLROLES WHERE ROLE_ID =@RoleID
		IF (@@ERROR <> 0) 
			GOTO RollbackTrans
	
		UPDATE TBLROLES 
		SET  ROLE_NAME =@RoleName, ROLE_DESC = @RoleDesc, DefaultRole = @DefaultRole, 
			 UPDATE_TIMESTAMP = GETDATE(),[VERSION] = isnull([VERSION], 0)+1 WHERE ROLE_ID = @RoleID 		
		IF (@@ERROR <> 0) 
			GOTO RollbackTrans
		
		--SP_HELP  tblRoleSubMenuConfig
		INSERT INTO Audit_tblRoleSubMenuConfig SELECT  * FROM tblRoleSubMenuConfig
		WHERE ROLE_ID = @RoleID
		IF (@@ERROR <> 0) 
			GOTO RollbackTrans
		
		DELETE FROM  tblRoleSubMenuConfig WHERE ROLE_ID = @RoleID 
		IF (@@ERROR <> 0) 
			GOTO RollbackTrans
		
		--SP_HELP tblRoleSubMenuConfig
		INSERT INTO tblRoleSubMenuConfig (SUBMENU_ID, ROLE_ID, ACTION_ID, UPDATE_USERID, UPDATE_TIMESTAMP, [VERSION])
		SELECT SUB_MENUID, @RoleID, ACTION_ID, @UserId, GETDATE(), 0 FROM @SubMenu_Action_Link
		IF (@@ERROR <> 0) 
			GOTO RollbackTrans
		
	END
	
	COMMIT TRANSACTION;
	RETURN;	
RollbackTrans:
	rollback transaction
END