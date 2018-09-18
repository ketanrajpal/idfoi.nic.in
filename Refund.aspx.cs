using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using com.toml.dp.util;

public partial class Refund : System.Web.UI.Page
{
    int keysize = 128;
    string strHashKey = "fBc5628ybRQf88f/aqDUOQ==";
    public string EncryptRefundDetails
    {
        get
        {
            string RefundDetails = txtAggregatorId.Text + "|" + txtMerchantId.Text + "|" + txtRefundRequestID.Text + "|" + txtATRN.Text + "|" + txtRefundAmt.Text + "|" + txtAmountCurrency.Text + "|" + txtMerchantOrderNo.Text + "|" + lblRefundResponseURL.Text;
            RefundDetails = AES128Bit.Encrypt(RefundDetails, strHashKey, keysize);
            RefundDetails = RefundDetails.Replace("\n", "");
            return RefundDetails;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRefund_Click(object sender, EventArgs e)
    {
        RefundForm();
    }
    private void RefundForm()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<form name=\"ecom\" method=\"post\" action=\"https://test.sbiepay.com/secure/AggregatorRefundRequest>");
        sb.Append("<input type=\"hidden\" name=\"EncryptRefundDetails\" value=\"" + EncryptRefundDetails + "\">");
        //sb.Append("<input type=\"hidden\" name=\"EncryptbillingDetails\" value=\"" + EncryptbillingDetails + "\">");
        //sb.Append("<input type=\"hidden\" name=\"EncryptshippingDetais\" value=\"" + EncryptshippingDetais + "\">");
        //sb.Append("<input type=\"hidden\" name=\"EncryptpaymentDetails\" value=\"\">");
        sb.Append("<input type=\"hidden\" name=\"merchIdVal\" value =\"1000003\"/>");
        sb.Append("<input type=\"submit\" name=\"submit\" value=\"Proceed\">");
        sb.Append("</form>");
        ltrRefund.Text = sb.ToString();
    }

}