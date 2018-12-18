using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmericanAutoLoans
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void redirect(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;

            if (clickedButton == null) // just to be on the safe side
                return;

            if (clickedButton.ID == "private")
            {
                string text = "private";
                Session["clicked"] = text;
            }
            else if(clickedButton.ID == "navApply" || clickedButton.ID == "apply")
            {
                string text = "apply";
                Session["clicked"] = text;
            }
 
            Server.Transfer("Verification.aspx");
        }

        protected void alert(object sender1, EventArgs e1)
        {
            Server.Transfer("SigninPage.aspx");
        }
    }
}