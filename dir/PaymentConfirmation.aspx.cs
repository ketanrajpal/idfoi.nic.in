using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.toml.dp.util;
using System.Data.SqlClient;

public partial class PaymentConfirmatio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int keysize = 128;
        string strHashKey = "fBc5628ybRQf88f/aqDUOQ==";
        if (Request.Form.Count > 0 && !string.IsNullOrEmpty(Request.Form[0]))
        {
            var response = AES128Bit.Decrypt(Request.Form[0], strHashKey, keysize);
            string[] arrResponse = response.ToString().Split('|');
            lblOrderID.Text = arrResponse[0];
            lblAtrn.Text = arrResponse[1];
            lblStatus.Text = arrResponse[2];
            lblAmount.Text = arrResponse[3];
            lblCurrency.Text = arrResponse[4];
            lblPaymode.Text = arrResponse[5];
            lblOtherDetails.Text = arrResponse[6];
            lblBankCode.Text = arrResponse[8];
            lblBankReferenceNumber.Text = arrResponse[9];
            lblTransDate.Text = arrResponse[10];
            lblCountry.Text = arrResponse[11];
            lblCIN.Text = arrResponse[12];

            functions a = new functions();
            string sql = "UPDATE dbo.association SET atrn = '" + lblAtrn.Text + "' WHERE order_id = '" + lblOrderID.Text + "'";
            SqlCommand c = new SqlCommand(sql);
            SqlConnection con = new SqlConnection(a.connect()); ;
            try
            {
                a.execute_sql(sql);
                //con.Open();
                //int i = c.ExecuteNonQuery();
                //if (i == 0)
                //{
                sql = "UPDATE dbo.individual SET atrn = '" + lblAtrn.Text + "' WHERE order_id = '" + lblOrderID.Text + "'";
                //    c = new SqlCommand(sql);
                //    i = c.ExecuteNonQuery();
                //}
                a.execute_sql(sql);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                c.Dispose();
                con.Close();
            }

        }
    }
}
