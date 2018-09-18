using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class project_category : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
                name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("name", "project_category", Request.QueryString["id"]));
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "project_category", Request.QueryString["id"]));
                link.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("link", "project_category", Request.QueryString["id"]));
                link_label.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("link_label", "project_category", Request.QueryString["id"]));
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
            string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
            string filename = "_media_project_category_" + a.slug(path);
            image.PostedFile.SaveAs(Server.MapPath("uploads/project_category/") + filename);
            string sql = "Insert into project_category (name, description, link, link_label, image, users, date, time, ip) VALUES ('" + System.Security.SecurityElement.Escape(a.get_string(name.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(description.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(link.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(link_label.Text)) + "','" + filename + "','" + Session["id"] + "',getdate(),getdate(),'" + Request.ServerVariables["REMOTE_ADDR"] + "')";
            a.execute_sql(sql);
            Response.Redirect("project_category.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = "Update project_category SET name='" + System.Security.SecurityElement.Escape(a.get_string(name.Text)) + "', description='" + System.Security.SecurityElement.Escape(a.get_string(description.Text)) + "', link='" + System.Security.SecurityElement.Escape(a.get_string(link.Text)) + "',link_label='" + System.Security.SecurityElement.Escape(a.get_string(link_label.Text)) + "' where id='" + identity.Value + "'";
            a.execute_sql(sql);
            Response.Redirect("project_category.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }

        }

    }

}