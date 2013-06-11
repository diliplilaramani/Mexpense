IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('tblGrantApproval')  AND type ='U')
DROP TABLE tblGrantApproval
GO
CREATE TABLE tblGrantApproval
(
	GrantApprovalId	varchar(100) primary key ,
	SchemeId	varchar(100) FOREIGN KEY REFERENCES tblschemeSetup(Schemeid),
	AvailableQuantity	Bigint,
	AllocatedOPtions	Bigint,
	ApprovalDate	Date,
	GrantDescription	VARCHAR(200),
	[Approvalstatus] INT FOREIGN KEY REFERENCES  tblApprovalStatus(StatusId) null, 
	[ApprovedBy] INT FOREIGN KEY REFERENCES tblUsers([UID]) null,	
	[ApprovedOn]  datetime null, 
	[Remark]    varchar(1000) null, 
	ADD_USERID			INT FOREIGN KEY REFERENCES tblUsers([UID]) NULL,	--FK to SEC_USERS
	ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
	UPDATE_USERID		INT FOREIGN KEY REFERENCES tblUsers([UID]) NULL, --	FK to SEC_USERS
	UPDATE_TIMESTAMP	DATETIME,		
	[VERSION]		INT		
)