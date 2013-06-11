using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

//this class will be used to hold the session level values of logged in users 
namespace MSO.BO
{
    public class SessionContainer
    {
        /// <summary>
        /// This will hold the acutal userd id of logged in users 
        /// </summary>
        public string UserId
        {
            get;
            set;
        }


        /// <summary>
        // This property will hold he primary key  of  logged in userid which will be used to punch the different operation
        //perform by the logged in users 
        /// </summary>
        public int  UID
        {
            get;
            set;

        }

        /// <summary>
        /// this property will used to hold employee id of logged in user
        /// in case of employee is not logged in the other users are logged in 
        /// for example if CR or Admin is logged to system in this case this property will hold null value
        /// </summary>
        public string EmployeeId
        {
            get;
            set;

        }
        /// <summary>
        /// this will be the indication flag about weather the user is logged in as default user or not 
        /// </summary>
        public bool DefultLogin
        {
            get;
            set;
        }
        /// <summary>
        /// This property will set if the perticular screen is having view access
        /// </summary>
        public bool isViewAccess
        {
            get;
            set;
        }



        /// <summary>
        /// This property will set if the perticular screen is having Add  access
        /// </summary>

        public bool isAddAccess
        {
            get;
            set;
        }


        /// <summary>
        /// This property will set if the perticular screen is having Edit  access
        /// </summary>
        public bool isEditAccess
        {
            get;
            set;
        }

        /// <summary>
        /// This property will set if the perticular screen is having delete access
        /// </summary>

        public bool isDeleteAccess
        {
            get;
            set;
        }



    }
}
