using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MSO.DTO
{
   public class AssignedRuletoSchemeDTO
    {

        public int SepRuleId
        {
            get;
            set;

        }
        public string VestedOptionsLiveTillExercisePeriod
        {
            get;
            set;
        }
        public int VestedLiveFor
        {

            get;

            set;
        }
        public string UnitIdVestdLiveFor
        {
            get;
            set;

        }
        public int UnvestedLiveFor
        {
            get;
            set;
        }
        public string UnitIdUnvestedLiveFor
        {
            get;
            set;
        }
        public string IsVestofUnvestedOptions
        {
            get;
            set;

        }
        public string LeavethisRule
        {
            get;
            set;
        }
        public int Createdby
        {
            get;

            set;
        }
        public string Createddate
        {
            get;

            set;
        }
      
    }
}
