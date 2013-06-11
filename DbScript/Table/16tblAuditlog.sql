IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('tblAuditlog')  AND type ='U')
DROP TABLE tblAuditlog
GO
CREATE TABLE [dbo].[tblAuditlog](
	[Id] [int] IDENTITY(1,1) primary key  NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[Roleid] [int] NOT NULL,
	[LoginDateTime] [datetime] NULL,
	[LogoutDateTime] [datetime] NULL,
	ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
	ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
	UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
	UPDATE_TIMESTAMP	DATETIME,		
	[VERSION]		INT	
	)
