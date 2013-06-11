IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'RemoveRoles')
	DROP PROCEDURE RemoveRoles
GO

--execute RemoveRoles 13,1
--select * from tblUserRoleConfig
CREATE PROCEDURE [dbo].[RemoveRoles] 
(
	@USER_ROLE_ID INT ,
	@Add_Userid int 
)
AS
BEGIN
	
	BEGIN TRANSACTION 
		
	INSERT INTO  Audit_tblUserRoleConfig 
	SELECT		User_Role_ID, ROLE_ID, [UID], ADD_USERID, ADD_TIMESTAMP, @Add_Userid, GETDATE(), [VERSION] 
	FROM		tblUserRoleConfig  
	WHERE		USER_ROLE_ID = @USER_ROLE_ID
	IF (@@ERROR <>0)
		 GOTO RollbackTrans
	ELSE
	BEGIN
		DELETE FROM tblUserRoleConfig WHERE USER_ROLE_iD =@USER_ROLE_ID 	
		IF (@@ERROR <>0)
		 	GOTO RollbackTrans;
	END 
		
	COMMIT TRANSACTION;
	RETURN
RollbackTrans: 
	rollback transaction 
END
