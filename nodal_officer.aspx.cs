using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

public partial class nodal_officer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        functions a = new functions();
        if (!IsPostBack)
        {
            title.DataSource = a.dropdown_bind("Title");
            title.DataBind();
            title.DataTextField = "name";
            title.DataValueField = "id";
            title.DataBind();
            title.Items.Insert(0, new ListItem("Select a Title", "-1"));

            state.DataSource = a.dropdown_bind("state");
            state.DataBind();
            state.DataTextField = "name";
            state.DataValueField = "id";
            state.DataBind();
            state.Items.Insert(0, new ListItem("Select a State", "-1"));
        
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        functions a = new functions();
        MD5 md5Hash = MD5.Create();
        string hash_password = a.md5hash(md5Hash, password.Text);
        string sql = "Insert into users (title, first_name, surname, organisation, position, landline, mobile, state, type, approve, password, email) VALUES ('" + title.SelectedValue + "','" + first_name.Text + "','" + surname.Text + "','" + organisation.Text + "','" + position.Text + "','" + landline.Text + "','" + mobile.Text + "','" + state.SelectedValue + "','" + type.Value + "','" + approve.Value + "','" + hash_password + "','" + email.Text + "')";
        a.execute_sql(sql);
        Response.Redirect("data_entry_officer.aspx");
    }
}
