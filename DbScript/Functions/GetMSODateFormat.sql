IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_NAME='GetMSODateFormat' AND ROUTINE_TYPE = 'FUNCTION')
BEGIN 
DROP FUNCTION GetMSODateFormat 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dilip Sharma>
-- Create date: <18-Jun-2012>
-- Description:	<Function will take date as input as retur string in format of DD-MMM-YYYY, >
-- =============================================
CREATE FUNCTION dbo.GetMSODateFormat 
(
	-- Add the parameters for the function here
	@dtDate DATE
)
RETURNS varchar (15)
AS
BEGIN
		Declare @Returns varchar(15);
		SELECT @Returns = REPLACE(CONVERT(VARCHAR(12),@dtDate , 106),' ',' - ') 
	RETURN @Returns;
END
GO
