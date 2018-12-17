<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AmericanAutoLoans.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>American Auto Loans</title>
    <link rel="stylesheet" type="text/css" href="./CSS/homePage.css" />
    <script src="JS/homePage.js"></script>  
    <style>
        .navBtn{
            padding-left:25px;
            padding-right:25px;
        }

        .imgBtn {
            padding: 10px;
        }
        #apply {
            padding-left: 100px;
            padding-right: 100px;
            background-color: violet;
        }

        #private {
            position:relative;
            padding-left: 40px;
            padding-right: 40px;
            left: 15px;
            background-color: cornflowerblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <div class="header"></div>

        <div class="navDiv">
            <div><a href="Home.aspx"> Home</a > </div>
            <div><a href="Rates.aspx" > Rates</a > </div>
            <div><a href="Questions.aspx"> Questions</a > </div>
            <div><a href="Security.aspx"> Security</a > </div>
            <div style="text-align:end; padding:5px"><asp:button style="background-color:violet" CssClass="navBtn" ID="navApply" runat="server" onclick="redirect" text="APPLY NOW" /> </div>
            <div style="text-align:start; padding:5px"><asp:button style="background-color:greenyellow" CssClass="navBtn" ID="signin" runat="server" OnClick="alert" text="SIGN IN"/> </div>
        </div>
    </header>
    <div class="imageBg">
        <h2>
            <p>THE BEST AUTO LOANS</p>
            <p class="small">from 2.49% APR Auto Pay</p>
            <asp:button runat="server" onclick="redirect" text="APPLY NOW" CssClass="imgBtn" ID="apply" />
            <asp:button runat="server" onclick="redirect" Text="USED CAR PRIVATE PARTY" CssClass="imgBtn" ID="private" />
        </h2>
        
        
    </div>
    <footer>
        <div class="why" ><a id="why1" href="javascript:dispMsg('why')">Why AAL</a></div>
        <div class="exp"  style="text-align:center"><a id="exp1" href="javascript:dispMsg('exp')">100% local experience Guarantee</a></div>
        <div class="rate" style="text-align:end"><a id="rate1" href="javascript:dispMsg('rate')">we will beat any Qualifying rate</a></div>   
    </footer>
    <table id="desc" class="desc" style="display:none">
        <tr><td><p class="why" id="why">When you have good credit, you’ve earned a lower interest rate, and a refreshingly simple loan process. We’ve built our business around that belief, and it’s made us the premier national online consumer lender. Got good credit? Get a low-interest, no-fee loan from $5,000 to $100,000, for practically any purpose, as soon as today.</p></td>
        <td><p class="exp" id="exp">At American Auto Loans we’ve put you, the customer, at the center of the loan process. You decide your loan amount, terms and funding date through an online process that you control. And we guarantee that it will be the best loan process you’ve ever experienced. If after receiving your loan from us you are not completely satisfied, we’ll send you $100.</p></td>
        <td><p class="rate" id="rate">Many lenders claim that they have low interest rates. At America Auto Loans we actually do. We are so confident in the competitiveness of our interest rates that we will beat a qualifying interest rate (APR)2 from any other lender. With our low rates and our commitment to exceptional service, there's no reason to go anywhere else when you need a loan.</p></td></tr>
    </table>

        <div>
        <asp:AdRotator id="Ads1" runat="server" AdvertisementFile="xml/Ads.xml" Target="_blank" KeywordFilter="Car" />
        <asp:AdRotator id="Ads2" runat="server" AdvertisementFile="xml/Ads1.xml" Target="_blank" KeywordFilter="Home" />
        <asp:AdRotator id="Ads3" runat="server" AdvertisementFile="xml/Ads2.xml" Target="_blank" KeywordFilter="Insurance" />
        </div>

    </form>




</body>
</html>
