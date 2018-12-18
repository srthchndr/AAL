using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AmericanAutoLoans.App_Code
{
    public class LoanInfor
    {
        String applicationType;
        String primaryLoanPurpose;
        float loanAmount;
        int loanTerm;
        int loanPaymentMethod; /* 0 =Auto Pay, 1 = Invoice */

        public String ApplicationType
        {
            get { return applicationType; }   /*ADD THE PROPERTIES AS SHOWN*/
            set { applicationType = value; }  /*FOR THE REMAINING FIELDS.*/
        }
        public String PrimaryLoanPurpose
        {
            get { return primaryLoanPurpose; }   /*ADD THE PROPERTIES AS SHOWN*/
            set { primaryLoanPurpose = value; }  /*FOR THE REMAINING FIELDS.*/
        }
        public float LoanAmount
        {
            get { return loanAmount; }   /*ADD THE PROPERTIES AS SHOWN*/
            set { loanAmount = value; }  /*FOR THE REMAINING FIELDS.*/
        }
        public int LoanTerm
        {
            get { return loanTerm; }   /*ADD THE PROPERTIES AS SHOWN*/
            set { loanTerm = value; }  /*FOR THE REMAINING FIELDS.*/
        }
        public int LoanPaymentMethod
        {
            get { return loanPaymentMethod; }   /*ADD THE PROPERTIES AS SHOWN*/
            set { loanPaymentMethod = value; }  /*FOR THE REMAINING FIELDS.*/
        }
    }
}