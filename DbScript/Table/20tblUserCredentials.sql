IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('TBLUSERCREDENTIALS')  AND type ='U')
DROP TABLE tblUserCredentials
GO
CREATE TABLE [dbo].tblUserCredentials(
	[UID] [int] FOREIGN KEY references tblusers([UID]),
	[Security_Question_id_1] INT FOREIGN KEY REFERENCES TBLSECPWDQUEST(QUEST_ID) ,
	[Answer_1] [varchar](200) NULL,
	[Security_Question_id_2] INT FOREIGN KEY REFERENCES TBLSECPWDQUEST(QUEST_ID) ,
	[Answer_2] [varchar](200) NULL
)
