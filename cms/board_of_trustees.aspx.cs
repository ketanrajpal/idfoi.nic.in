using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class board_of_trustees : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            category.DataSource = a.dropdown_bind("category");
            category.DataBind();
            category.DataTextField = "name";
            category.DataValueField = "id";
            category.DataBind();
            category.Items.Insert(0, new ListItem("Select a Category", "-1"));

            if (Request.QueryString["slug"] == "update")
            {
                name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("name", "board_of_trustees", Request.QueryString["id"]));
                designation.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("designation", "board_of_trustees", Request.QueryString["id"]));
                category.SelectedValue = a.get_value("category", "board_of_trustees", Request.QueryString["id"]);
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "board_of_trustees", Request.QueryString["id"]));
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
            string filename = "_media_board_of_trustees_" + a.slug(path);
            image.PostedFile.SaveAs(Server.MapPath("uploads/board_of_trustees/") + filename);

            string sql = "Insert into board_of_trustees (name, designation, category, description, users, date, time, ip, image) VALUES ('" + System.Security.SecurityElement.Escape(a.get_string(name.Text)) + "','" + System.Security.SecurityElement.Escape
(a.get_string(designation.Text)) + "','" + category.SelectedValue + "','" + System.Security.SecurityElement.Escape(a.get_string(description.Text)) + "','" + Session["id"] + "',getdate(),getdate(),'" + Request.ServerVariables["REMOTE_ADDR"] + "','" + filename + "')";
            Response.Write(sql);
            a.execute_sql(sql);
            Response.Redirect("board_of_trustees.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = null;
            if (image.HasFile)
            {

                string path = System.IO.Path.GetFileName(image.PostedFile.FileName);
                string filename = "_media_board_of_trustees_" + a.slug(path);
                image.PostedFile.SaveAs(Server.MapPath("uploads/board_of_trustees/") + filename);
                sql = "Update board_of_trustees SET image='" + filename + "', name='" + System.Security.SecurityElement.Escape(a.get_string(name.Text)) + "',designation='" + System.Security.SecurityElement.Escape(a.get_string(designation.Text)) + "',category='" + category.SelectedValue + "' , description='" + System.Security.SecurityElement.Escape(a.get_string(description.Text)) + "', users='" + Session["id"] + "',date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "' where id='" + identity.Value + "'";
          }
            else
            {
                sql = "Update board_of_trustees SET name='" + System.Security.SecurityElement.Escape(a.get_string(name.Text)) + "',designation='" + System.Security.SecurityElement.Escape(a.get_string(designation.Text)) + "',category='" + category.SelectedValue + "' , description='" + System.Security.SecurityElement.Escape(a.get_string(description.Text)) + "', users='" + Session["id"] + "',date=getdate(),time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "' where id='" + identity.Value + "'";
            }

            
            a.execute_sql(sql);
            Response.Redirect("board_of_trustees.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }

}