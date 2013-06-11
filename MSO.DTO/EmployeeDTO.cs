using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MSO.Common;
using MSO.Common.Enums;

namespace MSO.DTO
{
    [Serializable]
    public class EmployeeDTO
    {
        public string FirstName
        {
            get;

            set;
        }

        public string EmpId
        {
            get;

            set;
        }

        public string LoginId
        {
            get;

            set;
        }

        public string MiddleInitial
        {
            get;

            set;
        }


        public string LastName
        {
            get;

            set;
        }

        public DateTime DOB
        {
            get;

            set;
        }
        public AddressDTO PermanentAddress
        {
            get;

            set;
        }


        public AddressDTO MailingAddress
        {
            get;

            set;

        }

        public string MobileNo
        {
            get;

            set;
        }

        public string PhoneNo
        {
            get;

            set;
        }

        public string EmailId1
        {
            get;

            set;
        }

        public string EmailId2
        {
            get;

            set;
        }


        public string Designation
        {
            get;

            set;
        }

        public string Department
        {
            get;

            set;
        }
        public EmployeeType EmpType
        {
            get;

            set;
        }

        public DateTime DOJ
        {
            get;

            set;
        }

        public char ConfirmationStatus
        {
            get;

            set;
        }

        public DateTime ConfirmationDate
        {
            get;

            set;
        }

        //public ResidentStatus ResStatus
        //{
        //    get;

        //    set;
        //}

        
        public string PanNo
        {
            get;

            set;
        }
        //public DematAccType DematAcountType
        //{
        //    get;

        //    set;
        //}

        public string DPIDNo
        {
            get;

            set;
        }

        public string ClientIdNo
        {
            get;

            set;
        }

        public string DPName
        {
            get;

            set;
       }

        public char Gender
        {
            set;

            get;
        }

        public char IsInsider
        {
            set;

            get;
        }

        public decimal TaxRate
        {
            set;

            get;
        }

        public string PayrollCountry
        {
            get;

            set;
        }

        public string GIRNumber
        {
            get;

            set;
        }

        public ResidentStatus ResStatus
        {
            get;

            set;
        }
        public EmployeeBankDetailsDTO BankDetails1
        {
            get;

            set;
        }

        public EmployeeBankDetailsDTO BankDetails2
        {
            get;

            set;
        }

    }
}
