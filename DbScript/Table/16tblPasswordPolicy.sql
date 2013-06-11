IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('TBLPASSWORDPOLICY')  AND type ='U')
DROP TABLE TBLPASSWORDPOLICY
GO
CREATE TABLE [dbo].[TBLPASSWORDPOLICY](
	[Min_Password_Length] [int] NULL,
	[Max_Password_Length] [int] NULL,
	[IsAlphanumeric] [char](1) NULL,
	[MUST_Have_Capital] [char](1) NULL,
	[MUST_Have_Numbers] [char](1) NULL,
	[MUST_Have_SpecailChar] [char](1) NULL
) ON [PRIMARY]
