IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.tblUnit') 
AND type ='U') DROP TABLE tblUnit
go
CREATE TABLE tblUnit(
Code			VARCHAR(3) Primary Key,	--Type could One Time , Monthly,Quarterly Etc
[Name]			VARCHAR	(50),	
[Desc]			VARCHAR	(100),	
[TYPE]				CHAR(1),
ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
UPDATE_TIMESTAMP	DATETIME,		
[VERSION]		INT)		

GO
Insert Into tblUnit (Code, [name], [Desc],[TYPE],ADD_USERID,ADD_TIMESTAMP, [VERSION] )
values ('D', 'Days','Days','', null,GETDATE(),0)
go
Insert Into tblUnit (Code, [name], [Desc],[TYPE],ADD_USERID,ADD_TIMESTAMP, [VERSION] )
values ('M', 'Months','Months','', null,GETDATE(),0)
