IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('dbo.tblEmployeeMaster') 
AND type ='U')
DROP TABLE tblEmployeeMaster
GO
CREATE TABLE tblEmployeeMaster (
--Id	INT	identity(1,1) PRIMARY KEY,
EmployeeId	VARCHAR(200) PRIMARY KEY,
LoginId	Varchar(50) UNIQUE,
FirstName	VARCHAR	(200),
MiddleInitial	CHAR(1),
LastName	VARCHAR	(200),
DOB DATE,
Gender CHAR(2),
ContactNumberPh	VARCHAR(200),	
ContactNumberMobile	VARCHAR(200),
EmergencyContactNumber	VARCHAR(13),	
EmailId1	Varchar(200),
EmailId2 VARCHAR(200),
DesignationId	INT, 
DepartmentId	INT	,
DOJ	DATE,	
SBU	INT	,
PermanentAddress VARCHAR(500),
PermanentCountry INT,
PermanentState INT,
PermanentDist VARCHAR(50),
PermanentPin VARCHAR(10),
MailingAddress	VARCHAR	(500),
MailingCountry INT,
MailingState INT,
MailingDist VARCHAR(50),
MailingPin VARCHAR(10),
PAN	VARCHAR	(200),
GIRNumber VARCHAR(100)	,
DematAccountType	VARCHAR(10)	,
EmploymentType	Char(1),
ConfirmationDATE	DATE,	
DepositoryParticipatoryName	VARCHAR	(100),
DPIDNo	NUMERIC	,
ClientIDNo NUMERIC,
IsInsider	Char(1),
Location	VARCHAR	(100),
ResidentialId	VARCHAR(5)	,
EmployeeType  	Char(1),
PayrollCountry	INT	,
TaxRate	 NUMERIC(16,2),
Createdby	INT,
CreatedDate	DATETIME,	
Updatedby	INT	,
UpdatedDate	DATETIME)
---ALTER TABLE NEED TO CREATE --DILIP 
GO

