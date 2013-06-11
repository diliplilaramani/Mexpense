IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.SchemeSetup') 
AND type ='U')  DROP TABLE tblSchemeSetup 
GO
CREATE TABLE tblSchemeSetup	
(
Schemeid	VARCHAR(100) Primary Key,
StakeHolderApprovalId	varchar(100)	FOREIGN KEY REFERENCES tblStkHolderApproval(stakeHolderApproveId) ,
schemeName	VARCHAR(100),
schmeDescription	VARCHAR(100),
AdjustRemaindoptions varchar(3) FOREIGN KEY REFERENCES tblAdjustResidueList(code),
vestOverPeriod	INT,
Vesfrequency	VARCHAR(3) FOREIGN KEY REFERENCES tblVestingfrequencyList(code),
vestStart	Int, 
ExerciseStartAfter	VARCHAR(3) FOREIGN KEY REFERENCES tblExerciseStartPeriod(code) ,
LockinPeriodStartfrom	int,
periodOffset	Int,
RatioMultipler	int,
RatioDivisor	Int,
ADD_USERID			INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL,	--FK to SEC_USERS
ADD_TIMESTAMP		DATETIME DEFAULT GETDATE(),		
[Approvalstatus] INT FOREIGN KEY REFERENCES  tblApprovalStatus(StatusId) null, 
[ApprovedBy] INT FOREIGN KEY REFERENCES TBLUSERS([UID]) null,	
[ApprovedOn]  datetime null, 
[Remark]    varchar(1000) null, 
UPDATE_USERID		INT FOREIGN KEY REFERENCES TBLUSERS([UID]) NULL, --	FK to SEC_USERS
UPDATE_TIMESTAMP	DATETIME,		
[VERSION]		INT		)
