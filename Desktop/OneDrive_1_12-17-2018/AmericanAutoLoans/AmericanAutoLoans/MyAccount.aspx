<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="AmericanAutoLoans.MyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
* {
    margin: 0px;
    padding: 0px;
    box-sizing: border-box;
}

body {
    display: flex;
    flex-direction: column;
    background-color:lightgoldenrodyellow;
}

.header {
    background-image: url('Images/aal.jpg');
    height: 275px;
    width: 100%;
}
table{
    width:40%;
}
.yellow{
    background-color:yellow;
}
.black{
    background-color:black;
    color:lightyellow;
    padding:5px;
    margin-bottom:5px;
}
.button{
    padding:5px;
    width:15em;
    color:blue;
}
    </style>
    <script>
        function confirmation() {
            if (confirm("Are you sure you want to logout")) {
                return true;
            }
            else {
                return true;
            }
        }
    </script>
</head>
<body>
    <header>
        <div class="header"></div>
        <div class="black" style="float:left; width:100%">
            <div style="float:left"><h2>My Account</h2></div>
            <div style="float:right"><asp:Label runat="server" ID="welcomeLabel" Text="Welcome"/></div>
        </div>
    </header>
    <table>
        <tr>
            <td>Account ID (Email Address)</td>
            <td class="yellow"><asp:Label runat="server" ID="emailLabel" /></td>
        </tr>
        <tr>
            <td>Account Application Type</td>
            <td class="yellow"><asp:Label runat="server" ID="appTypeLabel" Text="Hello this is asdfghjkl"/></td>
        </tr>
        <tr>
            <td>Primary Loan Purpose</td>
            <td class="yellow"><asp:Label runat="server" ID="loanPurposeLabel" /></td>
        </tr>
        <tr>
            <td>Loan Amount</td>
            <td class="yellow"><asp:Label runat="server" ID="loanAmountLabel" /></td>
        </tr>
        <tr>
            <td>Loan Term (Months)</td>
            <td class="yellow"><asp:Label runat="server" ID="loanTermLabel" /></td>
        </tr>
        <tr>
            <td>Payment Method</td>
            <td class="yellow"><asp:Label runat="server" ID="payMethodLabel" /></td>
        </tr>
    </table>

    <form id="form1" runat="server">
        <div>
    <table>
        <tr>
            <td><asp:Button runat="server" ID="editPersonalDetails" CssClass="button" Font-Size="Larger" Text="Edit Personal Details" OnClick="onEditClick" /></td>
            <td><asp:Button runat="server" ID="ViewAccountDetails" CssClass="button" Font-Size="Larger" Text="View Account Details" OnClick="onLoanInfoClick" /></td>
            <td><asp:Button runat="server" ID="logout" CssClass="button" Font-Size="Larger" Text="Log Out" OnClick="onLogoutClick" OnClientClick="return confirmation()" /></td>
        </tr>
    </table>
        </div>
    </form>
</body>
</html>
