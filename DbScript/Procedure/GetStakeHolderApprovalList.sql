IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetStakeHolderApprovalList')
	DROP PROCEDURE GetStakeHolderApprovalList
GO
--  execute  GetStakeHolderApprovalList null, null, null, null
CREATE PROCEDURE [dbo].[GetStakeHolderApprovalList] 
(@stakeHolderApproveId varchar(100) =null, 
@stkTitile  varchar(100) = null, 
@ValidFrom datetime = null, 
@Validto datetime =null) 
AS
BEGIN
	
	SELECT approval.stakeHolderApproveId, approval.stkTitile, approval.stkDescription,
	approval.ApprovedOptions,
	approval.AdditonalOptions,dbo.GetMSODateFormat(ValidFrom) AS ValidFrom,
	dbo.GetMSODateFormat(Validto) AS Validto,approval.ADD_USERID,
	dbo.GetMSODateFormat(approval.ADD_TIMESTAMP) as ADD_TIMESTAMP,approval.UPDATE_USERID, 
	dbo.GetMSODateFormat(approval.UPDATE_TIMESTAMP) UPDATE_TIMESTAMP, 
	Addusers.[USER_ID] add_user_Id, UpdateUser.[USER_ID]   AS UPDATE_USERID FROM 
	tblStkHolderApproval approval left outer join 
	tblUsers Addusers on Addusers.UID= approval.ADD_USERID
	LEFT OUTER JOIN  tblUsers UpdateUser on UpdateUser.UID= approval.UPDATE_USERID
	where 
	(@stakeHolderApproveId is null OR approval.stakeHolderApproveId =@stakeHolderApproveId)
	AND  (@stkTitile  IS NULL OR approval.stkTitile = @stkTitile) 
	AND  (@ValidFrom IS NULL OR approval.ValidFrom = @ValidFrom )
	AND (@Validto IS NULL OR approval.Validto = @Validto)
END
--sp_help tblStkHolderApproval