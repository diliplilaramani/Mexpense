 
IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('Type_RoleMenuActions') 
AND type ='U')
DROP TABLE Type_RoleMenuActions
GO
CREATE type Type_RoleMenuActions as Table
(
	SUB_MENUID INT, 
	ACTION_ID INT 
)	
