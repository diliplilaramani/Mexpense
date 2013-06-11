IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetGrantApprovalDetails')
DROP PROCEDURE GetGrantApprovalDetails
GO 

CREATE PROCEDURE GetGrantApprovalDetails 
@grantApprovalId VARCHAR(100) = NULL 
AS 

BEGIN 

SELECT 
g.GrantApprovalId
,g.SchemeId
,g.AvailableQuantity
,g.GrantDescription
,dbo.GetMSODateFormat(g.ApprovalDate) AS ApprovalDate
 FROM tblGrantApproval g WHERE GrantApprovalId = ISNULL(@grantApprovalId,GrantApprovalId)

END 



