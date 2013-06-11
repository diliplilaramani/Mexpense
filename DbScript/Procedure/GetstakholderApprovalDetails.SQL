
-- =============================================
-- Author:		<Dilip Sharma>
-- Create date: <18-Jun-2012>
-- Description:	<PROCDEURE WILL RETURN  LIST OF APPROVAL PRESENT IN TABLE>
--execute dbo.GetstakholderApprovalDetails '','',''
-- =============================================
IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_NAME='GetstakholderApprovalDetails' AND ROUTINE_TYPE = 'PROCEDURE')
BEGIN 
DROP PROCEDURE GetstakholderApprovalDetails 
END
GO
CREATE PROCEDURE [dbo].[GetstakholderApprovalDetails]
(@stkApproveId varchar (100),  
@ValidFrom  varchar (20), 
@Validto varchar (20))
AS 
BEGIN 
	 DECLARE @fromDate DATE;
	 DECLARE @toDate DATE;
	 
	
	if (@stkApproveId='')
		begin
			set @stkApproveId =NULL;
			print 'test'
		end 
		
		
	if (@ValidFrom='')
		begin
			print 'test1'
			set @fromDate =NULL;
			
			
		end 
		ELSE
			SELECT @fromDate = CONVERT(DATE, @ValidFrom, 106)
	if (@Validto = '')
		begin
			print 'test2'
			set @toDate = NULL;
		end 
		ELSE
		begin
			SELECT @toDate = CONVERT(DATE, @Validto, 106)
		end
	select   stakeHolderApproveId, stkTitile, stkDescription, ApprovedOptions, 
	AdditonalOptions, dbo.GetMSODateFormat(ValidFrom) as ValidFrom, dbo.GetMSODateFormat(Validto) as Validto, ADD_USERID, dbo.GetMSODateFormat(ADD_TIMESTAMP) as Createddate,
	UPDATE_USERID, 	dbo.GetMSODateFormat(UPDATE_TIMESTAMP) as UpdateDtate  from tblStkHolderApproval
	where( (@stkApproveId IS NULL OR stakeHolderApproveId = stakeHolderApproveId) 
	AND (@fromDate IS NULL OR ValidFrom = @fromDate) 
	AND (@toDate IS NULL OR Validto =@toDate))
	
	



	--sp_help tblStkHolderApproval
END 

