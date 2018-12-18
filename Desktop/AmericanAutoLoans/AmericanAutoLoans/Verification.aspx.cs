using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmericanAutoLoans.App_Code;

namespace AmericanAutoLoans
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void goToLoanApp(object sender, EventArgs e)
        {
            List<UserInfo> allUsersList = Application["AllUsersList"] as List<UserInfo>;

            if (allUsersList != null && allUsersList.Count != 0)
            {
                for (int i = 0; i < allUsersList.Count; i++)
                {
                    if (allUsersList[i].EmailAddress1 == emailTextBox.Text)
                    {
                        Response.Write("<script>alert('User " + emailTextBox.Text + " already exists. Please login')</script>");
                        Server.Transfer("Home.aspx");
                    }
                    else
                    {
                        String value = "new";
                        Session["type"] = value;
                        Server.Transfer("LoanApplication.aspx");
                    }
                }
            }
            else
            {
                //Response.Write("<script>alert('Count" + allUsersList.Count+ "')</script>");
                String value = "new";
                Session["type"] = value;
                Server.Transfer("LoanApplication.aspx");
            }


        }
    }
}