using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faqs : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["slug"] == "update")
            {
                question.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("question", "faqs", Request.QueryString["id"]));
                answer.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("answer", "faqs", Request.QueryString["id"]));
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
            string sql = "Insert into faqs (question, answer, users, date, time, ip) VALUES ('" + System.Security.SecurityElement.Escape(a.get_string(question.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(answer.Text)) + "','" + Session["id"] + "',getdate(),getdate(),'" + Request.ServerVariables["REMOTE_ADDR"] + "')";
            a.execute_sql(sql);
            Response.Redirect("faqs.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = "Update faqs SET question='" + System.Security.SecurityElement.Escape(a.get_string(question.Text)) + "',answer='" + System.Security.SecurityElement.Escape(a.get_string(answer.Text)) + "',users='" + Session["id"] + "' , date=getdate(), time=getdate(),ip='" + Request.ServerVariables["REMOTE_ADDR"] + "' where id='" + identity.Value + "'";
            a.execute_sql(sql);
            Response.Redirect("faqs.aspx?UPDATE");
        }
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
        }
    }
}
