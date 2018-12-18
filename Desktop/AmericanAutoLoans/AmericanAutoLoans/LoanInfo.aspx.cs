using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using AmericanAutoLoans.App_Code;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;

namespace AmericanAutoLoans
{
    public partial class LoanInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            zipTextBox.Text = Session["zip"].ToString();
            string val = (string)Session["clicked"];
            if(val == "private")
            {
                list.Items.FindByValue("individual").Selected = true;
                list.Enabled = false;
            }
            else if(val == "apply")
            {
                list.Enabled = true;
                list.Items.FindByValue("individual").Enabled = false;
            }
            if(val == "loanInfo")
            {
                DropDownList.SelectedItem.Text = Session["appType"].ToString();
                list.SelectedItem.Text = Session["loanPurpose"].ToString();
                loanAmtTextBox.Text = Session["loanAmt"].ToString();
                loanTermTextBox.Text = Session["loanTerm"].ToString();
                payMethodRadio.SelectedItem.Text = Session["payMethod"].ToString();
                loanAmtTextBox.Enabled = false;
                loanTermTextBox.Enabled = false;
                payMethodRadio.Enabled = false;
                zipTextBox.Text = Session["zip"].ToString();
                zipTextBox.Enabled = false;
                DropDownList.Enabled = false;
                list.Enabled = false;

                submitButton.Text = "Go Back";
            }
        }

        protected void OnBtnClick(object sender, EventArgs e)
        {
            if(submitButton.Text == "Go Back")
            {
                Server.Transfer("MyAccount.aspx");
            }
            else
            {
                if (confirm.Checked)
                {

                    List<UserInfo> allUsersList = Application["AllUserList"] as List<UserInfo>;
                    //List<LoanInfor> tempLoan = new List<LoanInfor>();
                    LoanInfor loan = new LoanInfor();
                    UserInfo cUser = (UserInfo)Session["currentuser"];

                    loan.ApplicationType = DropDownList.SelectedItem.Text.ToString();
                    loan.PrimaryLoanPurpose = list.SelectedItem.Text.ToString();
                    loan.LoanAmount = Int32.Parse(loanAmtTextBox.Text.Split('.')[0]);
                    loan.LoanTerm = Int32.Parse(loanTermTextBox.Text);
                    loan.LoanPaymentMethod = Int32.Parse(payMethodRadio.SelectedItem.Value);

                    cUser.loanInfor.Add(loan);

                    SqlConnection con = null;
                    try
                    {
                        con = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432018sp01madalas;User ID= madalas; Password=1604652");
                        con.Open();
                        SqlCommand cmd = new SqlCommand("INSERT into MadalaS_WADsp18_LoanInfo(emailAddress, applicationType, primaryLoanPurpose, loanAmount, loanTerm, loanPaymentMethod) values(@Email, @AppType, @Purpose, @Amount, @Term, @PayMethod)", con);
                        cmd.Prepare();

                        cmd.Parameters.AddWithValue("@Email", cUser.EmailAddress1);
                        cmd.Parameters.AddWithValue("@AppType", DropDownList.SelectedItem.Text.ToString());
                        cmd.Parameters.AddWithValue("@Purpose", list.SelectedItem.Text.ToString());
                        cmd.Parameters.AddWithValue("@Amount", Int32.Parse(loanAmtTextBox.Text.Split('.')[0]));
                        cmd.Parameters.AddWithValue("@Term", Int32.Parse(loanTermTextBox.Text));
                        cmd.Parameters.AddWithValue("@PayMethod", Int32.Parse(payMethodRadio.SelectedItem.Value));


                        cmd.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        Response.Write("<script>alert('error" + ex.ToString() + "')</script>");
                    }
                    finally
                    {
                        con.Close();
                    }


                    String msgTo = cUser.EmailAddress1;
                    String msgSub = "Thank you for your interest in AmericalAutoLoans";
                    String msgBody = "Dear New User " + cUser.EmailAddress1 + "<br /> Thank you for creating AmericanAutoLoans account. Our staff will review your application within the next 24 hours. You will recieve an email notification with few more details. <br /> Our support staff is available 24 hours a day to answer questions regarding your loan application.<br /> Thank You. <br /> AmericanAutoLoans.com Team";
                    MailMessage obj = new MailMessage();
                    obj.Body = msgBody;
                    obj.From = new MailAddress("infomailinfotest@gmail.com", "American Auto Loans");
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
                        //Label1.Text = ex.ToString();
                    }
                    finally
                    {

                    }

                    Session["appType"] = DropDownList.SelectedItem;
                    Session["loanPurpose"] = list.SelectedItem;
                    Session["loanAmt"] = loanAmtTextBox.Text;
                    Session["loanTerm"] = loanTermTextBox.Text;
                    Session["payMethod"] = payMethodRadio.SelectedItem;

                    Response.Write("<script>alert('Thank you " + cUser.FirstName + " " + cUser.LastName + " for creating Account with us. You can now Signin')</script>");
                    Server.Transfer("Home.aspx");

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please accept conformation checkbox');", true);

                }
            }

        }
    }
}