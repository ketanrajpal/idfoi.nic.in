using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class photo_gallery : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "photo_gallery", Request.QueryString["id"]));
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
if(image.PostedFile.ContentType == "image/jpeg" || image.PostedFile.ContentType == "image/gif"){
            string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
            string filename = "_media_photo_gallery_" + a.slug(path);
            image.PostedFile.SaveAs(Server.MapPath("uploads/photo_gallery/") + filename);
            string sql = "Insert into photo_gallery (description, image, image_thumb, users, date, time, ip) VALUES ('" + System.Security.SecurityElement.Escape(description.Text) + "','" + filename + "','" + filename + "','" + Session["id"] + "',getdate(),getdate(),'" + Request.ServerVariables["REMOTE_ADDR"] + "')";
            a.execute_sql(sql);
            Response.Redirect("photo_gallery.aspx?ADD");
}else{
 validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
}
        }
        else if (action.Value == "UPDATE")
        {
            string sql = null;
            if (image.HasFile)
            {
if(image.PostedFile.ContentType == "image/jpeg" || image.PostedFile.ContentType == "image/gif"){
                string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
                string filename = "_media_photo_gallery_" + a.slug(path);
                image.PostedFile.SaveAs(Server.MapPath("uploads/photo_gallery/") + filename);
                sql = "Update photo_gallery SET description='" + System.Security.SecurityElement.Escape(description.Text) + "',image='" + filename + "',image_thumb='" + filename + "' , users='" + Session["id"] + "', date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "' where id='" + identity.Value + "'";
}else{
 validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
}
            }
            else
            {
                sql = "Update photo_gallery SET description='" + System.Security.SecurityElement.Escape(description.Text) + "', users='" + Session["id"] + "', date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "' where id='" + identity.Value + "'";
            }

                a.execute_sql(sql);
                Response.Redirect("photo_gallery.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
}