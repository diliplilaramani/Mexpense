IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'GetGrantsharedtl')
DROP PROCEDURE GetGrantsharedtl
GO 

CREATE PROCEDURE [dbo].[GetGrantsharedtl]  
(@grantshareid NVARCHAR(100))  
AS  
BEGIN  
SELECT GrantsharesId FROM tblGrantShares WHERE GrantsharesId	 LIKE + @grantshareid +'%'  
END


