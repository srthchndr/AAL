<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PassRecovery.aspx.cs" Inherits="AmericanAutoLoans.PassRecovery" UnobtrusiveValidationMode="None" %>

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
}
.btn{
    width: 16em;
}
        .red {
            color: red;
        }
    </style>
</head>
<body>
    <header>
        <div class="header"></div>
        <h2>Recover Password</h2>
    </header>
    <form id="form1" runat="server">
        <div>
            <b class="red" style="margin-left:10px;">*</b><label for="username" style="margin-right:10px;">Enter Account Email Address</label>
            <asp:TextBox runat="server" ID="username" style="width:30em; padding:5px;"/>
            <asp:RequiredFieldValidator runat="server" ID="emailv" ControlToValidate="username" ForeColor="Red" ErrorMessage="Email Required" />
            <asp:RegularExpressionValidator runat="server" ID="emailregv" ControlToValidate="username" ForeColor="Red" ErrorMessage="Check email format" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />

            <div>
                <div style="float:left; margin:1em;"><asp:Button runat="server" ID="cancel" Text="Cancel" Font-Size="Large" CssClass="btn" OnClick="OnCancelClick" /></div>
                <div style="float:left; margin:1em;"><asp:Button runat="server" ID="passRecovery" Text="Recover Password" Font-Size="Large" CssClass="btn" OnClick="onRecovery" /></div>
            
            </div>
           
        </div>
    </form>
</body>
</html>
