using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
public partial class users : System.Web.UI.Page
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

            type.DataSource = a.dropdown_bind("type");
            type.DataBind();
            type.DataTextField = "name";
            type.DataValueField = "id";
            type.DataBind();

            state.DataSource = a.dropdown_bind("state");
            state.DataBind();
            state.DataTextField = "name";
            state.DataValueField = "id";
            state.DataBind();


            title.Items.Insert(0, new ListItem("Select a Title", "-1"));
            type.Items.Insert(0, new ListItem("Select a Type", "-1"));
            state.Items.Insert(0, new ListItem("Select a State", "-1"));

            if (Request.QueryString["slug"] == "update")
            {

                title.SelectedValue = a.get_value("title", "users", Request.QueryString["id"]);
                state.SelectedValue = a.get_value("state", "users", Request.QueryString["id"]);
                type.SelectedValue = a.get_value("type", "users", Request.QueryString["id"]);
                email.Text =System.Web.HttpUtility.HtmlDecode( a.get_value("email", "users", Request.QueryString["id"]));
                first_name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("first_name", "users", Request.QueryString["id"]));
                surname.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("surname", "users", Request.QueryString["id"]));
                organisation.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("organisation", "users", Request.QueryString["id"]));
                position.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("position", "users", Request.QueryString["id"]));
                landline.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("landline", "users", Request.QueryString["id"]));
                mobile.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("mobile", "users", Request.QueryString["id"]));
                approve.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("approve", "users", Request.QueryString["id"]));
                action.Value = "UPDATE";
                identity.Value = Request.QueryString["id"];
            }
        }
    }
  protected void submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
        string sql = null;
        if (action.Value == "ADD")
        {
			if(password.Text ==confirm_password.Text){
            sql = "Insert into users (title, first_name, surname, organisation, position, landline, mobile, state, type, approve, password, email) VALUES ('" + title.SelectedValue + "','" + System.Security.SecurityElement.Escape(first_name.Text) + "','" + System.Security.SecurityElement.Escape(surname.Text) + "','" + System.Security.SecurityElement.Escape(organisation.Text) + "','" + System.Security.SecurityElement.Escape(position.Text) + "','" + System.Security.SecurityElement.Escape(landline.Text) + "','" + System.Security.SecurityElement.Escape(mobile.Text) + "','" + state.SelectedValue + "','" + type.SelectedValue + "','" + approve.Text + "','" + password.Text + "','" + System.Security.SecurityElement.Escape(email.Text)+ "')";
			}
            //Response.Write(sql);
            a.execute_sql(sql);
            Response.Redirect("users.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            if (password.Text == "" && confirm_password.Text == "")
            {
                sql = "Update users SET email='" + System.Security.SecurityElement.Escape(email.Text) + "', first_name='" + System.Security.SecurityElement.Escape(first_name.Text) + "', surname='" + System.Security.SecurityElement.Escape(surname.Text) + "', organisation='" + System.Security.SecurityElement.Escape(organisation.Text) + "',position='" + System.Security.SecurityElement.Escape(position.Text) + "',landline='" + System.Security.SecurityElement.Escape(landline.Text) + "',mobile='" + System.Security.SecurityElement.Escape(mobile.Text) + "',state='" + System.Security.SecurityElement.Escape(state.Text) + "',type='" + System.Security.SecurityElement.Escape(type.Text) + "',approve='" + System.Security.SecurityElement.Escape(approve.Text) + "' where id='" + identity.Value + "'";
            }
            else
            {
				if(password.Text ==confirm_password.Text){
                sql = "Update users SET email='" + System.Security.SecurityElement.Escape(email.Text) + "', first_name='" + System.Security.SecurityElement.Escape(first_name.Text) + "', surname='" + System.Security.SecurityElement.Escape(surname.Text) + "', organisation='" + System.Security.SecurityElement.Escape(organisation.Text) + "',position='" + System.Security.SecurityElement.Escape(position.Text) + "',landline='" + System.Security.SecurityElement.Escape(landline.Text) + "',mobile='" + System.Security.SecurityElement.Escape(mobile.Text) + "',state='" + System.Security.SecurityElement.Escape(state.Text) + "',type='" + System.Security.SecurityElement.Escape(type.Text) + "',approve='" + System.Security.SecurityElement.Escape(approve.Text) + "',password='" + password.Text + "' where id='" + identity.Value + "'";
				}
            }
            a.execute_sql(sql);
            Response.Redirect("users.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
    }
