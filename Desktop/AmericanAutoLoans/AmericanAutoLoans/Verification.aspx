<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Verification.aspx.cs" Inherits="AmericanAutoLoans.WebForm5" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/verification.css" />
</head>
<body style="background-color:lightgoldenrodyellow;">
    <header>
        <div class="header"></div>
        <h2>Verify Account Existence</h2>
    </header>
    <form id="form1" runat="server">
    <div class="verify">
        <p class="red">*<span style="color:cornflowerblue">Required Field</span></p>
        <asp:table ID="table" runat="server">
            <asp:TableRow>
                <asp:TableCell><p class="red">*<span style="color:black">Enter your Email Address</span></p></asp:TableCell>
                <asp:TableCell><p class="red">Do you already have an account with us?</p></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:TextBox runat="server" ID="emailTextBox" type="email" AutoPostBack="true" />
                    <asp:RequiredFieldValidator runat="server" ID="emailv" ControlToValidate="emailTextBox" ForeColor="Red" Text="*" ErrorMessage="Email Required" /></asp:TableCell>
                <asp:TableCell><asp:button runat="server" ID="accExistanceButton" Text="Check Account Existence" OnClick="goToLoanApp" /></asp:TableCell>
            </asp:TableRow>
        </asp:table>
    </div>
    </form>
</body>
</html>