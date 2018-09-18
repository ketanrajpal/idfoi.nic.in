using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using com.toml.dp.util;
using System.Data.SqlClient;
using System.Data;

public partial class contribute_individual : System.Web.UI.Page
{
    functions a = new functions();
    int keysize = 128;
    string strHashKey = "fBc5628ybRQf88f/aqDUOQ==";
    public string EncryptTrans
    {
        get
        {
            string Amount = "0";
            if (ViewState["TotalAmount"] != null && Convert.ToString(ViewState["TotalAmount"]).Contains("."))
                Amount = Convert.ToString(ViewState["TotalAmount"]).Substring(0, Convert.ToString(ViewState["TotalAmount"]).IndexOf("."));
            else
                Amount = Convert.ToString(ViewState["TotalAmount"]);

            string strOrderNo = Convert.ToString(ViewState["OrderID"]);
            string requestparameter = "1000003|DOM|IN|INR|" + Convert.ToString(Amount) + "|Other|http://idfoi.sbcinfotech.com/PaymentConfirmation.aspx|https://test.sbiepay.com/secure/fail.jsp|SBIEPAY|" + strOrderNo + "|" + strOrderNo + "|NB|ONLINE|ONLINE";
            requestparameter = AES128Bit.Encrypt(requestparameter, strHashKey, keysize);
            requestparameter = requestparameter.Replace("\n", "");
            return requestparameter;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ViewState["TotalAmount"] = Request.QueryString["amount"];
                ViewState["ProjectCode"] = Request.QueryString["ProjectCode"];

                individual_country_residence.DataSource = a.dropdown_bind("country_residence");
                individual_country_residence.DataBind();
                individual_country_residence.DataTextField = "name";
                individual_country_residence.DataValueField = "name";
                individual_country_residence.DataBind();
                individual_country_residence.Items.Insert(0, new ListItem("Select a  Country", "-1"));

                individual_state.DataSource = a.dropdown_bind("state");
                individual_state.DataBind();
                individual_state.DataTextField = "name";
                individual_state.DataValueField = "name";
                individual_state.DataBind();
                individual_state.Items.Insert(0, new ListItem("Select a  state", "-1"));

                if (Session["foo"] != null)
                {
                    string Sql = "select first_name,middle_name,surname,email,state,nationality from registration where email='" + Convert.ToString(Session["foo"]) + "'";
                    DataTable dtTemp = a.get_value(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        individual_first_name.Text = Convert.ToString(dtTemp.Rows[0]["first_name"]);
                        individual_middle_name.Text = Convert.ToString(dtTemp.Rows[0]["middle_name"]);
                        individual_last_name.Text = Convert.ToString(dtTemp.Rows[0]["surname"]);
                        individual_email_address.Text = Convert.ToString(dtTemp.Rows[0]["email"]);

                        if (individual_state.Items.FindByText(Convert.ToString(dtTemp.Rows[0]["state"])) != null)
                            individual_state.SelectedValue = individual_state.Items.FindByText(Convert.ToString(dtTemp.Rows[0]["state"])).Value;
                        if (individual_country_residence.Items.FindByText(Convert.ToString(dtTemp.Rows[0]["nationality"])) != null)
                            individual_country_residence.SelectedValue = individual_country_residence.Items.FindByText(Convert.ToString(dtTemp.Rows[0]["nationality"])).Value;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message;
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
        string strOrderID = "70000";
        string strAmount = "0";
        string strProjectCode = "0";
        if (ViewState["TotalAmount"] != null)
            strAmount = Convert.ToString(ViewState["TotalAmount"]);
        if (ViewState["ProjectCode"] != null)
            strProjectCode = Convert.ToString(ViewState["ProjectCode"]);
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        con = new SqlConnection(a.connect());
        con.Open();
        cmd = new SqlCommand("SELECT MAX(Order_ID) AS OrderID FROM (SELECT order_id AS Order_ID FROM dbo.association UNION SELECT order_id AS Order_ID FROM dbo.individual) AS ud", con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            string strTmpOdrID = Convert.ToString(dr["OrderID"]);
            if (strTmpOdrID != "0")
                strOrderID = Convert.ToString(Convert.ToInt32(strTmpOdrID)+1);
        }

        ViewState["OrderID"] = strOrderID;
        //string sql = "Insert into individual (individual_first_name, individual_middle_name, individual_last_name, individual_email_address, individual_country_residence, individual_state,individual_foreingn_verification_proof, individual_verification_no,order_id,amount,project_code) VALUES ('" + individual_first_name.Text + "','" + individual_middle_name.Text + "','" + individual_last_name.Text + "','" + individual_email_address.Text + "','" + individual_country_residence.SelectedValue + "','" + individual_state.SelectedValue + "','" + individual_foreingn_verification_proof.Text + "','" + individual_verification_no.Text + "','" + strOrderID + "','" + strAmount + "','" + strProjectCode + "')";
        //a.execute_sql(sql);


        //Response.Redirect("registration_complete.aspx?ADD");
        PaymentFormCreate();
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message;
        }
    }
    private void PaymentFormCreate()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<form id='sbipayement' name=\"ecom\" method=\"post\" action=\"https://test.sbiepay.com/secure/AggregatorHostedListener\">");
        sb.Append("<input type=\"hidden\" name=\"EncryptTrans\" value=\"" + EncryptTrans + "\">");
        //sb.Append("<input type=\"hidden\" name=\"EncryptbillingDetails\" value=\"" + EncryptbillingDetails + "\">");
        //sb.Append("<input type=\"hidden\" name=\"EncryptshippingDetais\" value=\"" + EncryptshippingDetais + "\">");
        //sb.Append("<input type=\"hidden\" name=\"EncryptpaymentDetails\" value=\"\">");
        sb.Append("<input type=\"hidden\" name=\"merchIdVal\" value =\"1000003\"/>");
        //sb.Append("<input type=\"submit\" name=\"submit\" value=\"Proceed\">");
        sb.Append("</form>");
        ltBody.Text = sb.ToString();
        pnlBody.Enabled = false;
        tbl_PaymentGateway.Visible = true;
        ClientScript.RegisterClientScriptBlock(this.GetType(), Guid.NewGuid().ToString(), "$(document).ready(function(){$('#sbipayement').submit();});", true);
    }
}