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

public partial class Editprofile : System.Web.UI.Page
{
    functions a = new functions();
    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["foo"]==null)
            Response.Redirect("login.aspx");
        string valueFromSession = Session["foo"].ToString();
        //Response.Write("<script> alert('" + valueFromSession + "');</script>");
        email.Text = valueFromSession;
        bind();

      /*if (!IsPostBack)
          {
            Session.Clear();
             Session.Abandon();
          }  */
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
            profession.Items.Insert(0, new ListItem("Select a  Profession", "-1"));

            country_residence.DataSource = a.dropdown_bind("country_residence");
            country_residence.DataBind();
            country_residence.DataTextField = "name";
            country_residence.DataValueField = "name";
            country_residence.DataBind();
            country_residence.Items.Insert(0, new ListItem("Select a  Country Residence", "-1"));

            state.DataSource = a.dropdown_bind("state");
            state.DataBind();
            state.DataTextField = "name";
            state.DataValueField = "name";
            state.DataBind();
            state.Items.Insert(0, new ListItem("Select a  state", "-1"));

            area_of_interest.DataSource = a.dropdown_bind("area_of_interest");
            area_of_interest.DataBind();
            area_of_interest.DataTextField = "name";
            area_of_interest.DataValueField = "name";
            area_of_interest.DataBind();
            area_of_interest.Items.Insert(0, new ListItem("Select a  Area of Interest", "-1"));

            sector.DataSource = a.dropdown_bind("sector");
            sector.DataBind();
            sector.DataTextField = "name";
            sector.DataValueField = "name";
            sector.DataBind();
            sector.Items.Insert(0, new ListItem("Select a  Sector", "-1"));

            if (Request.QueryString["slug"] == "update")
            {
                title.SelectedValue = a.get_value("title", "registration", Request.QueryString["id"]);
                first_name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("first_name", "registration", Request.QueryString["id"]));
                middle_name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("middle_name", "registration", Request.QueryString["id"]));
                surname.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("surname", "registration", Request.QueryString["id"]));
                age_group.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("age_group", "registration", Request.QueryString["id"]));
                address.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("address", "registration", Request.QueryString["id"]));
                landline.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("landline", "registration", Request.QueryString["id"]));
                mobile.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("mobile", "registration", Request.QueryString["id"]));
                email.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("email", "registration", Request.QueryString["id"]));
                profession.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("profession", "registration", Request.QueryString["id"]));
                organization.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("organization", "registration", Request.QueryString["id"]));
                country_residence.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("country_residence", "registration", Request.QueryString["id"]));
                state.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("state", "registration", Request.QueryString["id"]));
                area_of_interest.SelectedValue = a.get_value("area_of_interest", "registration", Request.QueryString["id"]);

                previous_contribution.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("previous_contribution", "registration", Request.QueryString["id"]));
                sector.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("sector", "registration", Request.QueryString["id"]));
                a_update.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("a_update", "registration", Request.QueryString["id"]));
                visit_india.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("visit_india", "registration", Request.QueryString["id"]));
                contribute.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("contribute", "registration", Request.QueryString["id"]));
                contribute_monthly.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("contribute_monthly", "registration", Request.QueryString["id"]));
                invest.Text = a.get_value("invest", "registration", Request.QueryString["id"]);
                action.Value = "UPDATE";
                identity.Value = Request.QueryString["id"];
            }
        }
    }

   
    public string bind()
    {
        string st = "select * from registration where email='" + email.Text + "'";

        SqlCommand cmd = new SqlCommand(st, scon);
        scon.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            first_name.Text = dr[2].ToString();
            middle_name.Text = dr[3].ToString();
            surname.Text = dr[4].ToString();
            address.Text = dr[6].ToString();
            landline.Text = dr[7].ToString();
            mobile.Text = dr[8].ToString();
            email.Text = dr[9].ToString();
            organization.Text = dr[11].ToString();
            visit_india.Text = dr[18].ToString();
            contribute.Text = dr[19].ToString();
            invest.Text = dr[21].ToString();
            
        }
        scon.Close();
        return null;
    }
    
    protected void Editpro_Click(object sender, EventArgs e)
    {
        string sql = "Update registration set title='" + title.SelectedValue + "', first_name='" + System.Security.SecurityElement.Escape(first_name.Text) + "',middle_name='" + System.Security.SecurityElement.Escape(middle_name.Text) + "', surname='" + System.Security.SecurityElement.Escape(surname.Text) + "',age_group='" + System.Security.SecurityElement.Escape(age_group.Text) + "', address='" + System.Security.SecurityElement.Escape(address.Text) + "', landline='" + System.Security.SecurityElement.Escape(landline.Text) + "', mobile='" + System.Security.SecurityElement.Escape(mobile.Text) + "', profession='" + profession.SelectedValue + "', organization='" + System.Security.SecurityElement.Escape(organization.Text) + "', country_residence='" + System.Security.SecurityElement.Escape(country_residence.Text) + "', state='" + state.SelectedValue + "', area_of_interest='" + area_of_interest.SelectedValue + "', previous_contribution='" + previous_contribution.SelectedValue + "', sector='" + sector.SelectedValue + "', a_update='" + a_update.SelectedValue + "', visit_india='" + System.Security.SecurityElement.Escape(visit_india.Text) + "', contribute='" + System.Security.SecurityElement.Escape(contribute.Text) + "',contribute_monthly='" + System.Security.SecurityElement.Escape(contribute_monthly.Text) + "',invest='" + System.Security.SecurityElement.Escape(invest.Text) + "' where  email='" + System.Security.SecurityElement.Escape(email.Text) + "'";
          a.execute_sql(sql);
        /*MailMessage mailMessage = new MailMessage();
               mailMessage.To.Add(email.Text);
               mailMessage.IsBodyHtml = true;
               mailMessage.From = new MailAddress("noreply.idf@mea.gov.in");
               Attachment data = new Attachment("D:\\idfoi\\idfoinic\\attachment.pdf", MediaTypeNames.Application.Octet);
               mailMessage.Attachments.Add(data);
               mailMessage.Subject = "IDFOI Sucessfull Registration";
               mailMessage.Body = "Dear "+title.SelectedItem.Text + " " + first_name.Text + " " + surname.Text+",<br><br>Thank you for registering with India Development Foundation of Overseas Indians (IDF-OI).<br><br>IDF-OI, a not-for-profit Trust is set up by the Government to enable philanthropy/ contributions from NRIs/PIOs to social and developmental projects in India. IDF-OI is chaired by Hon’ble Minister for External Affairs, Smt. Sushma Swaraj.<br><br>We invite philanthropy/contribution by Overseas Indians to projects related to Swachh Bharat Mission, Clean Ganga Mission and projects in States of India. A vast pool of projects are available in areas of Education, Sanitation, Healthcare, Women’s Empowerment, and Sustainable Livelihood in Rajasthan, Kerala, Karnataka, Punjab, Madhya Pradesh, West Bengal, Chhattisgarh, Uttarakhand, Maharashtra, Bihar, Sikkim, Tamil Nadu, Odisha, and Mizoram. Details of projects (location, unit cost, implementing agency, beneficiaries etc) are at IDF-OI’s website <a href='http://www.idfoi.nic.in'>www.idfoi.nic.in</a>. <br><br>Please select projects of your preference to which you would like to contribute. You can contribute as an individual, or a group of individuals or even through your respective Indian Associations. A snapshot of the projects is attached for your ready reference.<br><br>Contributions can be sent to IDF-OI through a bank transfer to our account:<br><br>India Development Foundation of Overseas Indians<br>State Bank of India<br>Central Secretariat Branch,<br>North Block, New Delhi 110001<br>A/C no. 33819721882<br>IFSC code SBIN0000625<br>MICR 110002014<br><br><b>Kindly note that IDF-OI does not recover any administrative cost from contributions received from Overseas Indians.</b><br><br>In your interactions with the Indian community please inform them about IDF-OI and invite them to connect with us. Please follow IDF-OI on <a href='http://www.facebook.com/idfoi'>www.facebook.com/idfoi</a> and IDF-OI’s twitter handle @GivingtoIndia for regular updates. If you need any further information, please contact us at- <br><br>CEO, IDF-OI ceo.idf@mea.gov.in<br>+91 11 2345678, +91 -11-26881052 <br><br>We look forward to hearing from you.<br><br>Best regards,<br>Team IDF-OI<br><br>India Development Foundation of Overseas Indians<br>Ministry of External Affairs, GoI<br>927, Akbar Bhawan, Chanakyapuri<br>New Delhi-110021<br>Tel:  +91 -11-26881052";
               SmtpClient smtpClient = new SmtpClient("relay.nic.in");
               smtpClient.Send(mailMessage);*/
      // bind();
        Response.Redirect("myprofile.aspx?ADD");
    }

}