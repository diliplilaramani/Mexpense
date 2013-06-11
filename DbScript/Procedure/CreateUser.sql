IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'CreateUser')
	DROP PROCEDURE CreateUser
GO
CREATE PROCEDURE [dbo].[CreateUser] 
(
@User_Id varchar(100), 
@EmpId varchar(100) =null,
@Password varchar(1000),
@Add_Userid int , 
@UID  int  out
)
AS
BEGIN 
		
	INSERT INTO  tblUsers
				([USER_ID], USER_PASSWORD,IsFirstLogin,	LoginAttempt,IsEnable, EMP_ID,  ADD_USERID,ADD_TIMESTAMP)
			values(@User_Id,@Password, 'Y', 0, 'Y', @EmpId,@Add_Userid, getdate()) 
		if (@@error<> 0)
			set @UID = 0 ;
		else
			SELECT  @UID = SCOPE_IDENTITY()
END