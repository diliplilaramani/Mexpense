IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'UpdateExerciseSetup')
DROP PROCEDURE UpdateExerciseSetup
GO 


CREATE PROCEDURE [dbo].[UpdateExerciseSetup] @ExSetuplXML NTEXT
AS 
BEGIN

DECLARE @handle INT

EXEC sp_xml_preparedocument @handle out,@ExSetuplXML
UPDATE  tblExercisesetup
SET

ExerciseHeader=dest.ExerciseHeader,
ExerciseFooter=dest.ExerciseFooter,
FIFO= char(dest.FIFO) ,
Allowexrcisemultiplevest=char(dest.Allowexrcisemultiplevest)  ,
Restricttocompletevest=char(dest.Restricttocompletevest) ,
ExerciseDenomination =char(dest.ExerciseDenomination) ,
AllowExercisesimulation =char(dest.AllowExercisesimulation) ,
SendcancellationAlert =char(dest.SendcancellationAlert) ,
IsAutomatedExercise = char(dest.IsAutomatedExercise),
CnciderTraveldtls =char(dest.CnciderTraveldtls) ,
IstrustIntegrated =char(dest.IstrustIntegrated),
IsPaymentGatewayIntegrated=char(dest.IsPaymentGatewayIntegrated) ,
IsFundingIntegrated = char(dest.IsFundingIntegrated),
IsCashlessIntegrated=char(dest.IsCashlessIntegrated),
IsSendvestAlertBefore=CHAR(dest.IsSendvestAlertBefore),
SendvestAlertBeforeDays=dest.SendvestAlertBeforeDays ,
SendvestAlertBeforeRmainderDays=dest.SendvestAlertBeforeRmainderDays ,
IsSendAlertAfter=char(dest.IsSendvestAlertAfter),
SendvestAlertAfterDays=dest.SendvestAlertAfterDays,
SendvestAlertAfterRmainderDays=dest.SendvestAlertAfterRmainderDays ,
IsSendLapseAlertBefore=char(dest.IsSendLapseAlertBefore) ,
SendLapseAlertBeforeDays=dest.SendLapseAlertBeforeDays ,
SendLapseAlertBeforeRmainderDays=dest.SendLapseAlertBeforeRmainderDays,
SendExerciseApprovalstatus=char(dest.SendExerciseApprovalstatus) ,
IsNSEorBSE=CHAR(dest.IsNSEorBSE) ,
SamedayoPrevsDay=char(dest.SamedayoPrevsDay) ,
SharepricetobeConcidered=char(dest.SharepricetobeConcidered) ,
Createdby=dest.Createdby ,
Createddate=dest.Createddate

FROM OPENXML (@handle,'/ArrayOfExerciseSetupDTO/ExerciseSetupDTO',2)
WITH(companyid INT,
ExerciseHeader VARCHAR(200) ,
ExerciseFooter VARCHAR(200),
FIFO  CHAR(2),
Allowexrcisemultiplevest  CHAR(2),
Restricttocompletevest  CHAR(2),
ExerciseDenomination  CHAR(2),
AllowExercisesimulation  CHAR(2),
SendcancellationAlert  CHAR(2),
CnciderTraveldtls  CHAR(2),
IsAutomatedExercise  CHAR(2),
IstrustIntegrated  CHAR(2),
IsPaymentGatewayIntegrated CHAR(2),
IsFundingIntegrated  CHAR(2),
IsCashlessIntegrated CHAR(2),
IsSendvestAlertBefore CHAR(2),
SendvestAlertBeforeDays INT,
SendvestAlertBeforeRmainderDays INT,
IsSendvestAlertAfter CHAR(2),
SendvestAlertAfterDays INT,
SendvestAlertAfterRmainderDays INT ,
IsSendLapseAlertBefore  CHAR(2),
SendLapseAlertBeforeDays INT,
SendLapseAlertBeforeRmainderDays INT,
SendExerciseApprovalstatus CHAR(2),
IsNSEorBSE CHAR(2),
SamedayoPrevsDay CHAR(2),
SharepricetobeConcidered CHAR(2),
Createdby  INT,
Createddate DATE
) dest
--WHERE CompanyId=dest.companyid ;
 EXEC SP_XML_REMOVEDOCUMENT @handle
 
END 

   
	





GO

