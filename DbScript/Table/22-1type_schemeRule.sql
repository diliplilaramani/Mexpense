drop type type_schemeRule
CREATE TYPE type_schemeRule AS TABLE
 (
  
SepRuleId  int , 
LeavethisRule char(1),
VestedOptionsLiveTillExercisePeriod char(1),
VestedOptionLiveFor int,
[UnitIdVestdLiveFor] varchar(3),
UnvestedLiveFor int, 
[UnitIdUnvestedLiveFor] varchar(3) ,
IsVestofUnvestedOptionsOnSepratonDate char(1));
  