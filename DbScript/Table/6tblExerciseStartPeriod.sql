IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID('dbo.tblExerciseStartPeriod') 
AND type ='U') DROP TABLE tblExerciseStartPeriod
go
CREATE TABLE tblExerciseStartPeriod(
Code			VARCHAR(3) Primary Key,	--Type could One Time , Monthly,Quarterly Etc
[Name]	VARCHAR	(50),	
[Desc]	VARCHAR	(100),	
ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
UPDATE_TIMESTAMP	DATETIME,		
[VERSION]		INT	)	

GO
Insert Into tblExerciseStartPeriod (Code, [name], [Desc],ADD_USERID,ADD_TIMESTAMP, [VERSION])
values ('G', 'Grant Date','Exercise Period Start After Grant Date', NULL,GETDATE(),0)
go
Insert Into tblExerciseStartPeriod (Code, [name], [Desc],ADD_USERID,ADD_TIMESTAMP, [VERSION])
values ('V', 'Vest Date','Exercise Period Start After Vesting Date', NULL,GETDATE(),0)
