IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('TBLSECPWDQUEST')  AND type ='U')
DROP TABLE tblSecPwdQuest
GO
CREATE TABLE [dbo].[tblSecPwdQuest]
(
	[QUEST_ID] [int]  IDENTITY CONSTRAINT PK_SECQUEST_QUEST_ID PRIMARY KEY NOT NULL,
	[Security_QUEST] [varchar](200) NOT NULL,
	ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
	ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
	UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
	UPDATE_TIMESTAMP	DATETIME,		
	[VERSION]		INT)