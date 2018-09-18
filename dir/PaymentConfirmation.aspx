<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PaymentConfirmation.aspx.cs" Inherits="PaymentConfirmatio" %>
<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
.mytabtab tr:nth-child(odd){
background-color:#ededed;
}
.mytabtab td
{
padding:10px;
font-size:13px !important;
}
.mytabtab td:nth-child(1)
{
font-weight:bold !important;
}
</style>

    <form id="myform" runat="server">


        <h1>Transaction Successful</h1>
        <br /><br />
    <table class="mytabtab">
            <tr>
                <td>
                    Order ID
                </td>
                <td>
                    <asp:Label ID="lblOrderID" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    SBIePay Reference ID
                </td>
                <td>
                    <asp:Label ID="lblAtrn" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Status
                </td>
                <td>
                    <asp:Label ID="lblStatus" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Amount
                </td>
                <td>
                    <asp:Label ID="lblAmount" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Currency
                </td>
                <td>
                    <asp:Label ID="lblCurrency" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Paymode
                </td>
                <td>
                    <asp:Label ID="lblPaymode" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Other Details
                </td>
                <td>
                    <asp:Label ID="lblOtherDetails" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                   Bank Code
                </td>
                <td>
                    <asp:Label ID="lblBankCode" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                   Bank Reference Number
                </td>
                <td>
                    <asp:Label ID="lblBankReferenceNumber" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                   Transaction Date
                </td>
                <td>
                    <asp:Label ID="lblTransDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                   Country
                </td>
                <td>
                    <asp:Label ID="lblCountry" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                   CIN
                </td>
                <td>
                    <asp:Label ID="lblCIN" runat="server" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
    </form>
</asp:Content>
