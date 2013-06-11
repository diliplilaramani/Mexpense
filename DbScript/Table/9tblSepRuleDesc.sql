IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.tblSepRuleDesc') 
AND type ='U')  DROP TABLE tblSepRuleDesc
GO
CREATE TABLE tblSepRuleDesc
(
SepRuleId	Int IDENTITY(1,1) PRIMARY KEY,
SepReasonCode Varchar(10),
SepReasonName	Varchar(100),
SepRuleDescription	Varchar(200),
ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
UPDATE_TIMESTAMP	DATETIME,		
[VERSION]		INT		
)
GO
INSERT INTO tblSepRuleDesc 
(SepReasonCode, SepReasonName,SepRuleDescription,ADD_USERID,UPDATE_TIMESTAMP,[VERSION])
values ('Dth','Rule for Death', 'Rule for Death',NULL,GETDATE(),0);
go
INSERT INTO tblSepRuleDesc 
(SepReasonCode, SepReasonName,SepRuleDescription,ADD_USERID,UPDATE_TIMESTAMP,[VERSION])
values ('Ret','Rule for Retirement', 'Rule for Retiremet',NULL,GETDATE(),0);
go
INSERT INTO tblSepRuleDesc 
(SepReasonCode, SepReasonName,SepRuleDescription,ADD_USERID,UPDATE_TIMESTAMP,[VERSION])
values ('Res','Rule for Resignation', 'Rule for Resignation',NULL,GETDATE(),0);
go
INSERT INTO tblSepRuleDesc 
(SepReasonCode, SepReasonName,SepRuleDescription,ADD_USERID,UPDATE_TIMESTAMP,[VERSION])
values ('Ter','Rule for Termination', 'Rule for Termination',NULL,GETDATE(),0);
go
INSERT INTO tblSepRuleDesc 
(SepReasonCode, SepReasonName,SepRuleDescription,ADD_USERID,UPDATE_TIMESTAMP,[VERSION])
values ('Dis','Rule for Disability', 'Rule in case of permanent Disability',NULL,GETDATE(),0);
go
INSERT INTO tblSepRuleDesc 
(SepReasonCode, SepReasonName,SepRuleDescription,ADD_USERID,UPDATE_TIMESTAMP,[VERSION])
values ('Oth','Rule for Others', 'Rule in case not any one above',NULL,GETDATE(),0);
go