using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net.Mime;

public partial class register : System.Web.UI.Page
{
    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            
            title.DataSource = a.dropdown_bind("title");
            title.DataBind();
            title.DataTextField = "name";
            title.DataValueField = "name";
            title.DataBind();
            title.Items.Insert(0, new ListItem("Select a  Title", "-1"));

            profession.DataSource = a.dropdown_bind("profession");
            profession.DataBind();
            profession.DataTextField = "name";
            profession.DataValueField = "name";
            profession.DataBind();
            profession.Items.Insert(0, new ListItem("Select your  Profession", "-1"));

            country_residence.DataSource = a.dropdown_bind("country_residence");
            country_residence.DataBind();
            country_residence.DataTextField = "name";
            country_residence.DataValueField = "name";
            country_residence.DataBind();
            country_residence.Items.Insert(0, new ListItem("Select a  Country of Residence", "-1"));

            nationality.DataSource = a.dropdown_bind("country_residence");
            nationality.DataBind();
            nationality.DataTextField = "name";
            nationality.DataValueField = "name";
            nationality.DataBind();
            nationality.Items.Insert(0, new ListItem("Select your Nationality", "-1"));

            state.DataSource = a.dropdown_bind("state");
            state.DataBind();
            state.DataTextField = "name";
            state.DataValueField = "name";
            state.DataBind();
            state.Items.Insert(0, new ListItem("Select a  state", "-1"));

            sector.DataSource = a.dropdown_bind("sector");
            sector.DataBind();
            sector.DataTextField = "name";
            sector.DataValueField = "name";
            sector.DataBind();
            sector.Items.Insert(0, new ListItem("Select a  Sector", "-1"));

