<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanApplication.aspx.cs" Inherits="AmericanAutoLoans.personalInfo" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *{
            margin:0px;
            padding:0px;
            box-sizing:border-box;
        }

        body{   
            display:flex;
            flex-direction:column;
            background-color:lightgoldenrodyellow;
        }

        .header {
            background-image: url('Images/aal.jpg');
            height: 275px;
            width: 100%;
        }

        #container {
            display:flex;
            padding-left:5px;
        }
        #inline1, #inline2 {
            flex:1;
        }
        #container2 {
            padding-left:5px;
        }
        #container2 .block{
            display:block;
        }
        table {
            width:100%;
        }
        .red {
            color:red;
        }
        #hov {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
}

#hov #hovText {
    visibility: hidden;
    width: 500px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    top: -5px;
    left: 120%;
    
    /* Fade in tooltip - takes 1 second to go from 0% to 100% opac: */
    opacity: 0;
    transition: opacity 1s;
}
#hov #hovText::after {
    content: "";
    position: absolute;
    top: 50%;
    right: 100%;
    margin-top: 5px;
    border-width: 5px;
    border-style: solid;
    border-color: transparent black transparent transparent;
}

#hov:hover #hovText {
    visibility: visible;
    opacity: 1;
}
    </style>
</head>
<body>
    <header>
        <div class="header"></div>
        <div style="background-color:darkolivegreen; text-align:center;"><h2 style="color:gold;">Loan Application</h2></div>
        <p style="color:blue; box-sizing:border-box; padding:10px "><b>Important Information About Procedures for Opening a New Account </b><br />
             Federal law requires all financial institutions to obtain, verify, and record information that identifies each person who opens an account.
             <b>What this means for you?</b> When you open an account, we will ask for your name, address, date of birth and other information that will allow us to identify you. We may also ask to see your driver's license or other identifying documents.
        </p>
        <h2 style="background-color:black; color:gold;">Your Personal Information</h2>
    </header>

    <form id="form1" runat="server">
        <div id="container">
            <div id="inline1"><p class="red">* <span style="color:blue;">Required Field</span></p></div>
            <div id="inline2" style="text-align:end;"><asp:Button ID="edit" Font-Size="Large" Enabled="false" runat="server" Text="Edit" style="float:right; padding:5px" align="right" OnClick="onUpdateClick" /></div>
        </div>

        <asp:ValidationSummary id="Errors" runat="server" ForeColor="red" />

        <div id="container2">
            <div style="float:left; margin-right:5px;">
                <div class="block"><b class="red">*</b><asp:Label ID="fNameLabel" Text="First Name" runat="server" /></div>
                <asp:TextBox runat="server" ID="fNameTextBox" style="width:43em;"/>
                <asp:RequiredFieldValidator runat="server" ID="fNamev" ControlToValidate="fNameTextBox" ForeColor="Red" Text="*" ErrorMessage="First name Required" />
                <asp:RegularExpressionValidator runat="server" ID="fNameregv" ControlToValidate="fNameTextBox" ForeColor="Red" Text="*" ErrorMessage="Check first name" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" />
            </div>

            <div style="float:left; margin-right:5px;">
                <div class="block"><asp:Label ID="mName" Text="Middle Name" runat="server" /></div>
                <asp:TextBox ID="mNameTextBox" runat="server" style="width:22em;" />
                <asp:RegularExpressionValidator runat="server" ID="mNameregv" ControlToValidate="mNameTextBox" ForeColor="Red" Text="*" ErrorMessage="Check middle name" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" />
            </div>
            
            <div style="float:left; margin-right:5px;">
                <div class="block"><b class="red">*</b><asp:Label ID="lName" Text="Last Name" runat="server" /></div>
                <asp:TextBox ID="lNameTextBox" runat="server" style="width:43em;" />
                <asp:RequiredFieldValidator runat="server" ID="passwordv" ControlToValidate="lNameTextBox" ForeColor="Red" Text="*" ErrorMessage="Last name Required" />
                <asp:RegularExpressionValidator runat="server" ID="lNaemregv" ControlToValidate="lNameTextBox" ForeColor="Red" Text="*" ErrorMessage="Check last name" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" />
            </div>
            
            <div style="float:left; margin-right:10px;">
                <div class="block"><b class="red">*</b><asp:Label ID="email1" Text="Email Address 1" runat="server" /></div>
                <asp:TextBox ID="email1TextBox" runat="server" style="width:54em"/>
                <asp:RequiredFieldValidator runat="server" ID="emailv" ControlToValidate="email1TextBox" ForeColor="Red" Text="*" ErrorMessage="Email Required" />
                <asp:RegularExpressionValidator runat="server" ID="emailregv" ControlToValidate="email1TextBox" ForeColor="Red" Text="*" ErrorMessage="Check email format" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            </div>

            <div style="float:left;">
                <div class="block"><asp:Label ID="email2" Text="Email Address 2" runat="server" /></div>
                <asp:Textbox ID="email2Textbox" runat="server" style="width:54em"/>
                <asp:RegularExpressionValidator runat="server" ID="email2regv" ControlToValidate="email2TextBox" ForeColor="Red" Text="*" ErrorMessage="Check email format" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            </div>

            <div style="float:left; margin-right:10px;">
                <div class="block"><b class="red">*</b><asp:Label ID="address" runat="server" Text="Home Street Address (no P.O. boxes)" /></div>
                <asp:TextBox ID="addressTextbox" runat="server" style="width:74em" />
                <asp:RequiredFieldValidator runat="server" ID="addressv" ControlToValidate="addressTextBox" ForeColor="Red" Text="*" ErrorMessage="Address Required" />
            </div>

            <div style="float:left;">
                <div class="block"><asp:Label ID="aptNo" runat="server" Text="Apt# (if Applicable)" /></div>
                <asp:TextBox ID="aptNoTextbox" runat="server" style="width:34em" />
            </div>

            <div style="float:left; margin-right:5px;">
                <div class="block"><b class="red">*</b><asp:Label ID="city" runat="server" Text="City" /></div>
                <asp:TextBox ID="cityTextbox" runat="server" style="width:43em;"/>
                <asp:RequiredFieldValidator runat="server" ID="cityv" ControlToValidate="cityTextBox" ForeColor="Red" Text="*" ErrorMessage="City Required" />
                <asp:RegularExpressionValidator runat="server" ID="cityregv" ControlToValidate="cityTextBox" ForeColor="Red" Text="*" ErrorMessage="Check City Name" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" />
            </div>

            <div style="float:left; margin-right:5px;">
                <div class="block"><b class="red">*</b><asp:Label ID="state" runat="server" Text="State" /></div>
                <asp:TextBox ID="stateTextbox" runat="server" style="width:20em;" />
                <asp:RequiredFieldValidator runat="server" ID="statev" ControlToValidate="stateTextBox" ForeColor="Red" Text="*" ErrorMessage="State Required" />
                <asp:RegularExpressionValidator runat="server" ID="stateregv" ControlToValidate="stateTextBox" ForeColor="Red" Text="*" ErrorMessage="Check State Name" ValidationExpression="^(A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY])$" />
            </div>
            
            <div style="float:left; margin-right:5px;">
                <div class="block"><b class="red">*</b><asp:Label ID="zip" runat="server" Text="Zip" /></div>
                <asp:TextBox ID="zipTextbox" runat="server" style="width:43em;" />
                <asp:RequiredFieldValidator runat="server" ID="zipv" ControlToValidate="zipTextBox" ForeColor="Red" Text="*" ErrorMessage="Zip Required" />
                <asp:RegularExpressionValidator runat="server" ID="zipregv" ControlToValidate="zipTextBox" ForeColor="Red" Text="*" ErrorMessage="Check Zipcode" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" />
            </div>

            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="float:left; margin-right:5px;">
                            <br />
                            <div class="block"><b class="red">*</b><asp:Label ID="phone" runat="server" Text="Home Phone (with area code)" /></div>
                            <asp:TextBox ID="phoneTextbox" runat="server" style="width:44em;" />
                            <asp:RequiredFieldValidator runat="server" ID="phonev" ControlToValidate="phoneTextBox" ForeColor="Red" Text="*" ErrorMessage="Phone Number Required" />
                            <asp:RegularExpressionValidator runat="server" ID="phoneregv" ControlToValidate="phoneTextBox" ForeColor="Red" Text="*" ErrorMessage="Enter correct phone number" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$" />
                        </div>
                    </asp:TableCell>

                    <asp:TableCell style="text-align:center;">
                        <div style="float:left; margin-right:5px;">
                            <div class="block"><b class="red">*</b><asp:Label ID="amtTime" runat="server" Text="Time at Current Address" /></div>
                            <div style="float:left; margin-right:5px;">
                                <div class="block"><asp:Label ID="year" runat="server" style="display:inline;" Text="Years" /></div>
                                <asp:TextBox ID="yearTextbox" runat="server" style="width:5em"/>
                                <asp:RegularExpressionValidator runat="server" ID="yearregv" ControlToValidate="yearTextBox" ForeColor="Red" Text="*" ErrorMessage="Check Year" ValidationExpression="^(\d?[0-9]|[1-9]0)$" />
                            </div>

                            <div style="float:left; margin-right:5px;">
                                <div class="block"><asp:Label ID="month" runat="server" style="display:inline;" Text="Months" /></div>
                                <asp:TextBox ID="monthTextbox" runat="server" style="width:5em;"/>
                                <asp:RequiredFieldValidator runat="server" ID="monthv" ControlToValidate="monthTextBox" ForeColor="Red" Text="*" ErrorMessage="Month Required" />
                                <asp:RegularExpressionValidator runat="server" ID="monthregv" ControlToValidate="monthTextBox" ForeColor="Red" Text="*" ErrorMessage="Check Month" ValidationExpression="^(0?[1-9]|1[012])$" />
                            </div>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell style="text-align:center;">
                        <div style="float:left; margin-right:5px; width:40em;">
                            <br />
                            <div class="block"><b class="red">*</b><asp:Label ID="hStatus" runat="server" Text="Housing Status" /><br /></div>
                            <asp:RadioButtonList ID="hStatusRadio" runat="server" RepeatDirection="Horizontal" >
                                <asp:ListItem Value="0" Selected="true">Rent</asp:ListItem>
                                <asp:ListItem Value="1">Own</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>



            <div style="float:left; margin-right:10px;">
                <div class="block"><b class="red">*</b><asp:Label ID="ssn" runat="server" Text="Social Security (9 digits)" /></div>
                <asp:TextBox ID="ssnTextbox" runat="server" style="width:35em;"/>
                <asp:RequiredFieldValidator runat="server" ID="ssnv" ControlToValidate="ssnTextBox" ForeColor="Red" Text="*" ErrorMessage="SSN Required" />
                <asp:RegularExpressionValidator runat="server" ID="ssnregv" ControlToValidate="ssnTextBox" ForeColor="Red" Text="*" ErrorMessage="Check SSN" ValidationExpression="^\d{3}-?\d{2}-?\d{4}$" />
            </div>

            <div style="float:left; margin-right:10px;">
                <div class="block"><b class="red">*</b><asp:Label ID="dob" runat="server" Text="Date of Birth(dd/mm/yyy)" /></div>
                <asp:TextBox ID="dobTextbox" runat="server" style="width:35em;"/>
                <asp:RequiredFieldValidator runat="server" ID="dobv" ControlToValidate="dobTextBox" ForeColor="Red" Text="*" ErrorMessage="Date of Birth Required" />
                <asp:RegularExpressionValidator runat="server" ID="dobregv" ControlToValidate="dobTextBox" ForeColor="Red" Text="*" ErrorMessage="Check Date of birth" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" />
            </div>

            <div style="float:left; margin-right:5px;">
                <div class="block"><b class="red">*</b><asp:Label ID="license" runat="server" Text="Drivers License(Lase 4 digits)" /></div>
                <asp:TextBox ID="licenseTextbox" runat="server" style="width:35em;"/>
                <asp:RequiredFieldValidator runat="server" ID="licensev" ControlToValidate="licenseTextBox" ForeColor="Red" Text="*" ErrorMessage="License Number Required" />
                <asp:RegularExpressionValidator runat="server" ID="licenseregv" ControlToValidate="licenseTextBox" ForeColor="Red" Text="*" ErrorMessage="Check License Number" ValidationExpression="^[0-9]{4}$" />
            </div>

            <div style="float:left;">
                <div class="block"><b class="red">*</b><asp:Label ID="password" runat="server" Text="Password" /></div>
                <asp:TextBox ID="passTextBox" TextMode="Password" runat="server" style="width:35em;"/>
                <asp:RequiredFieldValidator runat="server" ID="passv" ControlToValidate="passTextBox" ForeColor="Red" Text="*" ErrorMessage="Password Required" />
                <asp:RegularExpressionValidator runat="server" ID="passregv" ControlToValidate="passTextBox" ForeColor="Red" Text="*" ErrorMessage="Password is not strong" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])[a-zA-Z0-9]{8,10}$" />
            </div>

            <div class="block" id="hov" style="float:left;"><br />?
                <span id="hovText">Password must be 8 to 10 characters, contains atleast one digit and one alphabetic character, and must not contain special characters.</span>
            </div>
        </div>

        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell style="text-align:center;">
                    <asp:Button style="margin-top:1em; margin-left:auto; margin-right:auto; padding:5px; color:cornflowerblue;" ID="personalInfoButton" Font-Size="Large" runat="server" Text="Save Personal Information" OnClick="onSavePersonalInfoClicked" />
                </asp:TableCell>

                <asp:TableCell style="text-align:center;">
                    <asp:Button style="margin-top:1em; margin-left:auto; margin-right:auto; padding:5px; color:cornflowerblue;" ID="loanInfoButton" Font-Size="Large" runat="server" Text="Enter Loan Information >>>" OnClick="goToLoanInfo" />
                    
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
</body>
</html>
