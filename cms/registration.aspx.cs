using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registration : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            title.DataSource = a.dropdown_bind("title");
            title.DataBind();
            title.DataTextField = "name";
            title.DataValueField = "id";
            title.DataBind();
            title.Items.Insert(0, new ListItem("Select a  Title", "-1"));

            profession.DataSource = a.dropdown_bind("profession");
            profession.DataBind();
            profession.DataTextField = "name";
            profession.DataValueField = "id";
            profession.DataBind();
            profession.Items.Insert(0, new ListItem("Select a  Profession", "-1"));

            country_residence.DataSource = a.dropdown_bind("country_residence");
            country_residence.DataBind();
            country_residence.DataTextField = "name";
            country_residence.DataValueField = "id";
            country_residence.DataBind();
            country_residence.Items.Insert(0, new ListItem("Select a  Country Residence", "-1"));

            state.DataSource = a.dropdown_bind("state");
            state.DataBind();
            state.DataTextField = "name";
            state.DataValueField = "id";
            state.DataBind();
            state.Items.Insert(0, new ListItem("Select a  State", "-1"));

            area_of_interest.DataSource = a.dropdown_bind("area_of_interest");
            area_of_interest.DataBind();
            area_of_interest.DataTextField = "name";
            area_of_interest.DataValueField = "id";
            area_of_interest.DataBind();
            area_of_interest.Items.Insert(0, new ListItem("Select a  Area of interest", "-1"));

            sector.DataSource = a.dropdown_bind("sector");
            sector.DataBind();
            sector.DataTextField = "name";
            sector.DataValueField = "id";
            sector.DataBind();
            sector.Items.Insert(0, new ListItem("Select a  Sector", "-1"));

            


            if (Request.QueryString["slug"] == "update")
            {
                title.SelectedValue = a.get_value("title", "registration", Request.QueryString["id"]);
                first_name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("first_name", "registration", Request.QueryString["id"]));
                surname.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("surname", "registration", Request.QueryString["id"]));
                age_group.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("age_group", "registration", Request.QueryString["id"]));
                address.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("address", "registration", Request.QueryString["id"]));
                landline.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("landline", "registration", Request.QueryString["id"]));
                mobile.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("mobile", "registration", Request.QueryString["id"]));
                email.Text =System.Web.HttpUtility.HtmlDecode( a.get_value("email", "registration", Request.QueryString["id"]));
                profession.SelectedValue = a.get_value("profession", "registration", Request.QueryString["id"]);
                organization.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("organization", "registration", Request.QueryString["id"]));
                country_residence.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("country_residence", "registration", Request.QueryString["id"]));
                state.SelectedValue =a.get_value("state", "registration", Request.QueryString["id"]);
                area_of_interest.SelectedValue = System.Web.HttpUtility.HtmlDecode(a.get_value("area_of_interest", "registration", Request.QueryString["id"]));

                previous_contribution.SelectedValue = a.get_value("previous_contribution", "registration", Request.QueryString["id"]);
                sector.SelectedValue = a.get_value("sector", "registration", Request.QueryString["id"]);
                a_update.SelectedValue = a.get_value("a_update", "registration", Request.QueryString["id"]);
                visit_india.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("visit_india", "registration", Request.QueryString["id"]));
                contribute.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("contribute", "registration", Request.QueryString["id"]));
                action.Value = "UPDATE";
                identity.Value = Request.QueryString["id"];
            }
        }
    }
  protected void submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
        if (action.Value == "ADD")
        {
            string sql = "Insert into registration (title, first_name, surname,age_group, address, landline, mobile, email, profession, organization, country_residence, state, area_of_interest, previous_contribution, sector, a_update, visit_india, contribute) VALUES ('" + title.SelectedValue + "','" + System.Security.SecurityElement.Escape(first_name.Text) + "','" + System.Security.SecurityElement.Escape(surname.Text) + "','" + System.Security.SecurityElement.Escape(age_group.Text) + "','" + System.Security.SecurityElement.Escape(address.Text) + "','" + System.Security.SecurityElement.Escape(landline.Text) + "','" + System.Security.SecurityElement.Escape(mobile.Text) + "','" + System.Security.SecurityElement.Escape(email.Text) + "','" + profession.SelectedValue + "','" + System.Security.SecurityElement.Escape(organization.Text) + "','" + System.Security.SecurityElement.Escape(country_residence.Text) + "','" + state.SelectedValue + "','" + area_of_interest.SelectedValue + "','" + previous_contribution.SelectedValue + "','" + sector.SelectedValue + "','" + a_update.SelectedValue + "','" + System.Security.SecurityElement.Escape(visit_india.Text) + "','" + System.Security.SecurityElement.Escape(contribute.Text) + "')";
            a.execute_sql(sql);
            Response.Redirect("registration.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = "Update registration SET title='" + title.SelectedValue + "',first_name='" + System.Security.SecurityElement.Escape(first_name.Text) + "',surname='" + System.Security.SecurityElement.Escape(surname.Text) + "' , age_group='" + System.Security.SecurityElement.Escape(age_group.Text) + "', address='" + System.Security.SecurityElement.Escape(address.Text) + "',landline='" + System.Security.SecurityElement.Escape(landline.Text) + "',mobile='" + System.Security.SecurityElement.Escape(mobile.Text) + "',email='" + System.Security.SecurityElement.Escape(email.Text) + "',profession='" + profession.SelectedValue + "',organization='" + System.Security.SecurityElement.Escape(organization.Text) + "',country_residence='" + System.Security.SecurityElement.Escape(country_residence.Text) + "',state='" + state.SelectedValue + "',area_of_interest='" + area_of_interest.SelectedValue + "',previous_contribution='" + previous_contribution.SelectedValue + "',sector='" + sector.SelectedValue + "',a_update='" + a_update.SelectedValue + "',visit_india='" + System.Security.SecurityElement.Escape(visit_india.Text) + "',contribute='" + System.Security.SecurityElement.Escape(contribute.Text) + "' where id='" + identity.Value + "'";
            a.execute_sql(sql);
            Response.Redirect("registration.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
}