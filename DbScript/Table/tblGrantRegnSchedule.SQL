IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tblGrantRegnSchedule')
CREATE TABLE tblGrantRegnSchedule
(
Id INT IDENTITY(1,1) PRIMARY KEY
,ScheduleId INT
,VestingDate DATE
,ExpiryDate DATE
,GrantRegistrationId VARCHAR(100) FOREIGN KEY REFERENCES tblGrantRegistration(GrantRegistrationId)
,CorpActionId INT
,TimePercentage Numeric(5,2)
,PerfPercentage Numeric(5,2)
,Add_Userid INT FOREIGN KEY REFERENCES tblusers(uid)
,Add_TimeStamp DATETIME
)

