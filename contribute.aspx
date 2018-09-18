<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contribute.aspx.cs" Inherits="contribute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .individual, .association {
            display:none;
        }
    </style>

    <script type="text/javascript">
        function getform() {
            if (document.getElementById('contributeby').value == "-1" || document.getElementById('contribution_amount').value=="") {
                alert("Please enter the Contributed By and Contribution Amount.");
                return false;
            }
            else {
                if (document.getElementById('contributeby').value == "individual") {
                    document.myform.action ="contribute_individual.aspx?amount=" + document.getElementById('contribution_amount').value;
                    return true;
                }
                else if (document.getElementById('contributeby').value == "association") {
                    document.myform.action = "contribute_association.aspx?amount=" + document.getElementById('contribution_amount').value;
                    return true;
                }
            }
        }
    </script>

    <h1>Contribute to IDFOI</h1>

    <form name="myform" id="myform" class="feedback" onsubmit="return getform()">

        
        <fieldset>

            <label>Contribution Amount in USD<span class="imp">*</span></label>
            <input type="text" id="contribution_amount" name="contribution_amount" />
            

        </fieldset>

            <div class="clear"></div>
            <p>Do you want to give as a <span class="imp">*</span><br />
            <input type="radio" />Regular Giving Programme<br />
            <input type="radio" />Single Contribution
                </p>

        <div class="clear"></div>
<br /><br />
        <input type="submit" />
        <br /><br />

        <p style="background-color:#ededed;line-height:150%;padding:10px 20px;">*With our Regular Giving programme, you can send as little as $50 to IDF-OI at regular intervals. You can give instructions to your bank to transfer the amount from your bank account to IDF-OI's bank account. You can increase/decrease the amount you wish to give, or even discontinue the funding when you want to. </p>

    </form>


</asp:Content>

