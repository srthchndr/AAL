<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SigninPage.aspx.cs" Inherits="AmericanAutoLoans.SigninPage" UnobtrusiveValidationMode="None" %>

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

h2 {
    background-color:black;
    color:lightyellow;
    padding:5px;
    margin-bottom:5px;
}
.block{
    display:block;
    margin-bottom:5px;
}
.btn{
    width:100%;
}
.red{
    color:red;
}

    </style>
</head>
<body>
    <header>
        <div class="header"></div>
        <h2>Sign In to my account</h2>
    </header>
    <form id="form1" runat="server">
        <div style="float:left; margin-right:2em;">
             <div class="block"><b class="red">*</b><label for="username">Enter Account Email Address</label></div>
            <asp:TextBox runat="server" ID="username" style="width:30em; padding:5px;" ValidationGroup="required"/>
            <asp:RequiredFieldValidator runat="server" ID="usernamev" ControlToValidate="username" ForeColor="Red" ErrorMessage="Username Required" />
            <asp:RegularExpressionValidator runat="server" ID="emailregv" ControlToValidate="username" ForeColor="Red" Text="*" ErrorMessage="Check email format" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            <div class="block"><asp:HyperLink runat="server" ID="forgotPass" Text="Forgoy your password?" NavigateUrl="PassRecovery.aspx" /></div>
            <asp:Button runat="server" ID="cancel" CausesValidation="false" Text="Cancel" Font-Size="Large" CssClass="btn" OnClick="OnCancelBtn" />
        </div>

        <div style="float:left">
             <div class="block"><b class="red">*</b><label for="password">Enter Account Password</label></div>
            <asp:TextBox runat="server" ID="password" ValidationGroup="required" style="width:30em; padding:5px;" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ID="passwordv" ControlToValidate="password" ForeColor="Red" ErrorMessage="Password Required" />
            <div class="block"><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" EnableTheming="True" onclick="OnLinkClick">I do not have an account</asp:LinkButton></div>
            <asp:Button runat="server" ID="Signin" Text="Sign In" ValidationGroup="required" Font-Size="Large" CssClass="btn" OnClick="onSigninClick" />
        </div>
    </form>
</body>
</html>
