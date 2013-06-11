using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MSO.DTO
{
    [Serializable]
    public class AddressDTO
    {
        public string Address
        {
            get;

            set;
        }

        public string District
        {
            get;

            set;
        }

        public string State
        {
            get;

            set;
        }

        public string Country
        {
            get;

            set;
        }

        public string PinCode
        {
            get;

            set;
        }

        public string LandMark
        {
            get;

            set;
        }

        public bool IsPermanent
        {
            get;

            set;
        }
    }
}
