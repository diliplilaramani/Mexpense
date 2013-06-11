IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE 
ROUTINE_NAME = 'GetAssignedMenutoRole')
	DROP PROCEDURE GetAssignedMenutoRole
GO
--execute GetAssignedMenutoRole  2,  null
CREATE PROCEDURE [dbo].[GetAssignedMenutoRole] (@RoleId int = NULL, @RoleName varchar(50) = NULL)
AS
BEGIN 	
	
	--get the master data first 
	SELECT ROLE_ID, ROLE_NAME, ROLE_DESC, DefaultRole, ADD_USERID, [VERSION] FROM tblRoles  
	WHERE (@RoleId IS NULL OR ROLE_ID = @RoleId)
	AND (@RoleName IS NULL OR ROLE_NAME = @RoleName)

	IF  (@RoleId is null AND @RoleName IS NOT NULL) 
	BEGIN
		SELECT @RoleId= ROLE_ID  FROM tblRoles  WHERE  ROLE_NAME = @RoleName
	END 
		
	
	SELECT  DISTINCT menu.SUBMENU_ID, menu.MAINMENU_ID,   menu.SUBMENU_NAME, 
			ISNULL((VIEW_ADD.[ADD]),0) as [ADD], 
			ISNULL(VIEW_EDIT.EDIT,0) AS EDIT, 
			ISNULL(VIEW_DELETE.[DELETE],0) as [DELETE],  
			ISNULL(VIEW_VIEW.[VIEW],0) AS [VIEW]    
	FROM  
	TBLSUBMENU menu  
	LEFT OUTER JOIN VIEW_ADD on VIEW_ADD.SUBMENU_ID = menu.SUBMENU_ID
	LEFT OUTER JOIN VIEW_EDIT on VIEW_EDIT.SUBMENU_ID =  menu.SUBMENU_ID
	LEFT OUTER JOIN VIEW_DELETE on VIEW_DELETE.SUBMENU_ID =menu.SUBMENU_ID
	LEFT OUTER JOIN VIEW_VIEW on VIEW_VIEW.SUBMENU_ID = menu.SUBMENU_ID 
	LEFT OUTER JOIN  tblRoleSubMenuConfig config on config.SUBMENU_ID =menu.SUBMENU_ID
	WHERE  (@RoleId IS NULL OR config.ROLE_ID = @RoleId)
	--AND VIEW_ADD.[ADD] IS NOT NULL 
	--AND  VIEW_EDIT.EDIT IS NOT NULL 
	--AND VIEW_DELETE.[DELETE]  IS NOT NULL
	--AND VIEW_VIEW.[VIEW] IS NOT NULL
END
--SELECT  * FROM tblRoles 