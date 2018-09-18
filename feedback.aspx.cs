using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {


        functions a = new functions();
        string sql = "Insert into feedback (name,organization,addresss_line_1,addresss_line_2,telephone,email,designation,message,date,time,ip) VALUES ('" + System.Security.SecurityElement.Escape(name.Text) + "','" + System.Security.SecurityElement.Escape(organization.Text) + "','" + System.Security.SecurityElement.Escape(addresss_line_1.Text) + "','" + System.Security.SecurityElement.Escape(addresss_line_2.Text) + "','" + System.Security.SecurityElement.Escape(telephone.Text) + "','" + System.Security.SecurityElement.Escape(email.Text) + "','" + System.Security.SecurityElement.Escape(designation.Text) + "','" + System.Security.SecurityElement.Escape(message.Text) + "','" + DateTime.Now.ToString("HH:mm:ss") + "','" + DateTime.Now.ToString("MM-dd-yyyy") + "','" + Request.UserHostAddress + "')";
        a.execute_sql(sql);
        Response.Redirect("feedback_thank_you.aspx");

 
    }
}