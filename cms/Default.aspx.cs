using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
		HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
		HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
		HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
		HttpContext.Current.Response.Cache.SetNoStore();
		Response.Cache.SetCacheability(HttpCacheability.NoCache); //Cache-Control : no-cache, Pragma : no-cache
		Response.Cache.SetExpires(DateTime.Now.AddDays(-1)); //Expires : date time
		Response.Cache.SetNoStore(); //Cache-Control :  no-store
		Response.Cache.SetProxyMaxAge(new TimeSpan(0, 0, 0)); //Cache-Control: s-maxage=0
		Response.Cache.SetValidUntilExpires(false);
		Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);

Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
 Response.Cache.SetCacheability(HttpCacheability.NoCache);
 Response.Cache.SetNoStore();


        if (!IsPostBack)
        {
            Session.Clear();
    Session.Abandon();
    Session.RemoveAll();
	if (Request.Cookies["ASP.NET_SessionId"] != null)
    {
        Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
    }

    if (Request.Cookies["AuthToken"] != null)
    {
        Response.Cookies["AuthToken"].Value = string.Empty;
        Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
    }
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
		
		functions a = new functions();
		string sql = "select count(*) from users where email = @username and password = @password";
		SqlConnection conn = new SqlConnection(a.connect());
		SqlCommand cmd = new SqlCommand(sql, conn);
		SqlParameter user = new SqlParameter();
		user.ParameterName = "@username";
		user.Value = username.Text;
		cmd.Parameters.Add(user);
		SqlParameter pass = new SqlParameter();
        pass.ParameterName = "@password";
        pass.Value = password.Text;
        cmd.Parameters.Add(pass);
		conn.Open();
		int count = (int)cmd.ExecuteScalar();
		
		if (count > 0){
			SqlCommand cmd1 = new SqlCommand("SELECT * from users where email='" + username.Text + "' and password='" + password.Text + "'", conn);
			SqlDataReader dr = cmd1.ExecuteReader();
			while (dr.Read())
        	{
				string guid = Guid.NewGuid().ToString();
				Session["AuthToken"] = guid;
				Response.Cookies.Add(new HttpCookie("AuthToken", guid));
            	Session["name"] = dr["first_name"] + " " + dr["surname"];
            	Session["id"] = dr["id"];
            	Session["username"] = dr["email"];
				Response.Redirect("dashboard.aspx");
        	}
		}
		else{
			new_validation.InnerHtml = "Entered Id or Password is Incorrect.";
		}
        conn.Close();

        
    }
}