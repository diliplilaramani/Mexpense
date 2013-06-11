using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace MSO.DTO
{
    [Serializable]
    public class ExerciseSetupDTO
    {
        public int companyid
        {
            get;

            set;
        }
        public string ExerciseHeader
        {
            get;

            set;
        }

        public string ExerciseFooter
        {
            get;

            set;
        }

        public char FIFO
        {
            get;
            set;
        }

        public char Allowexrcisemultiplevest
        {
            get;
            set;
        }

        public char Restricttocompletevest
        {
            get;
            set;
        }

        public char ExerciseDenomination
        {
            get;
            set;
        }

        public char AllowExercisesimulation
        {
            get;
            set;
        }

        public char SendcancellationAlert
        {
            get;
            set;
        }

        public char CnciderTraveldtls
        {
            get;
            set;
        }
        public char IsAutomatedExercise
        {
            get;
            set;
        }
        //Trust,paymentGateway
        public char IstrustIntegrated
        {
            get;
            set;
        }

        public char IsPaymentGatewayIntegrated
        {
            get;
            set;
        }

        public char IsFundingIntegrated
        {
            get;
            set;
        }
        public char IsCashlessIntegrated
        {
            get;
            set;
        }

        public char IsSendvestAlertBefore
        {
            get;
            set;
        }
        public int SendvestAlertBeforeDays
        {
            get;
            set;
        }



        public int SendvestAlertBeforeRmainderDays
        {
            get;
            set;
        }

        public char IsSendvestAlertAfter
        {
            get;
            set;
        }
        public int SendvestAlertAfterDays
        {
            get;
            set;
        }



        public int SendvestAlertAfterRmainderDays
        {
            get;
            set;
        }
        //For lapse alert

        public char IsSendLapseAlertBefore
        {
            get;
            set;
        }
        public int SendLapseAlertBeforeDays
        {
            get;
            set;
        }


        public int SendLapseAlertBeforeRmainderDays
        {
            get;
            set;
        }





        public char SendExerciseApprovalstatus
        {
            get;
            set;
        }

        public char IsNSEorBSE
        {
            get;
            set;
        }

        public char SamedayoPrevsDay
        {
            get;
            set;
        }

        public char SharepricetobeConcidered
        {
            get;
            set;
        }




        public string Createdby
        {
            get;

            set;
        }


        public string Createddate
        {
            get;

            set;
        }


        public string Updateby
        {
            get;

            set;
        }


        public string UpdateDtate
        {
            get;

            set;
        }

    }
}
