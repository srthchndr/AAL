using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmericanAutoLoans.App_Code;

namespace AmericanAutoLoans
{
    public partial class SigninPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnCancelBtn(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }

        protected void OnLinkClick(object sender, EventArgs e)
        {
            string temp = "apply";
            Session["clicked"] = temp;
            Server.Transfer("Verification.aspx");
        }

        protected void onSigninClick(object sender, EventArgs e)
        {
            List<UserInfo> user = Application["AllUsersList"] as List<UserInfo>;
            if(user == null)
            {
                Response.Write("<script>alert('Your username does not exists. Please register.')</script>");
            }
            else if(user.Count == 0)
            {
                Response.Write("<script>alert('Your username does not exists. Please register.')</script>");
            }
            else
            {
                for (int i = 0; i < user.Count; i++)
                {
                    if (user[i].EmailAddress1 == username.Text)
                    {
                        Session["currentuser"] = user[i];
                        if (user[i].PassWord == password.Text)
                        {
                            Server.Transfer("MyAccount.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Username or Password is incorrect. Check again.')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Your username does not exists. Please register.')</script>");
                    }
                }
            }
            
        }
    }
}