IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID('dbo.tblVestingfrequencyList') 
AND type ='U') DROP TABLE tblVestingfrequencyList 
go
CREATE TABLE tblVestingfrequencyList(
Code			VARCHAR(3) Primary Key,	--Type could One Time , Monthly,Quarterly Etc
[Description]	VARCHAR	(50),	
ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
UPDATE_TIMESTAMP	DATETIME,		
[VERSION]		INT		 
)
GO
Insert Into tblVestingfrequencyList (Code,[Description],ADD_USERID,ADD_TIMESTAMP,[VERSION])
values ('O', 'One Time', null,GETDATE(),0)
go
Insert Into tblVestingfrequencyList (Code,[Description],ADD_USERID,ADD_TIMESTAMP,[VERSION])
values ('M', 'Monthly', null,GETDATE(),0)
go
Insert Into tblVestingfrequencyList (Code,[Description],ADD_USERID,ADD_TIMESTAMP,[VERSION])
values ('Q', 'Quartly', null,GETDATE(),0)
go
Insert Into tblVestingfrequencyList (Code,[Description],ADD_USERID,ADD_TIMESTAMP,[VERSION])
values ('H', 'Half Yearly', null,GETDATE(),0)
go
Insert Into tblVestingfrequencyList (Code,[Description],ADD_USERID,ADD_TIMESTAMP,[VERSION])
values ('Y', 'Yearly', null,GETDATE(),0)
