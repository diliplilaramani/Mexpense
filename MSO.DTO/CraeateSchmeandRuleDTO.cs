using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MSO.DTO
{
    [Serializable]
    public class CraeateSchmeandRuleDTO
    {

        public int StkId
        {
            get;

            set;
        }
        public string Schid
        {
            get;
            set;

        }
        public string schemeName
        {
            get;
            set;

        }
        public string schmeDescription
        {
            get;
            set;

        }
        public string vestOverPeriod
        {
            get;
            set;

        }
        public string AdjustRemaindoptions
        {
            get;
            set;

        }
        public int vestStart
        {
            get;
            set;

        }
        public string Vesfrequency
        {
            get;
            set;

        }
        public int RatioMultipler
        {
            get;
            set;

        }
        public int Lock_in_Frequency
        {
            get;
            set;

        }
        public int RatioDivisor
        {
            get;
            set;

        }
        public int periodOffset
        {
            get;
            set;

        }
        public int LockinPeriodStartfrom
        {
            get;
            set;

        }
        public string ExerciseStart
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