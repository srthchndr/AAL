<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="AmericanAutoLoans.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rates</title>
    <script src="JS/ratesPage.js"></script>
    <link rel="stylesheet" type="text/css" href="./CSS/ratesPage.css" />
    
</head>
<body>
    <header>
        <div class="header"></div>
        <h2>Annual Percentage Rates (APR)</h2>
        <p><b>Loan Amounts, Rates and Terms</b></p>
    </header>
        <div class="ratesTable">
            <table id="info"></table>
        </div>
    <div class="loanTerms">
                <h4>Loan Terms:</h4>
                <ul>
                    <li>Rates quoted with AutoPay option. Invoicing option is 0.50 points higher. Invoices are delivered by email.</li>
                    <li>Fixed rate, simple interest fully amortizing installment loans, no fees or prepayment penalties.</li>
                    <li>Loan proceeds may not be used to refinance any existing loan with LightStream.</li>
                    <li>Florida loans subject to Documentary Stamp Tax. The tax amount is not included in the quoted APR.</li>
                </ul>
            </div>
    <div class="button">
    <button><a href="Home.aspx">Go to Home Page</a></button>
    </div>
</body>
</html>
