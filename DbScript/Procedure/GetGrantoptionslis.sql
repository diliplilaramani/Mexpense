IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetGrantoptionslist')
DROP PROCEDURE GetGrantoptionslist
GO 

CREATE PROCEDURE GetGrantoptionslist(
@schemename Varchar(100)=null,  
@grantregnid Varchar(100)=null,  
@grantoptionid varchar(50)=null)  
AS  
BEGIN  
 SELECT DISTINCT tblGrantShares.GrantsharesId,tblGrantRegistration.GrantRegistrationId, tblGrantShares.EmpployeeID, tblschemmaster.schemeName, tblGrantShares.Grantedoptions  
 FROM         tblGrantShares INNER JOIN  
        tblGrantRegistration ON tblGrantShares.GrantRegistrationId = tblGrantRegistration.GrantRegistrationId 
        INNER JOIN  tblGrantApproval ON  tblGrantApproval.GrantApprovalId = tblGrantRegistration.GrantApprovalId
        INNER JOIN tblschemmaster ON tblGrantApproval.SchemeId = tblschemmaster.Schmeid 
        
        --tblGrantRegistration.SchemeId = tblschemmaster.Schmeid  
                         
        WHERE tblschemmaster.schemeName = isnull(@schemename,tblschemmaster.schemeName)   
        AND  
        tblGrantRegistration.GrantRegistrationId=isnull(@grantregnid,tblGrantRegistration.GrantRegistrationId)   
        AND  
        tblGrantShares.GrantsharesId=ISNULL(@grantoptionid,tblGrantShares.GrantsharesId)  
  END