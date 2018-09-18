using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class state_government : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        functions a = new functions();
        if (!IsPostBack)
        {
            category.DataSource = a.dropdown_bind("state_government");
            category.DataBind();
            category.DataTextField = "name";
            category.DataValueField = "id";
            category.DataBind();
            category.Items.Insert(0, new ListItem("Select a  Title", "-1"));
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {

        functions a = new functions();
        string sql = "Insert into for_project_submission (state_government,address) VALUES ('" + category.SelectedValue + "','" + System.Security.SecurityElement.Escape(address.Text) + "')";
        a.execute_sql(sql);
        Response.Redirect("nodal_officer.aspx");

    }
}