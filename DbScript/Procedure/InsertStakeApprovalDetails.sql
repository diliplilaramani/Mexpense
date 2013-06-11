
-- =============================================
-- Author:		<Dilip Sharma>
-- Create date: <18-Jun-2012>
-- Description:	<PROCDEURE WILL RETURN  LIST OF APPROVAL PRESENT IN TABLE>
--execute dbo.InsertStakeApprovalDetails '@stkApprovalXML'
-- =============================================
IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_NAME='InsertStakeApprovalDetails' AND ROUTINE_TYPE = 'PROCEDURE')
BEGIN 
DROP PROCEDURE InsertStakeApprovalDetails 
END
GO
CREATE PROCEDURE InsertStakeApprovalDetails 
(@stakeHolderApproveId varchar(100), 
@stkTitile  varchar(100),
@stkDescription varchar(100),
@ApprovedOptions int,  
@AdditonalOptions int, 
@ValidFrom datetime, 
@Validto datetime,
@ADD_USERID int, 
@updtFlag int = NULL
)
AS 
BEGIN


IF (@updtFlag IS NULL)
BEGIN
	INSERT INTO tblStkHolderApproval (stakeHolderApproveId, stkTitile, stkDescription, ApprovedOptions, 
			AdditonalOptions,ValidFrom, Validto, ADD_USERID, ADD_TIMESTAMP,[VERSION]) 
		VALUES (@stakeHolderApproveId, @stkTitile, @stkDescription, @ApprovedOptions, 
			@AdditonalOptions,@ValidFrom, @Validto, @ADD_USERID, GETDATE(),0) 		
END 
ELSE
BEGIN 
	INSERT INTO Audit_tblStkHolderApproval 
				(stakeHolderApproveId, stkTitile, stkDescription, ApprovedOptions, 
				AdditonalOptions,ValidFrom, Validto, ADD_USERID, ADD_TIMESTAMP,[VERSION], 
				UPDATE_USERID,UPDATE_TIMESTAMP) 
	SELECT	    stakeHolderApproveId, stkTitile, stkDescription, ApprovedOptions, 
				AdditonalOptions,ValidFrom, Validto, ADD_USERID, ADD_TIMESTAMP ,[VERSION], @ADD_USERID, 
				GETDATE() FROM tblStkHolderApproval
	UPDATE tblStkHolderApproval  set  AdditonalOptions = @AdditonalOptions, [VERSION]= ISNULL([VERSION],0)+1 
	WHERE stakeHolderApproveId = @stakeHolderApproveId
END 

 
END 

   
	




