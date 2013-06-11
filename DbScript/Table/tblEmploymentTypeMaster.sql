IF NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('tblEmploymentTypeMaster') 
AND type ='U') 
drop table tblEmploymentTypeMaster
go
CREATE TABLE tblEmploymentTypeMaster(
Id	Int  PRIMARY KEY,	
EmploymentType	VARCHAR(20),
[Description]	VARCHAR(100),
Createdby	INT	FOREIGN KEY REFERENCES tblUsers([uId]),	
Createddate	Date ,
Updatedby	INT FOREIGN KEY REFERENCES tblUsers([uId]),	
UpdatedDate	Date)	
GO
INSERT INTO tblEmploymentTypeMaster(Id,EmploymentType) values(1,'Permanent'),(2,'Part-Time'),(3,'Independent Director')

