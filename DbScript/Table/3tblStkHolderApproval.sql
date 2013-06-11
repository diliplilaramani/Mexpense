
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.tblStkHolderApproval') 
AND type ='U')  DROP TABLE tblStkHolderApproval
GO
CREATE TABLE [dbo].[tblStkHolderApproval](
	[stakeHolderApproveId] [varchar](100) primary key Not NULL,
	[stkTitile] [varchar](100) NULL,
	[stkDescription] [varchar](100) NULL,
	[ApprovedOptions] [bigint] NULL,
	[AdditonalOptions] [bigint] NULL,
	[ValidFrom] [date] NULL,
	[Validto] [date] NULL,
	[Approvalstatus] INT FOREIGN KEY REFERENCES  tblApprovalStatus(StatusId) null, 
	[ApprovedBy] INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
	[ApprovedOn]  datetime null, 
	[Remark]    varchar(1000) null, 
	ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
	ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
	UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
	UPDATE_TIMESTAMP	DATETIME,		
	[VERSION]		INT		

) 
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.Audit_tblStkHolderApproval') 
AND type ='U')  DROP TABLE Audit_tblStkHolderApproval
GO
CREATE TABLE [dbo].[Audit_tblStkHolderApproval](
	[stakeHolderApproveId] [varchar](100) primary key Not NULL,
	[stkTitile] [varchar](100) NULL,
	[stkDescription] [varchar](100) NULL,
	[ApprovedOptions] [bigint] NULL,
	[AdditonalOptions] [bigint] NULL,
	[ValidFrom] [date] NULL,
	[Validto] [date] NULL,
	[Approvalstatus] INT FOREIGN KEY REFERENCES  tblApprovalStatus(StatusId) null, 
	[ApprovedBy] INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
	[ApprovedOn]  datetime null, 
	[Remark]    varchar(1000) null, 
	ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
	ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
	UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
	UPDATE_TIMESTAMP	DATETIME,		
	[VERSION]		INT		

) 
