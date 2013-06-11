go
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('tblGrantShares')  AND type ='U')
DROP TABLE tblGrantShares
GO
CREATE TABLE [dbo].[tblGrantShares](
	[GrantsharesId] varchar (100) PRIMARY KEY,
	[EmpployeeID] varchar(200) 	FOREIGN KEY(EmpployeeID) 	REFERENCES tblEmployeeMaster(EmployeeId),
	SchemeId varchar (100) FOREIGN KEY REFERENCES tblschemeSetup (Schemeid) ,
	[GrantRegistrationId]  varchar(100)  FOREIGN KEY REFERENCES tblGrantRegistration(GrantRegistrationId), 
	[Grantedoptions] INT  ,
	[Approvalstatus] INT FOREIGN KEY REFERENCES  tblApprovalStatus(StatusId) null, 
	[ApprovedBy] INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
	[ApprovedOn]  datetime null, 
	[ADD_USERID] INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
	[ADD_TIMESTAMP] datetime ,
	[UPDATE_USERID] INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,
	[UPDATE_TIMESTAMP] datetime NULL,
	[VERSION] [int] 
) 
