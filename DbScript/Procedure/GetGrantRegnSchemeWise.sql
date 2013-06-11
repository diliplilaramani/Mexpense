IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetGrantRegnSchemeWise')
DROP PROCEDURE GetGrantRegnSchemeWise
GO
CREATE PROCEDURE [dbo].[GetGrantRegnSchemeWise](@schemeId VARCHAR(50))  
AS  
BEGIN  
	select GETDATE();
--SELECT GrantRegistrationId,GrantRegistrationId FROM dbo.tblGrantRegistration WHERE SchemeId=@schemeId  
END  