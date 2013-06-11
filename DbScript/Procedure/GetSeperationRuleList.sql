IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE 
ROUTINE_NAME = 'GetSeperationRuleList')
	DROP PROCEDURE GetSeperationRuleList
GO
--  execute  GetStakeHolderApprovalList null, null, null, null
CREATE PROCEDURE [dbo].[GetSeperationRuleList] 

AS
BEGIN
	SELECT * FROM tblSepRuleDesc 
	
	SELECT * FROM tblSepRuleDesc  ---second will contain the row into column wise list of sep rule
	
	  	
END
--sp_help tblStkHolderApproval