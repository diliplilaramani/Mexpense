CREATE VIEW [dbo].[VIEW_EDIT] AS
SELECT ADDACTION.ROLE_ID, ADDACTION.SUBMENU_ID, ADDACTION.ACTION_ID AS [EDIT]  
FROM tblRoleSubMenuConfig  ADDACTION LEFT OUTER JOIN TBLACTIONS ACT
ON ADDACTION.ACTION_ID = ACT.ACTION_ID 
WHERE ACT.ACTION_CODE = 'EDIT'


GO


