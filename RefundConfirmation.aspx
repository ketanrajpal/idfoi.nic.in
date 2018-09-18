<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RefundConfirmation.aspx.cs" Inherits="RefundConfirmation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellpadding="0" cellspacing="0" border="1">
            <tr>
                <td>
                    RefundRequestID
                </td>
                <td>
                    <asp:Label ID="lblRefundRequestID" runat="server" />
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
                    Message
                </td>
                <td>
                    <asp:Label ID="lblMessage" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    RefundReferenceNo
                </td>
                <td>
                    <asp:Label ID="lblRefundReferenceNo" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
