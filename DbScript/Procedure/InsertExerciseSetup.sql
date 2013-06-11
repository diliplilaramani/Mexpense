IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('InsertExerciseSetup') 
AND type ='P')
DROP PROCEDURE  InsertExerciseSetup
GO

CREATE PROCEDURE [dbo].[InsertExerciseSetup] @ExSetuplXML NTEXT
AS 
BEGIN

DECLARE @handle INT

EXEC sp_xml_preparedocument @handle out,@ExSetuplXML
INSERT INTO tblExercisesetup(
CompanyId,
ExerciseHeader ,
ExerciseFooter,
FIFO ,
Allowexrcisemultiplevest  ,
Restricttocompletevest ,
ExerciseDenomination  ,
AllowExercisesimulation  ,
SendcancellationAlert  ,
IsAutomatedExercise  ,
CnciderTraveldtls  ,
IstrustIntegrated ,
IsPaymentGatewayIntegrated ,
IsFundingIntegrated ,
IsCashlessIntegrated,
IsSendvestAlertBefore,
SendvestAlertBeforeDays ,
SendvestAlertBeforeRmainderDays ,
IsSendAlertAfter,
SendvestAlertAfterDays,
SendvestAlertAfterRmainderDays ,
IsSendLapseAlertBefore ,
SendLapseAlertBeforeDays ,
SendLapseAlertBeforeRmainderDays,
SendExerciseApprovalstatus ,
IsNSEorBSE ,
SamedayoPrevsDay ,
SharepricetobeConcidered ,
Createdby ,
Createddate
 )
select companyid,
ExerciseHeader ,
ExerciseFooter,
char(FIFO),
char(Allowexrcisemultiplevest)  ,  --IsSendvestAlertAfter
char(Restricttocompletevest) ,
char(ExerciseDenomination)  ,
char(AllowExercisesimulation),
char(SendcancellationAlert)  ,
char(IsAutomatedExercise)  ,
char(CnciderTraveldtls)  ,
char(IstrustIntegrated) ,
char(IsPaymentGatewayIntegrated) ,
char(IsFundingIntegrated) ,
char(IsCashlessIntegrated),
char(IsSendvestAlertBefore),
SendvestAlertBeforeDays ,
SendvestAlertBeforeRmainderDays ,
char(IsSendvestAlertAfter),
SendvestAlertAfterDays,
SendvestAlertAfterRmainderDays ,
char(IsSendLapseAlertBefore) ,
SendLapseAlertBeforeDays ,
SendLapseAlertBeforeRmainderDays,
char(SendExerciseApprovalstatus) ,
char(IsNSEorBSE) ,
char(SamedayoPrevsDay) ,
char(SharepricetobeConcidered) ,
Createdby ,
GETDATE()
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
);
 EXEC SP_XML_REMOVEDOCUMENT @handle
 
END 

   
	






GO

