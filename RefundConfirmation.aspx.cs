using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.toml.dp.util;

public partial class RefundConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int keysize = 128;
        string strHashKey = "fBc5628ybRQf88f/aqDUOQ==";
        if (Request.Form.Count > 0 && !string.IsNullOrEmpty(Request.Form[0]))
        {
            var response = AES128Bit.Decrypt(Request.Form[0], strHashKey, keysize);
            string[] arrResponse = response.ToString().Split('|');
            lblRefundRequestID.Text = arrResponse[0];
            lblStatus.Text = arrResponse[1];
            lblMessage.Text = arrResponse[2];
            lblRefundReferenceNo.Text = arrResponse[3];
        }
    }
}