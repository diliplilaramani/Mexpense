IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetGrantRegistrationDetails')
DROP PROCEDURE GetGrantRegistrationDetails
GO 

CREATE PROCEDURE GetGrantRegistrationDetails 
@grantRegId VARCHAR(50) = NULL     
,@grantApprovalId VARCHAR(100) = NULL
,@schemeName VARCHAR(50) = NULL
,@fromDate VARCHAR(20) = NULL
,@toDate VARCHAR(20) = NULL

AS   
  
BEGIN
SELECT  
  GrantRegistrationId
  ,R.GrantApprovalId
  ,ExercisePrice
  ,MerchantCode
  ,IsSAR
  ,IsPerformanceBased
  ,S.schemeName
  ,S.Schmeid
  ,GrantDate
FROM tblGrantRegistration R 
INNER JOIN tblGrantApproval G
ON R.GrantApprovalId = G.GrantApprovalId 
INNER JOIN tblschemmaster S 
ON G.SchemeId = S.Schmeid
END 