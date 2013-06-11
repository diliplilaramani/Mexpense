IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'CreateUserandInsertRoles')
	DROP PROCEDURE CreateUserandInsertRoles
GO
--  execute  CreateUserandInsertRoles 'dilip', null, null, 'test' ,1, 1
CREATE PROCEDURE [dbo].[CreateUserandInsertRoles] 
(
@User_Id varchar(100) = null,
@UIDPK int = null, 
@EmpId varchar(100) =null,
@Password varchar(1000)= null,
@RoleId  int ,
@Add_Userid int
)
AS
BEGIN 
	

	DECLARE @UID   int = 0 ;
	BEGIN TRANSACTION; 
	 			
	IF (@UIDPK is null ) 
	BEGIN
		execute CreateUser @User_Id,@EmpId,@Password,@Add_Userid,   @UID OUT 
		PRINT @UID;
		IF (@UID =0)
			goto RollBackTrans
 	END
	ELSE
	BEGIN
		SELECT  @UID= [UID] FROM TBLUSERS  WHERE USER_ID = @User_Id   
	END
	
	IF (@UID > 0)
	BEGIN
		INSERT INTO  tblUserRoleConfig (Role_id, [UID], ADD_USERID, ADD_TIMESTAMP, [VERSION])
		VALUES (@RoleId,@UID,@Add_Userid, GETDATE(), 0)  
		if (@@ERROR <>0)
			GOTO RollBackTrans
	End	
	ELSE
		GOTO RollBackTrans
		
	COMMIT TRANSACTION; 
	RETURN;
RollBackTrans: 
	rollback transaction 
END

