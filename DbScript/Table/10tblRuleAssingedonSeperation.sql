IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.tblRuleAssingedonSeperation') 
AND type ='U')  DROP TABLE tblRuleAssingedonSeperation
GO
CREATE TABLE tblRuleAssingedonSeperation
(
Id  Int IDENTITY (1,1) PRIMARY KEY  , 
SepRuleId Int  FOREIGN KEY REFERENCES tblSepRuleDesc(SepRuleId),
Schemeid  varchar(100) FOREIGN KEY REFERENCES tblSchemeSetup (Schemeid), 
LeavethisRule char(1),
VestedOptionsLiveTillExercisePeriod char(1),
VestedOptionLiveFor int,
[UnitIdVestdLiveFor] varchar(3) FOREIGN KEY REFERENCES tblUnit (Code),
UnvestedLiveFor int, 
[UnitIdUnvestedLiveFor] varchar(3) FOREIGN KEY REFERENCES tblUnit (Code),
IsVestofUnvestedOptionsOnSepratonDate char(1), 
)
go
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.Audit_tblRuleAssingedonSeperation') 
AND type ='U')  DROP TABLE Audit_tblRuleAssingedonSeperation
GO
CREATE TABLE Audit_tblRuleAssingedonSeperation
(
Id    int , 
SepRuleId Int  FOREIGN KEY REFERENCES tblSepRuleDesc(SepRuleId),
Schemeid  varchar(100) FOREIGN KEY REFERENCES tblSchemeSetup (Schemeid), 
LeavethisRule char(1),
VestedOptionsLiveTillExercisePeriod char(1),
VestedOptionLiveFor int,
[UnitIdVestdLiveFor] varchar(3) FOREIGN KEY REFERENCES tblUnit (Code),
UnvestedLiveFor int, 
[UnitIdUnvestedLiveFor] varchar(3) FOREIGN KEY REFERENCES tblUnit (Code),
IsVestofUnvestedOptionsOnSepratonDate char(1), 
)
go

