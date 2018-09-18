using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class system_settings : System.Web.UI.Page
{
    functions a = new functions();
    String mod;
    protected void Page_Load(object sender, EventArgs e)
    {
        mod = Request.QueryString["mod"];
        if (Request.QueryString["mod"] == null)
        {
            Response.Redirect("dashboard.aspx");
        }
        if (!IsPostBack){
            if (Request.QueryString["slug"]== "update"){
                name.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("name", mod, Request.QueryString["id"]));
                ordern.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("ordern", mod, Request.QueryString["id"]));
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
                string sql = "Insert into " + mod + " (name, ordern) VALUES ('" + System.Security.SecurityElement.Escape(a.get_string(name.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(ordern.Text)) + "')";
                a.execute_sql(sql);
                Response.Redirect("system_settings.aspx?mod=" + mod + "&ADD");
            }
            else if (action.Value == "UPDATE")
            {
                string sql = "Update " + mod + " SET name='" + System.Security.SecurityElement.Escape(a.get_string(name.Text)) + "', ordern='" + System.Security.SecurityElement.Escape(a.get_string(ordern.Text)) + "' where id='" + identity.Value + "'";
                a.execute_sql(sql);
                Response.Redirect("system_settings.aspx?mod=" + mod + "&UPDATE");
            }
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
    }
}