using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class champions : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
                title.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("title", "champions", Request.QueryString["id"]));
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "champions", Request.QueryString["id"]));
                ordern.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("ordern", "champions", Request.QueryString["id"]));
                action.Value = "UPDATE";
                identity.Value = Request.QueryString["id"];
            }
        }
    }
 protected void ServerValidate(object source, ServerValidateEventArgs args)
{
    string value = args.Value;

    if (value.Contains("-"))
    {
        args.IsValid = false;
    }
}
    protected void submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
        if (action.Value == "ADD")
        {
            string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
            string filename = "_media_champions_" + a.slug(path);
            image.PostedFile.SaveAs(Server.MapPath("uploads/champions/") + filename);
            string sql = "Insert into champions (title, description, image, users, date, time, ip, ordern) VALUES ('" + System.Security.SecurityElement.Escape(title.Text) + "','" + System.Security.SecurityElement.Escape(description.Text) + "','" + filename + "','" + Session["id"] + "',getdate(),getdate(),'" + Request.ServerVariables["REMOTE_ADDR"] + "','" + System.Security.SecurityElement.Escape(ordern.Text) + "')";
            Response.Write(sql);
            a.execute_sql(sql);
            Response.Redirect("champions.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = null;
            if (image.HasFile){
                string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
                string filename = "_media_champions_" + a.slug(path);
                image.PostedFile.SaveAs(Server.MapPath("uploads/champions/") + filename);
                sql = "Update champions SET title='" + System.Security.SecurityElement.Escape(title.Text) + "', description='" + System.Security.SecurityElement.Escape(description.Text) + "', image='" + filename + "', users='" + Session["id"] + "', date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "', ordern='" + System.Security.SecurityElement.Escape(ordern.Text) + "' where id='" + identity.Value + "'";
            }
            else{
                sql = "Update champions SET title='" + System.Security.SecurityElement.Escape(title.Text) + "', description='" + System.Security.SecurityElement.Escape(description.Text) + "', users='" + Session["id"] + "', date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "', ordern='" + System.Security.SecurityElement.Escape(ordern.Text) + "' where id='" + identity.Value + "'";
            }
            a.execute_sql(sql);
            //Response.Write(sql);
            Response.Redirect("champions.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
}