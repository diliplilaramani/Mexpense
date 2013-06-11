IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetGrantshares')
DROP PROCEDURE GetGrantshares
GO
CREATE PROCEDURE GetGrantshares    
(@Granshareid VARCHAR(50))    
AS    
BEGIN    
   SELECT     tblGrantRegistration.GrantRegistrationId,tblGrantRegistration.GrantRegistrationId,tblGrantRegistration.SchemeId, tblschemmaster.schemeName, TBLEMPLOYEEMASTER.FIRST_NAME, TBLEMPLOYEEMASTER.MIDDLE_NAME,     
          tblGrantShares.GrantsharesId, tblGrantShares.Grantedoptions    
   FROM         tblGrantShares INNER JOIN    
          tblGrantRegistration ON tblGrantShares.GrantRegistrationId = tblGrantRegistration.GrantRegistrationId INNER JOIN    
          tblschemmaster ON tblGrantRegistration.SchemeId = tblschemmaster.Schmeid INNER JOIN    
          TBLEMPLOYEEMASTER ON tblGrantShares.EmpployeeID = TBLEMPLOYEEMASTER.EmpployeeID    
          WHERE GrantsharesId=@Granshareid    
END