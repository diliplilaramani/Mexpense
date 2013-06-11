IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.tblAdjustResidueList') 
AND type ='U') DROP TABLE tblAdjustResidueList
go
CREATE TABLE tblAdjustResidueList(
Code			VARCHAR(3) Primary Key,	--Type could First, Last Etc
Name			VARCHAR(10),
[Description]	VARCHAR	(50),	
ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
	ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
	UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
	UPDATE_TIMESTAMP	DATETIME,		
	[VERSION]		INT		
)
GO
Insert Into tblAdjustResidueList (Code,Name, [Description],ADD_USERID, ADD_TIMESTAMP,[VERSION])
values ('F', 'First','For First', NULL,GETDATE(),0)
go
Insert Into tblAdjustResidueList (Code,Name, [Description],ADD_USERID, ADD_TIMESTAMP,[VERSION])
values ('L', 'Last',  'For Last', null,GETDATE(),0)


