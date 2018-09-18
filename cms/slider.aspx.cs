using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class slider : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
               
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "slider", Request.QueryString["id"]));
               
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
if(image.PostedFile.ContentType == "image/jpeg" || image.PostedFile.ContentType == "image/gif" || image.PostedFile.ContentType == "application/msword" || image.PostedFile.ContentType == "application/pdf"){
            string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
            string filename = "_media_slider_" + a.slug(path);
            image.PostedFile.SaveAs(Server.MapPath("uploads/slider/") + filename);
            string sql = "Insert into slider (description, image) VALUES ('" + System.Security.SecurityElement.Escape(description.Text) + "','" + filename + "')";
            Response.Write(sql);
            a.execute_sql(sql);
            Response.Redirect("slider.aspx?ADD");
}else{
 validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
}
        }
        else if (action.Value == "UPDATE")
        {
            string sql = null;
            if (image.HasFile){
if(image.PostedFile.ContentType == "image/jpeg" || image.PostedFile.ContentType == "image/gif" || image.PostedFile.ContentType == "application/msword" || image.PostedFile.ContentType == "application/pdf"){
                string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
                string filename = "_media_slider_" + a.slug(path);
                image.PostedFile.SaveAs(Server.MapPath("uploads/slider/") + filename);
                sql = "Update slider SET description='" + System.Security.SecurityElement.Escape(description.Text) + "', image='" + filename + "' where id='" + identity.Value + "'";
}else{
 validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
}
            }
            else{
                sql = "Update slider SET  description='" + System.Security.SecurityElement.Escape(description.Text) + "' where id='" + identity.Value + "'";
            }
            a.execute_sql(sql);
            //Response.Write(sql);
            Response.Redirect("slider.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
}