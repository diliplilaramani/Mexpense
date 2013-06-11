IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetGrantRegnList')
DROP PROCEDURE GetGrantRegnList
GO

CREATE PROCEDURE GetGrantRegnList    
(@GrantRegn NVARCHAR(100))    
AS    
BEGIN    
SELECT GrantRegistrationId FROM tblGrantRegistration WHERE GrantRegistrationId LIKE + @GrantRegn +'%'    
END