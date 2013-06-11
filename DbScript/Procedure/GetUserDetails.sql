IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_NAME = 'GetUserDetails')
	DROP PROCEDURE GetUserDetails
GO
--declare @intcount int , 
--exec GetUserDetails 'dilip.sharma', 'test', @intcount 

CREATE PROCEDURE [dbo].[GetUserDetails] (
@UserId varchar(50), 
@Pwd varchar(1000)= null)
AS
BEGIN 
	DECLARE  @UserCount INT = 0 ;
		
	
	IF (@Pwd is not null)
	BEGIN
		SELECT [UID], [USER_ID], EMP_ID as employeeid,  IsFirstLogin , LoginAttempt, IsEnable, ISNULL(EMP_ID,0),
			   ISNULL(ADD_USERID,0), ISNULL(ADD_TIMESTAMP,0), ISNULL(UPDATE_USERID,0),
			   ISNULL(UPDATE_TIMESTAMP,0), ISNULL([VERSION],0),login_date
		FROM TBLUSERS WHERE [USER_ID] = @UserId
		AND		USER_PASSWORD  = @Pwd;
	END
	ELSE
	BEGIN
		SELECT [UID], [USER_ID], EMP_ID as employeeid,  IsFirstLogin , LoginAttempt, IsEnable, ISNULL(EMP_ID,0),
			   ISNULL(ADD_USERID,0), ISNULL(ADD_TIMESTAMP,0), ISNULL(UPDATE_USERID,0),
			   ISNULL(UPDATE_TIMESTAMP,0), ISNULL([VERSION],0),login_date
		FROM TBLUSERS
	END
--SP_HELP TBLUSERS
	 	
END

