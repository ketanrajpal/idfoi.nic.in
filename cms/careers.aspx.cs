using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class careers : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
                heading.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("heading", "careers", Request.QueryString["id"]));
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "careers", Request.QueryString["id"]));
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
if(uploads.PostedFile.ContentType == "image/jpeg" || uploads.PostedFile.ContentType == "image/gif" || uploads.PostedFile.ContentType == "application/msword" || uploads.PostedFile.ContentType == "application/pdf"){
            string path = System.IO.Path.GetFileName(uploads.PostedFile.FileName);
            string filename = "_media_careers_" + a.slug(path);
            uploads.PostedFile.SaveAs(Server.MapPath("uploads/careers/") + filename);
            string sql = "Insert into careers (heading,description,uploads) VALUES ('" + System.Security.SecurityElement.Escape(a.get_string(heading.Text)) + "','" + System.Security.SecurityElement.Escape(description.Text) + "','" + filename + "')";
            a.execute_sql(sql);
            Response.Redirect("careers.aspx");
}else{
 validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
}
            
        }
        else if (action.Value == "UPDATE")
        {
            string sql = null;
            if (uploads.HasFile)
            {
if(uploads.PostedFile.ContentType == "image/jpeg" || uploads.PostedFile.ContentType == "image/gif" || uploads.PostedFile.ContentType == "application/msword" || uploads.PostedFile.ContentType == "application/pdf"){
                string path = System.IO.Path.GetFileName(uploads.PostedFile.FileName);
                string filename = "_media_careers_" + a.slug(path);
                uploads.PostedFile.SaveAs(Server.MapPath("uploads/careers/") + filename);
                sql = "Update careers SET heading='" + System.Security.SecurityElement.Escape(a.get_string(heading.Text)) + "', description='" + System.Security.SecurityElement.Escape(description.Text) + "',uploads='" + filename + "' where id='" + identity.Value + "'";
}else{
 validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
}
            }
            else
            {
                sql = "Update careers SET heading='" + System.Security.SecurityElement.Escape(a.get_string(heading.Text)) + "', description='" + System.Security.SecurityElement.Escape(description.Text) + "' where id='" + identity.Value + "'";
            }

            a.execute_sql(sql);
            Response.Redirect("careers.aspx");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
   
}
   