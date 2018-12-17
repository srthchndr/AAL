using AmericanAutoLoans.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmericanAutoLoans
{
    public partial class PassRecovery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnCancelClick(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }

        protected void onRecovery(object sender, EventArgs e)
        {
            int flag = 0;
            List<UserInfo> allUsersList = Application["AllUsersList"] as List<UserInfo>;
            UserInfo u = new UserInfo();
            if (allUsersList != null)
            {

                for (var i = 0; i < allUsersList.Count; i++)
                {
                    if (allUsersList[i].EmailAddress1 == username.Text)
                    {
                        flag = 1;
                        u = allUsersList[i];
                    }
                }
            }
            else
            {
                flag = 0;
            }
            if (flag == 1)
            {

                Response.Write("<script>alert('Thank You. An email notification has been sent to the address you have provided.')</script>");
                String msgTo = username.Text;
                String msgSub = "We have recovered your password!";
                String msgBody = "Dear New User " + u.EmailAddress1 + "<br /> You are receiving this email because a you requested to recover your password. <br /> Your current password is : " + u.PassWord + "<br /> Thank you. <br /> AmericanAutoLoans.com Team";
                MailMessage obj = new MailMessage();
                obj.Body = msgBody;
                obj.From = new MailAddress("americanautoloansaal@gmail.com", "Admin Team(American Auto Loans)");
                obj.To.Add(new MailAddress(msgTo));
                obj.Subject = msgSub;
                obj.IsBodyHtml = true;
                SmtpClient clnt = new System.Net.Mail.SmtpClient();
                clnt.Host = "smtp.gmail.com";
                clnt.Port = 587;
                clnt.EnableSsl = true;
                clnt.UseDefaultCredentials = false;
                clnt.DeliveryMethod = SmtpDeliveryMethod.Network;
                clnt.Credentials = new NetworkCredential("americanautoloansaal@gmail.com", "1234Asdf");

                try
                {
                    clnt.Send(obj);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error:" + ex.ToString()+"')</script>");
                }
                finally
                {

                }
            }

            else
            {
                Response.Write("<script>alert('Sorry we cannot fnd a matching email. Please Sign Up.')</script>");
            }
        }

    }

}