             if (Request.QueryString["slug"] == "update")
            {
                title.SelectedValue = a.get_value("title", "registration", Session["id"].ToString());
                first_name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("first_name", "registration", Session["id"].ToString()));
                middle_name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("middle_name", "registration", Session["id"].ToString()));
                surname.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("surname", "registration", Session["id"].ToString()));
                age_group.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("age_group", "registration", Session["id"].ToString()));
                address.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("address", "registration", Session["id"].ToString()));
                mobile.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("mobile", "registration", Session["id"].ToString()));
                email.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("email", "registration", Session["id"].ToString()));
                profession.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("profession", "registration", Session["id"].ToString()));
                country_residence.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("country_residence", "registration", Session["id"].ToString()));
                state.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("state", "registration", Session["id"].ToString()));
                previous_contribution.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("previous_contribution", "registration", Session["id"].ToString()));
                sector.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("sector", "registration", Session["id"].ToString()));
                a_update.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("a_update", "registration", Session["id"].ToString()));
                contribute.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("contribute", "registration", Session["id"].ToString()));
                contribute_monthly.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("contribute_monthly", "registration", Session["id"].ToString()));
                invest.Text = a.get_value("invest", "registration", Session["id"].ToString());
                nationality.Text = a.get_value("nationality", "registration", Session["id"].ToString());
                action.Value = "UPDATE";
                identity.Value = Session["id"].ToString();
            }
        }
    }
   
    protected void submit_Click(object sender, EventArgs e)
    {

        if (action.Value == "ADD")
        {

            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
            string ssql = "select email from registration where email='" + email.Text + "'";
            SqlCommand scmd = new SqlCommand(ssql, scon);
            scon.Open();
            SqlDataReader sdr = scmd.ExecuteReader();
            if (sdr.Read())
            {
                Response.Write("<script>alert('emailid already exist');</script>");
                sdr.Close();
                scon.Close();
            }
            else
            {
                string sql = "Insert into registration (title, first_name,middle_name,surname,age_group, address, mobile, email, profession,country_residence,nationality, state, previous_contribution, sector, a_update, contribute,contribute_monthly,invest,password) VALUES ('" + System.Security.SecurityElement.Escape(title.Text) + "','" + System.Security.SecurityElement.Escape(first_name.Text) + "','" + System.Security.SecurityElement.Escape(middle_name.Text) + "','" + System.Security.SecurityElement.Escape(surname.Text) + "','" + System.Security.SecurityElement.Escape(age_group.Text) + "','" + System.Security.SecurityElement.Escape(address.Text) + "','" + System.Security.SecurityElement.Escape(mobile.Text) + "','" + System.Security.SecurityElement.Escape(email.Text) + "','" + System.Security.SecurityElement.Escape(profession.Text) + "','" + System.Security.SecurityElement.Escape(country_residence.Text) + "','" + System.Security.SecurityElement.Escape(nationality.Text) + "','" + System.Security.SecurityElement.Escape(state.Text) + "','" + System.Security.SecurityElement.Escape(previous_contribution.Text) + "','" + System.Security.SecurityElement.Escape(sector.Text) + "','" + System.Security.SecurityElement.Escape(a_update.Text) + "','" + System.Security.SecurityElement.Escape(contribute.Text) + "','" + System.Security.SecurityElement.Escape(contribute_monthly.Text) + "','" + System.Security.SecurityElement.Escape(invest.Text) + "','" + System.Security.SecurityElement.Escape(confirm_password.Text) + "')";
                a.execute_sql(sql);
                /* MailMessage mailMessage = new MailMessage();
                 mailMessage.To.Add(email.Text);
                 mailMessage.IsBodyHtml = true;
                 mailMessage.From = new MailAddress("noreply.idf@mea.gov.in");
                 Attachment data = new Attachment("D:\\idfoi\\idfoinic\\attachment.pdf", MediaTypeNames.Application.Octet);
                 mailMessage.Attachments.Add(data);
                 mailMessage.Subject = "IDFOI Sucessfull Registration";
                 mailMessage.Body = "Dear " + title.SelectedItem.Text + " " + first_name.Text + " " + surname.Text + ",<br><br>Thank you for registering with India Development Foundation of Overseas Indians (IDF-OI).<br><br>IDF-OI, a not-for-profit Trust is set up by the Government to enable philanthropy/ contributions from NRIs/PIOs to social and developmental projects in India. IDF-OI is chaired by Hon’ble Minister for External Affairs, Smt. Sushma Swaraj.<br><br>We invite philanthropy/contribution by Overseas Indians to projects related to Swachh Bharat Mission, Clean Ganga Mission and projects in States of India. A vast pool of projects are available in areas of Education, Sanitation, Healthcare, Women’s Empowerment, and Sustainable Livelihood in Rajasthan, Kerala, Karnataka, Punjab, Madhya Pradesh, West Bengal, Chhattisgarh, Uttarakhand, Maharashtra, Bihar, Sikkim, Tamil Nadu, Odisha, and Mizoram. Details of projects (location, unit cost, implementing agency, beneficiaries etc) are at IDF-OI’s website <a href='http://www.idfoi.nic.in'>www.idfoi.nic.in</a>. <br><br>Please select projects of your preference to which you would like to contribute. You can contribute as an individual, or a group of individuals or even through your respective Indian Associations. A snapshot of the projects is attached for your ready reference.<br><br>Contributions can be sent to IDF-OI through a bank transfer to our account:<br><br>India Development Foundation of Overseas Indians<br>State Bank of India<br>Central Secretariat Branch,<br>North Block, New Delhi 110001<br>A/C no. 33819721882<br>IFSC code SBIN0000625<br>MICR 110002014<br><br><b>Kindly note that IDF-OI does not recover any administrative cost from contributions received from Overseas Indians.</b><br><br>In your interactions with the Indian community please inform them about IDF-OI and invite them to connect with us. Please follow IDF-OI on <a href='http://www.facebook.com/idfoi'>www.facebook.com/idfoi</a> and IDF-OI’s twitter handle @GivingtoIndia for regular updates. If you need any further information, please contact us at- <br><br>CEO, IDF-OI ceo.idf@mea.gov.in<br>+91 11 2345678, +91 -11-26881052 <br><br>We look forward to hearing from you.<br><br>Best regards,<br>Team IDF-OI<br><br>India Development Foundation of Overseas Indians<br>Ministry of External Affairs, GoI<br>927, Akbar Bhawan, Chanakyapuri<br>New Delhi-110021<br>Tel:  +91 -11-26881052";
                 SmtpClient smtpClient = new SmtpClient("relay.nic.in");
                 smtpClient.Send(mailMessage);*/
                Response.Redirect("registration_complete.aspx");
            }
        }
        else if (action.Value == "UPDATE")
        {
            string sql = "Update registration set title='" + title.SelectedValue + "', first_name='" + System.Security.SecurityElement.Escape(first_name.Text) + "',middle_name='" + System.Security.SecurityElement.Escape(middle_name.Text) + "', surname='" + System.Security.SecurityElement.Escape(surname.Text) + "',age_group='" + System.Security.SecurityElement.Escape(age_group.Text) + "', address='" + System.Security.SecurityElement.Escape(address.Text) + "', mobile='" + System.Security.SecurityElement.Escape(mobile.Text) + "', profession='" + profession.SelectedValue + "', country_residence='" + System.Security.SecurityElement.Escape(country_residence.Text) + "', state='" + state.SelectedValue + "', previous_contribution='" + previous_contribution.SelectedValue + "', sector='" + sector.SelectedValue + "', a_update='" + a_update.SelectedValue + "', contribute='" + System.Security.SecurityElement.Escape(contribute.Text) + "',contribute_monthly='" + System.Security.SecurityElement.Escape(contribute_monthly.Text) + "',invest='" + System.Security.SecurityElement.Escape(invest.Text) + "' where  email='" + Session["email"] + "' and id='"+ Session["id"] + "'";
            a.execute_sql(sql);
            Response.Redirect("default.aspx");
        }
    }
}