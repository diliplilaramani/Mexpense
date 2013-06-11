CREATE PROCEDURE [dbo].[InsertGrantShares]
(@GrantsharesId VARCHAR(50),
 @Employeeid VARCHAR(50),
 @GrantRegistrationId VARCHAR(50),
 @Noofshares INT,
 @UserId INT
)
AS
BEGIN
INSERT INTO tblGrantshares(GrantsharesId,EmpployeeID,GrantRegistrationId,Grantedoptions,ADD_USERID,ADD_TIMESTAMP)
VALUES(@GrantsharesId,@Employeeid,@GrantRegistrationId,@Noofshares,@UserId,GETDATE())

END

--sqlParams.Add(new SqlParameter("@EmpployeeID", empid));
--                    sqlParams.Add(new SqlParameter("@SchemeId", schemeid));
--                    sqlParams.Add(new SqlParameter("@GrantRegistrationId", GrantregnId));
--                    sqlParams.Add(new SqlParameter("@Noofshares", noofshares));
                    
GO

