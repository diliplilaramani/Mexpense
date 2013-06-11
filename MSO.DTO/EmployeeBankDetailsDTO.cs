using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MSO.Common;
using MSO.Common.Enums;


namespace MSO.DTO
{
    [Serializable]
    public class EmployeeBankDetailsDTO
    {

        public string BankName
        {
            get;

            set;
        }

        public string AccNo
        {
            get;

            set;
        }

        public string IFSCCode
        {
            get;

            set;
        }

        public string NameAsPerBankRecords
        {
            get;

            set;
        }


        public string BranchName
        {
            get;

            set;
        }

        public int BankId  //reflect tblBankDetails BankId column
        {

            set;

            get;
        }


    }
}
