IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tblCorpAction')
CREATE TABLE tblCorpAction
(
 CorpAcionId INT  PRIMARY KEY identity(1,1)
,ActionTypeId INT FOREIGN KEY REFERENCES tblCorpActionTypeMaster(AcionTypeId)
,Multiplier NUMERIC(3,0)
,Divisor NUMERIC(3,0)
,Add_Userid INT FOREIGN KEY REFERENCES tblusers(uid)
,Add_TimeStamp DATETIME
)

