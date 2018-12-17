using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using AmericanAutoLoans.App_Code;

namespace AmericanAutoLoans
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["AllUsersList"] = new List<UserInfo>();

            List<UserInfo> allUsersList = Application["AllUsersList"] as List<UserInfo>;

            SqlConnection con = null;
            SqlConnection con2 = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432018sp01madalas;User ID= madalas; Password=1604652");



            try
            {
                con = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432018sp01madalas;User ID= madalas; Password=1604652");
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from MadalaS_WADsp18_UserInfo", con);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    UserInfo user = new UserInfo();

                    user.EmailAddress1 = reader["EmailAddress1"].ToString();
                    user.EmailAddress2 = reader["EmailAddress2"].ToString();
                    user.FirstName = reader["FirstName"].ToString();
                    user.MiddleInitials = reader["MiddleInitials"].ToString();
                    user.LastName = reader["LastName"].ToString();
                    user.HomeStreetAddress = reader["HomeStreetAddress"].ToString();
                    user.HomeAptNo = reader["HomeAptNo"].ToString();
                    user.HomeCity = reader["HomeCity"].ToString();
                    user.HomeState = reader["HomeState"].ToString();
                    user.HomeZip = reader["HomeZip"].ToString();
                    user.HomePhone = reader["HomePhone"].ToString();
                    user.TimeAtCurrentAddressYears = Int32.Parse(reader["TimeAtCurrentAddressYears"].ToString());
                    user.TimeAtCurrentAddressMonths = Int32.Parse(reader["TimeAtCurrentAddressMonths"].ToString());
                    user.HousingStatus = Int32.Parse(reader["HousingStatus"].ToString());
                    user.SocialSecurity = reader["SocialSecurity"].ToString();
                    user.DateOfBirth = reader["DateOfBirth"].ToString();
                    user.DriversLicenseLastFourDigits = Int32.Parse(reader["DLLastFourDigits"].ToString());
                    user.PassWord = reader["Pwd"].ToString();

                    allUsersList.Add(user);


                    con2 = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432018sp01madalas;User ID= madalas; Password=1604652");
                    con2.Open();
                    SqlCommand cmd2 = new SqlCommand("select * from MadalaS_WADsp18_LoanInfo", con2);

                    SqlDataReader reader2 = cmd2.ExecuteReader();

                    while(reader2.Read())
                    {
                        LoanInfor loan = new LoanInfor();

                        loan.ApplicationType = reader2["applicationType"].ToString();
                        loan.PrimaryLoanPurpose = reader2["primaryLoanPurpose"].ToString();
                        loan.LoanAmount = float.Parse(reader2["loanAmount"].ToString(), CultureInfo.InvariantCulture.NumberFormat);
                        loan.LoanTerm = Int32.Parse(reader2["loanTerm"].ToString());
                        loan.LoanPaymentMethod = Int32.Parse(reader2["loanPaymentMethod"].ToString());

                        for(var i = 0; i < allUsersList.Count; i++)
                        {
                            if(allUsersList[i].EmailAddress1 == reader2["emailAddress"].ToString())
                            {
                                allUsersList[i].loanInfor.Add(loan);
                            }
                        }
                        user.loanInfor.Add(loan);

                    }

                }
            }
            catch(SqlException ex)
            {
                Response.Write("<script>alert('error" + ex.ToString() + "')</script>");
            }
            finally
            {
                con.Close();
                con2.Close();
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}