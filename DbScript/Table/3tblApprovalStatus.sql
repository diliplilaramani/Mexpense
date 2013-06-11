IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('tblApprovalStatus')  AND type ='U')
DROP TABLE tblApprovalStatus
GO
CREATE TABLE tblApprovalStatus
(		
		StatusId  int Primary Key , 
		StatusCode VARCHAR(3), 
		[Description] varchar(1000),
	    ADD_USERID			INT FOREIGN KEY REFERENCES tblUsers([UID]) ,	
		ADD_TIMESTAMP		DATETIME,		
		UPDATE_USERID		INT FOREIGN KEY REFERENCES tblUsers([UID]) ,	
		UPDATE_TIMESTAMP	DATETIME,		
		[VERSION]		    INT)	
Go

Insert into  tblApprovalStatus (StatusId,StatusCode, [Description])values (1,'P',  'Pending for Approval')

Insert into  tblApprovalStatus (StatusId,StatusCode, [Description])values (2,'A', 'Approved')

Insert into  tblApprovalStatus (StatusId,StatusCode, [Description])values (3,'R', 'Rejected')

--select * from tblApprovalStatus

