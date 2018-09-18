using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
                description.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("description", "news", Request.QueryString["id"]));
                
                action.Value = "UPDATE";
                identity.Value = Request.QueryString["id"];
            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {


        if (action.Value == "ADD")
        {
            string sql = "Insert into news (description) VALUES ('" + a.get_string(description.Text) + "')";
            a.execute_sql(sql);
            Response.Redirect("news.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = "Update news SET description='" + a.get_string(description.Text) + "' where id='" + identity.Value + "'";
            a.execute_sql(sql);
            Response.Redirect("news.aspx?UPDATE");
        }
    }
}
