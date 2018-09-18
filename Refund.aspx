<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Refund.aspx.cs" Inherits="Refund" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="tblRefund" cellpadding="0" cellspacing="0" runat="server">
            <tr>
                <td>
                    <span>Refund Process.</span>
                    <table cellpadding="0" cellspacing="0" border="1">
                        <tr>
                            <td>
                                AggregatorId
                            </td>
                            <td>
                                <asp:TextBox ID="txtAggregatorId" runat="server" Text="SBIEPAY" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                MerchantId
                            </td>
                            <td>
                                <asp:TextBox ID="txtMerchantId" runat="server" Text="1000003" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                RefundRequestID
                            </td>
                            <td>
                                <asp:TextBox ID="txtRefundRequestID" runat="server" Text="12345" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ATRN
                            </td>
                            <td>
                                <asp:TextBox ID="txtATRN" runat="server" Text="5877309384731" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Refund Amount
                            </td>
                            <td>
                                <asp:TextBox ID="txtRefundAmt" runat="server" Text="100" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Currency
                            </td>
                            <td>
                                <asp:TextBox ID="txtAmountCurrency" runat="server" Text="INR" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                MerchantOrderNo
                            </td>
                            <td>
                                <asp:TextBox ID="txtMerchantOrderNo" runat="server" Text="10004" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                RefundResponseURL
                            </td>
                            <td>
                                <asp:Label ID="lblRefundResponseURL" runat="server" Text="http://idfoi.sbcinfotech.com/RefundConfirmation.aspx" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnRefund" runat="server" Text="Refund" OnClick="btnRefund_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <asp:Literal ID="ltrRefund" runat="server"></asp:Literal>
</body>
</html>
