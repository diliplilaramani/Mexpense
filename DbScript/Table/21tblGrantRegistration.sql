--drop table tblGrantRegistration
go
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('tblGrantRegistration')  AND type ='U')
DROP TABLE tblGrantRegistration
GO
CREATE TABLE [dbo].[tblGrantRegistration](
	[GrantRegistrationId] varchar(100) PRIMARY KEY,
	[GrantApprovalId] varchar(100) FOREIGN KEY REFERENCES  tblGrantApproval(GrantApprovalId) ,
	[ExercisePrice] numeric(10, 2) NULL,
	[MerchantCode] varchar(200) NULL,
	[IsSAR] [char](1) NULL,
	[IsPerformanceBased] char(1) NULL,
	[Approvalstatus] INT FOREIGN KEY REFERENCES  tblApprovalStatus(StatusId) null, 
	[ApprovedBy] INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
	[ApprovedOn]  datetime null, 
	[Remark]    varchar(1000) null, 
	[ADD_USERID]  INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
	[ADD_TIMESTAMP] [datetime] NULL,
	[UPDATE_USERID]  INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
	[UPDATE_TIMESTAMP] [datetime] NULL,
	[VERSION] [int] NULL)
GO



