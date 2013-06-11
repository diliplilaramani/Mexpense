IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'InsertSchemeandRules')
	DROP PROCEDURE InsertSchemeandRules
GO
--sp_help tblschemmaster
CREATE PROCEDURE [dbo].[InsertSchemeandRules] 
(
@Schmeid	VARCHAR(100),
@StakeHolderApprovalId	varchar(100),	
@schemeName	VARCHAR(100),
@schmeDescription	VARCHAR(100),
@AdjustRemaindoptions varchar(3),
@vestOverPeriod	INT,
@Vesfrequency	VARCHAR(3) ,
@vestStart	Int, 
@ExerciseStartAfter	VARCHAR(3) ,
@LockinPeriodStartfrom	int,
@periodOffset	Int,
@RatioMultipler	int,
@RatioDivisor	Int,
@Add_userId int, 
@RuleList type_schemeRule READONLY
)
AS
BEGIN
	
	begin transaction 
	begin try
		INSERT INTO tblSchemeSetup (
		Schemeid,	StakeHolderApprovalId,	schemeName,schmeDescription,AdjustRemaindoptions,vestOverPeriod,Vesfrequency,
		vestStart,ExerciseStartAfter,LockinPeriodStartfrom,periodOffset,RatioMultipler,RatioDivisor,
		ADD_USERID, ADD_TIMESTAMP,[VERSION])
		values (@Schmeid,@StakeHolderApprovalId	,@schemeName,@schmeDescription,@AdjustRemaindoptions,@vestOverPeriod,@Vesfrequency,
		@vestStart,@ExerciseStartAfter,@LockinPeriodStartfrom,@periodOffset,@RatioMultipler,@RatioDivisor,@Add_userId, getdate(),0) 
	
		INSERT INTO tblRuleAssingedonSeperation (SepRuleId, schemeId,LeavethisRule,
		VestedOptionsLiveTillExercisePeriod ,VestedOptionLiveFor ,[UnitIdVestdLiveFor] ,
		UnvestedLiveFor , [UnitIdUnvestedLiveFor] ,IsVestofUnvestedOptionsOnSepratonDate)
		SELECT SepRuleId,@Schmeid,LeavethisRule, VestedOptionsLiveTillExercisePeriod ,
		VestedOptionLiveFor ,[UnitIdVestdLiveFor] ,UnvestedLiveFor , [UnitIdUnvestedLiveFor] ,
		IsVestofUnvestedOptionsOnSepratonDate 	  from @RuleList  
		commit transaction 
	end try
	begin catch
		rollback transaction 
	end catch
--sp_help tblschemmaster
END

--sp_help tblRuleAssingedonSeperation

