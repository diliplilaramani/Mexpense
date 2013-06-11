IF EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('dbo.tblBankAccountTypeMaster') 
AND type ='U') 
drop table tblBankAccountTypeMaster
go
CREATE TABLE tblBankAccountTypeMaster(
Id	Int  PRIMARY KEY,	
BankAccountType	VARCHAR(20),
[Description]	VARCHAR(100),
Createdby	INT	FOREIGN KEY REFERENCES tblUsers(uId),	
Createddate	Date ,
Updatedby	INT FOREIGN KEY REFERENCES tblUsers(uId),	
UpdatedDate	Date)	
GO
INSERT INTO tblBankAccountTypeMaster(Id,BankAccountType) values(1,'Savings'),(2,'Current')

