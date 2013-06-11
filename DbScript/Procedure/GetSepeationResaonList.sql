
-- =============================================
-- Author:		<Dilip Sharma>
-- Create date: <18-Jun-2012>
-- Description:	<PROCDEURE WILL RETURN  LIST OF APPROVAL PRESENT IN TABLE>
--execute dbo.GetSepeationResaonList '','',''
-- =============================================
IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_NAME='GetSepeationResaonList' AND ROUTINE_TYPE = 'PROCEDURE')
BEGIN 
DROP PROCEDURE GetSepeationResaonList 
END
GO
CREATE PROCEDURE [dbo].[GetSepeationResaonList]

AS 
 BEGIN
	select SepRuleId, SepReasonCode,SepReasonName  from  tblSepRuleDesc	
		
	
END 
