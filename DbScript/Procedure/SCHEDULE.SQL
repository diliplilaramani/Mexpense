DECLARE @VestingOverperiod INT --39 across 39 months qarters years
DECLARE @Vestfrequency INT --1 for monthly
DECLARE @Vestingstartafter INT --11 after 11 months
DECLARE @AdjustRemainingOptions INT --First or last vest
DECLARE @Exerciseperiodoffset INT  --120 Months
DECLARE @Exerciseperiodafter INT  --1 for grant date 2 for Vesting date
DECLARE @StartDate DATE 
DECLARE @ExpiryDate DATE 

SET @StartDate = '02/01/2000' --GRANT DATE



SET @VestingOverperiod = 39
SET @Vestfrequency = 1 --MONTHLY
SET @Vestingstartafter = 11
SET @AdjustRemainingOptions = 1 
SET @Exerciseperiodoffset = 120
SET @Exerciseperiodafter = 1 

IF @Exerciseperiodafter = 1 
SET @ExpiryDate = DATEADD(MONTH,@Exerciseperiodoffset,@StartDate)

SET @StartDate = DATEADD(MONTH,@Vestingstartafter,@StartDate)

DECLARE @counter INT 
SET @counter = 1
DECLARE @tmpPer NUMERIC(5,2) 

SET @tmpPer = ROUND(100/@VestingOverperiod,0)
DECLARE @remPer NUMERIC(5,2)
SET @remPer = 100 - (@tmpPer * (@VestingOverperiod-1))

CREATE TABLE  #tblSchedule(VestPeriod INT,VestingDate DATE,ExpiryDate DATE,Per NUMERIC(5,2))


WHILE @counter < @VestingOverperiod 
BEGIN 

IF @Vestfrequency = 1 
SET @StartDate = DATEADD(MONTH,1,@StartDate)
ELSE IF @Vestfrequency = 2
SET @StartDate = DATEADD(MONTH,3,@StartDate)

ELSE IF @Vestfrequency = 3
SET @StartDate = DATEADD(MONTH,6,@StartDate)

ELSE IF @Vestfrequency = 4
SET @StartDate = DATEADD(MONTH,12,@StartDate)

IF @Exerciseperiodafter = 2 
SET @ExpiryDate = DATEADD(MONTH,@Exerciseperiodoffset,@StartDate)

INSERT INTO #tblSchedule(VestPeriod,VestingDate,ExpiryDate,Per) VALUES(@counter,@StartDate,@ExpiryDate,@tmpPer)

SET @counter = @counter + 1

END 

IF @AdjustRemainingOptions =  1 
UPDATE #tblSchedule SET Per = @remPer WHERE VestPeriod = 1
ELSE IF @AdjustRemainingOptions = 2 
UPDATE #tblSchedule SET Per = @remPer WHERE VestPeriod = @counter -1 

SELECT VestPeriod,dbo.GetDateFormat(VestingDate),dbo.GetDateFormat(ExpiryDate),Per FROM #tblSchedule 
DROP TABLE #tblSchedule
