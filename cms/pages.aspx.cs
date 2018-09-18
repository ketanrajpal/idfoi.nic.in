using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
                heading.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("heading", "pages", Request.QueryString["id"]));
                sub_heading.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("sub_heading", "pages", Request.QueryString["id"]));
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "pages", Request.QueryString["id"]));
                link_label.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("link_label", "pages", Request.QueryString["id"]));
                link.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("link", "pages", Request.QueryString["id"]));
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
            string sql = "Insert into pages (heading, sub_heading, description, link_label, link, users, date, time, ip) VALUES ('" + System.Security.SecurityElement.Escape(a.get_string(heading.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(sub_heading.Text)) + "','" + a.get_string(System.Security.SecurityElement.Escape(description.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(link_label.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(link.Text)) + "','" + Session["id"] + "',getdate(),getdate(),'" + Request.ServerVariables["REMOTE_ADDR"] + "')";
            a.execute_sql(sql);
            Response.Redirect("pages.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = "Update pages SET heading='" + System.Security.SecurityElement.Escape(a.get_string(heading.Text)) + "', sub_heading='" + System.Security.SecurityElement.Escape(a.get_string(sub_heading.Text)) + "', description='" + a.get_string(System.Security.SecurityElement.Escape(description.Text)) + "',link_label='" + System.Security.SecurityElement.Escape(a.get_string(link_label.Text)) + "',link='" + System.Security.SecurityElement.Escape(a.get_string(link.Text)) + "',users='" + Session["id"] + "',date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "' where id='" + identity.Value + "'";
            a.execute_sql(sql);
            Response.Redirect("pages.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
}