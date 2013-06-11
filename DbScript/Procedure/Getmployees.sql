IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'Getmployees')
DROP PROCEDURE Getmployees
GO 
CREATE PROCEDURE Getmployees   
as  
Begin  
SELECT EmployeeID, FirstName + ' '+ MiddleInitial + ' ' + LastName as name FROM tblemployeeMaster 

-- sp_help tblemployeeMaster


END  