using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            media_category.DataSource = a.dropdown_bind("media_category");
            media_category.DataBind();
            media_category.DataTextField = "name";
            media_category.DataValueField = "id";
            media_category.DataBind();
            media_category.Items.Insert(0, new ListItem("Select a Media Category", "-1"));
            if (Request.QueryString["slug"] == "update")
            {
                media_category.SelectedValue = a.get_value("media_category", "media", Request.QueryString["id"]);
                title.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("title", "media", Request.QueryString["id"]));
                sub_heading.Text =System.Web.HttpUtility.HtmlDecode( a.get_value("sub_heading", "media", Request.QueryString["id"]));
                link.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("link", "media", Request.QueryString["id"]));
                string mydate = System.Web.HttpUtility.HtmlDecode(a.get_value("event_date", "media", Request.QueryString["id"]));
                DateTime dt = Convert.ToDateTime(mydate);
                event_date.Text = dt.Month+"/"+dt.Day+"/"+dt.Year;
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
            string sql = "Insert into media (media_category, title, sub_heading, link, event_date, users, date, time, ip) VALUES ('" + media_category.SelectedValue + "','" + System.Security.SecurityElement.Escape(a.get_string(title.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(sub_heading.Text)) + "','" + System.Security.SecurityElement.Escape(link.Text) + "','" + System.Security.SecurityElement.Escape(event_date.Text) + "','" + Session["id"] + "',getdate(),getdate(),'" + Request.ServerVariables["REMOTE_ADDR"] + "')";
            a.execute_sql(sql);
            Response.Redirect("media.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = "Update media SET media_category='" + a.get_string(media_category.SelectedValue) + "',title='" + System.Security.SecurityElement.Escape(a.get_string(title.Text)) + "',sub_heading='" + System.Security.SecurityElement.Escape(a.get_string(sub_heading.Text)) + "' , link='" + System.Security.SecurityElement.Escape(link.Text) + "', event_date='" + System.Security.SecurityElement.Escape(event_date.Text) + "',users='" + Session["id"] + "',date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "' where id='" + identity.Value + "'";
            a.execute_sql(sql);
            Response.Redirect("media.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
}
