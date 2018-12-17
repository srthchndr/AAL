using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AmericanAutoLoans.App_Code
{
    public class UserInfo
    {
        String firstName;
        String middleInitials;
        String lastName;
        String emailAddress1;
        String emailAddress2;
        String homeStreetAddress;
        String homeAptNo;
        String homeCity;
        String homeState;
        String homeZip;
        String homePhone;
        int    timeAtCurrentAddressYears;
        int    timeAtCurrentAddressMonths;
        int    housingStatus;  /*0 = rent, 1 = own */
        String socialSecurity;
        String dateOfBirth;
        int    driversLicenseLastFourDigits;
        String passWord;

        public List<LoanInfor> loanInfor = new List<LoanInfor>();

        public String FirstName
        {
            get { return firstName; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { firstName = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String MiddleInitials
        {
            get { return middleInitials; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { middleInitials = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String LastName
        {
            get { return lastName; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { lastName = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String EmailAddress1
        {
            get { return emailAddress1; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { emailAddress1 = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String EmailAddress2
        {
            get { return emailAddress2; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { emailAddress2 = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String HomeStreetAddress
        {
            get { return homeStreetAddress; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { homeStreetAddress = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String HomeAptNo
        {
            get { return homeAptNo; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { homeAptNo = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String HomeCity
        {
            get { return homeCity; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { homeCity = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String HomeState
        {
            get { return homeState; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { homeState = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String HomeZip
        {
            get { return homeZip; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { homeZip = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String HomePhone
        {
            get { return homePhone; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { homePhone = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public int TimeAtCurrentAddressYears
        {
            get { return timeAtCurrentAddressYears; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { timeAtCurrentAddressYears = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public int TimeAtCurrentAddressMonths
        {
            get { return timeAtCurrentAddressMonths; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { timeAtCurrentAddressMonths = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public int HousingStatus
        {
            get { return housingStatus; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { housingStatus = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String SocialSecurity
        {
            get { return socialSecurity; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { socialSecurity = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String DateOfBirth
        {
            get { return dateOfBirth; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { dateOfBirth = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public int DriversLicenseLastFourDigits
        {
            get { return driversLicenseLastFourDigits; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { driversLicenseLastFourDigits = value; }     /*FOR THE REMAINING FIELDS.*/
        }
        public String PassWord
        {
            get { return passWord; }      /*ADD THE PROPERTIES AS SHOWN*/
            set { passWord = value; }     /*FOR THE REMAINING FIELDS.*/
        }
    }
}