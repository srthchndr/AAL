using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AmericanAutoLoans.App_Code;

namespace AmericanAutoLoans
{
    public partial class personalInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String value = (string)Session["type"];
            if(value == "edit")
            {
                edit.Text = "Update and Go Back";
                edit.Enabled = true;

                fNameTextBox.Text = (String)Session["fName"];
                mNameTextBox.Text = (String)Session["mName"];
                lNameTextBox.Text = (String)Session["lName"];
                email1TextBox.Text = (String)Session["email1"];
                email2Textbox.Text = (String)Session["email2"];
                addressTextbox.Text = (String)Session["address"];
                aptNoTextbox.Text = (String)Session["aptNo"];
                cityTextbox.Text = (String)Session["city"];
                stateTextbox.Text = (String)Session["state"];
                zipTextbox.Text = (String)Session["zip"];
                phoneTextbox.Text = (String)Session["phone"];
                yearTextbox.Text = (String)Session["year"];
                monthTextbox.Text = (String)Session["month"];
                hStatusRadio.SelectedItem.Value = (String)Session["hStatus"];
                ssnTextbox.Text = (String)Session["ssn"];
                dobTextbox.Text = (String)Session["dob"];
                licenseTextbox.Text = (String)Session["license"];

                fNameTextBox.Enabled = false;
                mNameTextBox.Enabled = false;
                lNameTextBox.Enabled = false;
                ssnTextbox.Enabled = false;
                dobTextbox.Enabled = false;
                licenseTextbox.Enabled = false;
                personalInfoButton.Enabled = false;
                loanInfoButton.Enabled = false;
            }
            else
            {
                edit.Text = "Edit";
                edit.Enabled = false;
                fNameTextBox.Enabled = true;
                mNameTextBox.Enabled = true;
                lNameTextBox.Enabled = true;
                ssnTextbox.Enabled = true;
                dobTextbox.Enabled = true;
                licenseTextbox.Enabled = true;
                personalInfoButton.Enabled = true;
                loanInfoButton.Enabled = true;

            }
        }

        protected void goToLoanInfo(object sender, EventArgs e)
        {
            Session["fName"] = fNameTextBox.Text;
            Session["mName"] = mNameTextBox.Text;
            Session["lName"] = lNameTextBox.Text;
            Session["email1"] = email1TextBox.Text;
            Session["email2"] = email2Textbox.Text;
            Session["address"] = addressTextbox.Text;
            Session["aptNo"] = aptNoTextbox.Text;
            Session["city"] = cityTextbox.Text;
            Session["state"] = stateTextbox.Text;
            Session["zip"] = zipTextbox.Text;
            Session["phone"] = phoneTextbox.Text;
            Session["year"] = yearTextbox.Text;
            Session["month"] = monthTextbox.Text;
            Session["hStatus"] = hStatusRadio.SelectedItem.Value.ToString();
            Session["ssn"] = ssnTextbox.Text;
            Session["dob"] = dobTextbox.Text;
            Session["license"] = licenseTextbox.Text;

            Server.Transfer("LoanInfo.aspx");
        }

        protected void onUpdateClick(object sender, EventArgs e)
        {
            Server.Transfer("MyAccount.aspx");

            UserInfo cUser = (UserInfo)Session["currentuser"];
            cUser.EmailAddress1 = email1TextBox.Text;
            cUser.EmailAddress2 = email2Textbox.Text;
            cUser.HomeStreetAddress = addressTextbox.Text;
            cUser.HomeAptNo = aptNoTextbox.Text;
            cUser.HomeCity = cityTextbox.Text;
            cUser.HomeState = stateTextbox.Text;
            cUser.HomeZip = zipTextbox.Text;
            cUser.HomePhone = phoneTextbox.Text;
            cUser.TimeAtCurrentAddressYears = Int32.Parse(yearTextbox.Text);
            cUser.TimeAtCurrentAddressMonths = Int32.Parse(monthTextbox.Text);
            cUser.HousingStatus = Int32.Parse(hStatusRadio.SelectedItem.Value);
            cUser.PassWord = passTextBox.Text;

            SqlConnection con = null;
            try
            {
                con = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432018sp01madalas;User ID= madalas; Password=1604652");
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT into MadalaS_WADsp18_UserInfo(EmailAddress1, EmailAddress2, FirstName, MiddleInitials, LastName, HomeStreetAddress, HomeAptNo, HomeCity, HomeState, HomeZip, HomePhone, TimeAtCurrentAddressYears, TimeAtCurrentAddressMonths, HousingStatus, SocialSecurity, DateOfBirth, DLLastFourDigits, Pwd) values(@email1, @email2, @fname, @mname, @lname, @add, @aptno, @city, @state, @zip, @phone, @years, @months, @status, @ssn, @dob, @dll, @password)", con);
                cmd.Prepare();

                cmd.Parameters.AddWithValue("@email1", email1TextBox.Text);

                if (email2Textbox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@email2", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@email2", email2Textbox.Text);

                }
                cmd.Parameters.AddWithValue("@fname", fNameTextBox.Text);

                if (mNameTextBox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@mname", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@mname", mNameTextBox.Text);

                }
                cmd.Parameters.AddWithValue("@lname", lNameTextBox.Text);
                cmd.Parameters.AddWithValue("@add", addressTextbox.Text);

                if (aptNoTextbox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@aptno", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@aptno", aptNoTextbox.Text);

                }
                cmd.Parameters.AddWithValue("@city", cityTextbox.Text);
                cmd.Parameters.AddWithValue("@state", stateTextbox.Text);
                cmd.Parameters.AddWithValue("@zip", zipTextbox.Text);
                cmd.Parameters.AddWithValue("@phone", phoneTextbox.Text);

                if (yearTextbox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@years", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@years", Int32.Parse(yearTextbox.Text));

                }
                cmd.Parameters.AddWithValue("@months", Int32.Parse(monthTextbox.Text));
                cmd.Parameters.AddWithValue("@status", Int32.Parse(hStatusRadio.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@ssn", ssnTextbox.Text);
                cmd.Parameters.AddWithValue("@dob", dobTextbox.Text);
                cmd.Parameters.AddWithValue("@dll", Int32.Parse(licenseTextbox.Text));
                cmd.Parameters.AddWithValue("@password", passTextBox.Text);


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
        }

        protected void onSavePersonalInfoClicked(object sender, EventArgs e)
        {
            //List<UserInfo> allUsersList = Application["AllUserList"] as List<UserInfo>;
            //List<UserInfo> allUsers = new List<UserInfo>();
            //UserInfo user = new UserInfo();


            List<UserInfo> allUsersList = Application["AllUsersList"] as List<UserInfo>;

            if (allUsersList == null)
            {
                allUsersList = new List<UserInfo>();

            }
            UserInfo user = new UserInfo();

            Session["currentuser"] = user;

            user.FirstName = fNameTextBox.Text;
            user.MiddleInitials = mNameTextBox.Text;
            user.LastName = lNameTextBox.Text;
            user.EmailAddress1 = email1TextBox.Text;
            user.EmailAddress2 = email2Textbox.Text;
            user.HomeStreetAddress = addressTextbox.Text;
            user.HomeAptNo = aptNoTextbox.Text;
            user.HomeCity = cityTextbox.Text;
            user.HomeState = stateTextbox.Text;
            user.HomeZip = zipTextbox.Text;
            user.HomePhone = phoneTextbox.Text;
            if(yearTextbox.Text == "")
            {
                user.TimeAtCurrentAddressYears = 0;
            }
            else
            {
                user.TimeAtCurrentAddressYears = Int32.Parse(yearTextbox.Text);
            }
            user.TimeAtCurrentAddressMonths = Int32.Parse(monthTextbox.Text);
            user.HousingStatus = Int32.Parse(hStatusRadio.SelectedItem.Value);
            user.SocialSecurity = ssnTextbox.Text;
            user.DateOfBirth = dobTextbox.Text;
            user.DriversLicenseLastFourDigits = Int32.Parse(licenseTextbox.Text);
            user.PassWord = passTextBox.Text;

            allUsersList.Add(user);

            SqlConnection con = null;
            try
            {
                con = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432018sp01madalas;User ID= madalas; Password=1604652");
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT into MadalaS_WADsp18_UserInfo(EmailAddress1, EmailAddress2, FirstName, MiddleInitials, LastName, HomeStreetAddress, HomeAptNo, HomeCity, HomeState, HomeZip, HomePhone, TimeAtCurrentAddressYears, TimeAtCurrentAddressMonths, HousingStatus, SocialSecurity, DateOfBirth, DLLastFourDigits, Pwd) values(@email1, @email2, @fname, @mname, @lname, @add, @aptno, @city, @state, @zip, @phone, @years, @months, @status, @ssn, @dob, @dll, @password)", con);
                cmd.Prepare();

                cmd.Parameters.AddWithValue("@email1", email1TextBox.Text);

                if(email2Textbox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@email2", DBNull.Value);
                }
                else
                {
                cmd.Parameters.AddWithValue("@email2", email2Textbox.Text);

                }
                cmd.Parameters.AddWithValue("@fname", fNameTextBox.Text);

                if (mNameTextBox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@mname", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@mname", mNameTextBox.Text);

                }
                cmd.Parameters.AddWithValue("@lname", lNameTextBox.Text);
                cmd.Parameters.AddWithValue("@add", addressTextbox.Text);

                if (aptNoTextbox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@aptno", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@aptno", aptNoTextbox.Text);

                }
                cmd.Parameters.AddWithValue("@city", cityTextbox.Text);
                cmd.Parameters.AddWithValue("@state", stateTextbox.Text);
                cmd.Parameters.AddWithValue("@zip", zipTextbox.Text);
                cmd.Parameters.AddWithValue("@phone", phoneTextbox.Text);

                if (yearTextbox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@years", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@years", Int32.Parse(yearTextbox.Text));

                }
                cmd.Parameters.AddWithValue("@months", Int32.Parse(monthTextbox.Text));
                cmd.Parameters.AddWithValue("@status", Int32.Parse(hStatusRadio.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@ssn", ssnTextbox.Text);
                cmd.Parameters.AddWithValue("@dob", dobTextbox.Text);
                cmd.Parameters.AddWithValue("@dll", Int32.Parse(licenseTextbox.Text));
                cmd.Parameters.AddWithValue("@password", passTextBox.Text);


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

        }
    }
}
 
 
 