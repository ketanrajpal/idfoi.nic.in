using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using com.toml.dp.util;

public partial class contribute_association : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Request.QueryString["amount"]!=null)
            ViewState["TotalAmount"] = Request.QueryString["amount"].Replace(",","").Replace("₹","");
            if (Request.QueryString["ProjectCode"] != null)
            ViewState["ProjectCode"] = Request.QueryString["ProjectCode"];

            association_country_residence.DataSource = a.dropdown_bind("country_residence");
            association_country_residence.DataBind();
            association_country_residence.DataTextField = "name";
            association_country_residence.DataValueField = "name";
            association_country_residence.DataBind();
            association_country_residence.Items.Insert(0, new ListItem("Organisation Registered", "-1"));
        }
    }

    int keysize = 128;
    string strHashKey = "fBc5628ybRQf88f/aqDUOQ==";
    public string EncryptTrans
    {
        get
        {
            string Amount="0";
            if (ViewState["TotalAmount"] != null && Convert.ToString(ViewState["TotalAmount"]).Contains("."))
                Amount = Convert.ToString(ViewState["TotalAmount"]).Substring(0, Convert.ToString(ViewState["TotalAmount"]).IndexOf("."));
            else
                Amount = Convert.ToString(ViewState["TotalAmount"]);
            string strOrderNo = Convert.ToString(ViewState["OrderID"]);
            string requestparameter = "1000003|DOM|IN|INR|" + Amount + "|Other|http://idfoi.sbcinfotech.com/PaymentConfirmation.aspx|https://test.sbiepay.com/secure/fail.jsp|SBIEPAY|" + strOrderNo + "|" + strOrderNo + "|NB|ONLINE|ONLINE";
            requestparameter = AES128Bit.Encrypt(requestparameter, strHashKey, keysize);
            requestparameter = requestparameter.Replace("\n", "");
            return requestparameter;
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
                strAmount = Convert.ToString(ViewState["TotalAmount"]).Replace(",","");
            if (ViewState["ProjectCode"] != null)
                strProjectCode = Convert.ToString(ViewState["ProjectCode"]);
            SqlConnection con;
            SqlCommand cmd;
            SqlDataReader dr;
            con = new SqlConnection(a.connect());
            con.Open();
            cmd = new SqlCommand("SELECT MAX(CONVERT(int, ISNULL(dbo.individual.order_id, 0))) AS OrderIDIndividual, MAX(CONVERT(int, ISNULL(dbo.association.order_id, 0))) AS OrderIDAssociation FROM dbo.association CROSS JOIN dbo.individual", con);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                int iTmpOdrIDIndividual;
                int iTmpOdrIDAssociation;
                string strTmpOdrID;
                try
                {
                    if (dr["OrderIDIndividual"] == null || string.IsNullOrEmpty(Convert.ToString(dr["OrderIDIndividual"])))
                        iTmpOdrIDIndividual = 0;
                    else
                        iTmpOdrIDIndividual = Convert.ToInt32(dr["OrderIDIndividual"]);
                    if (dr["OrderIDAssociation"] == null || string.IsNullOrEmpty(Convert.ToString(dr["OrderIDAssociation"])))
                        iTmpOdrIDAssociation = 0;
                    else
                        iTmpOdrIDAssociation = Convert.ToInt32(dr["OrderIDAssociation"]);
                }
                catch (Exception ex)
                {
                    iTmpOdrIDIndividual = 0;
                    iTmpOdrIDAssociation = 0;
                }
                if (iTmpOdrIDIndividual > iTmpOdrIDAssociation)
                    strTmpOdrID = iTmpOdrIDIndividual.ToString();
                else
                    strTmpOdrID = iTmpOdrIDAssociation.ToString();
                if (strTmpOdrID != "0")
                    strOrderID = Convert.ToString(Convert.ToInt32(strTmpOdrID) + 1);
            }
            ViewState["OrderID"] = strOrderID;

            string sql = "Insert into association (association_name, association_first_name, association_middle_name, association_last_name, registered_organization, registration_number, association_country_residence, association_verification_proof, association_verification_no, association_email_address,order_id,amount,project_code) VALUES ('" + association_name.Text + "','" + association_first_name.Text + "','" + association_middle_name.Text + "','" + association_last_name.Text + "','" + registered_organization.SelectedValue + "','" + registration_number.Text + "','" + association_country_residence.SelectedValue + "','" + association_verification_proof.SelectedValue + "','" + association_verification_no.Text + "','" + association_email_address.Text + "','" + strOrderID + "','" + strAmount + "','" + strProjectCode + "')";
            a.execute_sql(sql);
            //Response.Redirect("registration_complete.aspx?ADD");
            PaymentFormCreate();
        }
        catch(Exception ex)
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