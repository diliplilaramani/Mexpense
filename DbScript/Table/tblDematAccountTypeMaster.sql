IF NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('dbo.tblDematAccountTypeMaster') 
AND type ='U')
CREATE TABLE tblDematAccountTypeMaster(
Id	Int  PRIMARY KEY,	
AccountType	VARCHAR(20),
[Description]	VARCHAR(100),
Createdby	INT	FOREIGN KEY REFERENCES tblUsers(uId),	
Createddate	Date ,
Updatedby	INT FOREIGN KEY REFERENCES tblUsers(uId),	
UpdatedDate	Date)	
GO

INSERT INTO tblDematAccountTypeMaster(Id,AccountType) values(1,'NSDL'),(2,'CSDL')

