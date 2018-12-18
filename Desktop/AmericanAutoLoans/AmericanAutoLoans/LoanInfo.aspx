<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanInfo.aspx.cs" Inherits="AmericanAutoLoans.LoanInfo" UnobtrusiveValidationMode="None" %>
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
}
        #container {
            display:flex;
            padding-left:5px;
        }
        #inline1, #inline2 {
            flex:1;
        }
        .block {
            display:block;
        }
        .blue table,.blue td {
            border: 2px solid white;
            border-collapse:collapse;
        }
        .red{
            color:red;
        }
        .blue{
            color:blue;
        }
    </style>
</head>
<body>
    <header>
        <div class="header"></div>
        <h2>Loan Information</h2>
    </header>
    <p class="blue">Basic Requirements</p>
    <asp:Table runat="server" class="blue" style="width:100%; border: 2px solid white; border-collapse:collapse;">
        <asp:TableRow>
            <asp:TableCell>To Qualify</asp:TableCell>
            <asp:TableCell>You have Good Credit including sufficient income and assets to support your existing debt obligations and requested loan amount.</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>To Apply, You need to</asp:TableCell>
            <asp:TableCell style="padding:10px;">
                <ul style="padding-left:20px">
                    <li>Acknowledge receipt of our Statement on the Use of Electronic Records (click to review)</li>
                    <li>Agree to receive electronic records</li>
                    <li>Agree to use electronic signatures to sign your loan agreement</li>
                </ul>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>If Approved</asp:TableCell>
            <asp:TableCell>Prior to receiving loan proceeds, you must have a valid Visa or MasterCard credit card (for verification purposes only, no charges will be applied).</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Use of Loan Proceeds</asp:TableCell>
            <asp:TableCell>Loans are only made to individuals, not to businesses. Loan proceeds must be used for the loan purpose selected on the application.</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        <div id="container">
            <div id="inline1"><b class="red">*</b><span class="blue">Required Field</span></div>
            <div id="inline2" style="text-align:end;"><button disabled="disabled">Edit</button></div>
        </div>
    <form id="form1" runat="server">
        <div>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="margin-right:2em">
                            <label for="appType" class="block"><b class="red">*</b>Application Type</label>
                            <asp:DropDownList runat="server" ID="DropDownList" style="width:25em; padding:10px;">
                                <asp:ListItem Text="Individual Application" Value="indvApp"/>
                                <asp:ListItem Text="Joint Application" Value="jointApp" />
                            </asp:DropDownList>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <p class="blue">By selecting 'Individual Application', you are applying for individual credit in your name and are relying on your income and assests and not the income or assests of another person as the basis for repayment of the credit request</p>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="margin-right:2em">
                            <label for="pLoanPurpose" class="block"><b class="red">*</b>Primary Loan Purpose</label>
                            <asp:DropDownList runat="server" ID="list" style="width:25em; padding:10px;">
                                 <asp:ListItem Text="Used Auto Purchase from Individual" Value="individual"/>
                                <asp:ListItem Text="New Auto Purchase" Value="newPurchase" />
                                <asp:ListItem Text="Used Auto Purchase from Dealer" Value="usedPurchase" />
                                <asp:ListItem Text="Auto Lease Buyout" Value="leaseBuyout" />
                                <asp:ListItem Text="Auto Loan Refinance" Value="loanRefinance" />
                            </asp:DropDownList>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <p class="blue">If your application is approved, your credit profile will determine weather your loan will be unsecured or secured</p>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <div style="float:left; margin-right:10em;">
                
                <div class ="block"><b class="red">*</b><asp:Label runat="server" ID="zip" Text="Zip Code"/></div>
                <asp:TextBox runat="server" ID="zipTextBox" style="width:10em; padding:10px" class="block"/>
            </div>
            <div style="float:left; margin-right:10em;">
                <div class="block"><b class="red">*</b><asp:Label runat="server" ID="loanAmt" Text="Loan Amount" /></div>
                <asp:TextBox runat="server" ID="loanAmtTextBox" style="width:10em; padding:10px" class="block"/>
                <asp:RequiredFieldValidator runat="server" ID="loanAmtv" ControlToValidate="loanAmtTextBox" ForeColor="Red" ErrorMessage="Loan Amount Required" />
                <asp:RegularExpressionValidator runat="server" ID="loanAmtregv" ControlToValidate="loanAmtTextBox" ForeColor="Red" ErrorMessage="Check Loan Amount" ValidationExpression="^-?(?:0|[1-9]\d{0,2}(?:,?\d{3})*)(?:\.\d+)?$" />
            </div>
            <div style="float:left; margin-right:10em;">
                <div class="block"><b class="red">*</b><asp:Label ID="loanTerm" runat="server" Text="Loan Term(Months)" /></div>
                <asp:TextBox ID="loanTermTextBox" runat="server" class="block" style="width:15em; padding:10px"/>
                <asp:RequiredFieldValidator runat="server" ID="loanTermv" ControlToValidate="loanTermTextBox" ForeColor="Red" ErrorMessage="Loan Term Required" />
                <asp:RegularExpressionValidator runat="server" ID="loanTermregv" ControlToValidate="loanTermTextBox" ForeColor="Red" ErrorMessage="Check Loan Term" ValidationExpression="^(\d?[0-9]|[1-9]0)$" />
            </div>  
            <div><br />
                <div class="block"><b class="red">*</b><asp:Label runat="server" ID="payMethod" Text="Payment Method" /></div>
                <asp:RadioButtonList ID="payMethodRadio" runat="server" RepeatDirection="Horizontal" >
                    <asp:ListItem Value="0" Selected="true">Auto Pay</asp:ListItem>
                    <asp:ListItem Value="1">Invoice</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div><br />
            </div>
            <div style="display:flex">
            <div style="flex:1">
                <asp:CheckBox ID="confirm" runat="server" style="display:inline;"/>
                <asp:Label ID="confirmLabel" runat="server" style="display:inline;" CssClass="blue">I confirm the information given in this form is true, complete and accurate.</asp:Label>
            </div>
            <div style="flex:1; text-align:end;"><asp:Button runat="server" ID="submitButton" style="padding:10px; margin-right:10px;" Text="Submit Loan Application >>>" OnClick="OnBtnClick" /></div>
        </div>
        </div>
    </form>
</body>
</html>
