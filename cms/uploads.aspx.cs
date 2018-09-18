using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uploads : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 protected void submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (action.Value == "ADD")
            {
                if (text.HasFile)
                {
if(text.PostedFile.ContentType == "image/jpeg" || text.PostedFile.ContentType == "image/gif" || text.PostedFile.ContentType == "application/msword" || text.PostedFile.ContentType == "application/pdf"){
                    string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "doc", "xls", "pdf", "docx", "ppt" };
                    string ext = System.IO.Path.GetExtension(text.PostedFile.FileName);
                    bool isValidFile = false;
                    for (int i = 0; i < validFileTypes.Length; i++)
                    {
                        if (ext == "." + validFileTypes[i])
                        {
                            isValidFile = true;
                        }
                    }
                    if (!isValidFile)
                    {

                    }
                    else
                    {
                        string path = System.IO.Path.GetFileName(text.PostedFile.FileName);
                        string filename = "_media_uploads_" + a.slug(path);
                        text.PostedFile.SaveAs(Server.MapPath("uploads") + filename);
                        string sql = "Insert into uploads (text) VALUES ('" + filename + "')";
                        a.execute_sql(sql);
                        Response.Redirect("uploads.aspx?ADD");
                    }
}else{
 validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
}
                }
            }
        }
    }
}