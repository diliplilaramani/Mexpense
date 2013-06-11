IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'InsertUpdateGrantApprovalDetails')
DROP PROCEDURE InsertUpdateGrantApprovalDetails

GO 

CREATE PROCEDURE InsertUpdateGrantApprovalDetails 
 @GrantApprovalId	VARCHAR(100)
,@SchemeId	VARCHAR(100)
,@AvailableQuantity	BIGINT
,@AllocatedOPtions	BIGINT
,@ApprovalDate VARCHAR(20)
,@GrantDescription	VARCHAR
,@UserId INT 

AS 

BEGIN 

IF NOT EXISTS(SELECT GrantApprovalId FROM tblGrantApproval WHERE GrantApprovalId = @GrantApprovalId) --INSERT
BEGIN 

INSERT INTO tblGrantApproval(
 GrantApprovalId
,SchemeId
,ApprovalDate
,AvailableQuantity
,AllocatedOPtions
,GrantDescription
,ADD_USERID
,ADD_TIMESTAMP)

VALUES(@GrantApprovalId
,@SchemeId
,@ApprovalDate
,@AvailableQuantity
,@AllocatedOPtions
,@GrantDescription
,@UserId 
,GETDATE())

END 

ELSE --UPDATE 

BEGIN 

UPDATE tblGrantApproval SET 

 SchemeId= @SchemeId
,ApprovalDate = @ApprovalDate
,AvailableQuantity= @AvailableQuantity
,AllocatedOPtions= @AllocatedOPtions
,GrantDescription= @GrantDescription
,UPDATE_USERID = @UserId
,UPDATE_TIMESTAMP = GETDATE()
WHERE GrantApprovalId= @GrantApprovalId

END 

END 





