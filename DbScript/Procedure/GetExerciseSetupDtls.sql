IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetExerciseSetupDtls')
DROP PROCEDURE GetExerciseSetupDtls
GO 
CREATE PROCEDURE [dbo].[GetExerciseSetupDtls]  
(@CompanyId int)  
AS   
BEGIN   
  SELECT CompanyId  
      ,ExerciseHeader  
      ,ExerciseFooter  
      ,FIFO  
      ,Allowexrcisemultiplevest  
      ,Restricttocompletevest  
      ,ExerciseDenomination  
      ,AllowExercisesimulation  
      ,SendCancellationalert  
      ,IsAutomatedExercise  
      ,CnciderTraveldtls  
      ,IstrustIntegrated  
      ,IsPaymentGatewayIntegrated  
      ,IsFundingIntegrated  
      ,IsCashlessIntegrated  
      ,IsSendvestAlertBefore  
      ,SendvestAlertBeforeDays  
      ,SendvestAlertBeforeRmainderDays  
      ,IsSendAlertAfter  
      ,SendvestAlertAfterDays  
      ,SendvestAlertAfterRmainderDays  
      ,IsSendLapseAlertBefore  
      ,SendLapseAlertBeforeDays  
      ,SendLapseAlertBeforeRmainderDays  
      ,SendExerciseApprovalstatus  
      ,IsNSEorBSE  
      ,SamedayoPrevsDay  
      ,SharepricetobeConcidered  
      ,Createdby  
      ,Createddate  
      ,Updateby  
      ,UpdateDtate  
  FROM tblExercisesetup  
WHERE CompanyId=@CompanyId  
END    
GO
--sp_help tblExercisesetup
