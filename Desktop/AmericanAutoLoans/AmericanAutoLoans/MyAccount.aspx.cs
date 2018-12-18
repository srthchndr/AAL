using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmericanAutoLoans.App_Code;

namespace AmericanAutoLoans
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserInfo user = (UserInfo)Session["currentuser"];
            welcomeLabel.Text = "Welcome " + user.FirstName + " " + user.LastName;
            emailLabel.Text = user.EmailAddress1;
            appTypeLabel.Text = user.loanInfor[0].ApplicationType ;
            loanPurposeLabel.Text = user.loanInfor[0].PrimaryLoanPurpose;
            loanAmountLabel.Text = user.loanInfor[0].LoanAmount.ToString();
            loanTermLabel.Text = user.loanInfor[0].LoanTerm.ToString();

            if(user.loanInfor[0].LoanPaymentMethod == 0)
            {
                payMethodLabel.Text = "Auto Pay";
            }
            else
            {
                payMethodLabel.Text = "Invoice";
            }

        }

        protected void onEditClick(object sender, EventArgs e)
        {
            String value = "edit";
            Session["type"] = value;

            Server.Transfer("LoanApplication.aspx");
        }

        protected void onLoanInfoClick(object sender, EventArgs e)
        {
            String value = "loanInfo";
            Session["clicked"] = value;

            Server.Transfer("LoanInfo.aspx");
        }

        protected void onLogoutClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("Home.aspx");
        }
    }
}