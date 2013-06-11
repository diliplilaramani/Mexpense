IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('tblExercisesetup') 
AND type ='U')
DROP TABLE  tblExercisesetup
GO

CREATE TABLE [dbo].[tblExercisesetup](
	[CompanyId] [int] NULL,
	[ExerciseHeader] [varchar](200) NULL,
	[ExerciseFooter] [varchar](200) NULL,
	[FIFO] [char](1) NULL,
	[Allowexrcisemultiplevest] [char](1) NULL,
	[Restricttocompletevest] [char](1) NULL,
	[ExerciseDenomination] [char](1) NULL,
	[AllowExercisesimulation] [char](1) NULL,
	[SendCancellationalert] [char](1) NULL,
	[IsAutomatedExercise] [char](1) NULL,
	[CnciderTraveldtls] [char](1) NULL,
	[IstrustIntegrated] [char](1) NULL,
	[IsPaymentGatewayIntegrated] [char](1) NULL,
	[IsFundingIntegrated] [char](1) NULL,
	[IsCashlessIntegrated] [char](1) NULL,
	[IsSendvestAlertBefore] [char](1) NULL,
	[SendvestAlertBeforeDays] [int] NULL,
	[SendvestAlertBeforeRmainderDays] [int] NULL,
	[IsSendAlertAfter] [char](1) NULL,
	[SendvestAlertAfterDays] [int] NULL,
	[SendvestAlertAfterRmainderDays] [int] NULL,
	[IsSendLapseAlertBefore] [char](1) NULL,
	[SendLapseAlertBeforeDays] [int] NULL,
	[SendLapseAlertBeforeRmainderDays] [int] NULL,
	[SendExerciseApprovalstatus] [char](1) NULL,
	[IsNSEorBSE] [char](1) NULL,
	[SamedayoPrevsDay] [char](1) NULL,
	[SharepricetobeConcidered] [char](1) NULL,
	[Createdby] [int] NULL,
	[Createddate] [date] NULL,
	[Updateby] [int] NULL,
	[UpdateDtate] [date] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

