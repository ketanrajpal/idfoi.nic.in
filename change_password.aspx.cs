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
using System.Net.Mail;
using System.Net.Mime;

public partial class change_password : System.Web.UI.Page
{
  // functions a = new functions();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
    SqlCommand cmd;
   
   

    protected void Page_Load(object sender, EventArgs e)
        {
           
    }
    protected void Change_Password_Click(object sender, EventArgs e)
    {
        con.Open();

        string str1 = "select * from registration where password ='" + Old_Password.Text + "' and email='"+Session["foo"]+"'";

        SqlCommand cmd = new SqlCommand(str1, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
        string str = "update registration set password='" +New_Password.Text+ "'where password= '"+Old_Password.Text+"'";
           SqlCommand cmd1 = new SqlCommand(str, con);
          cmd1.ExecuteNonQuery();
          Response.Write("<script>alert('Password Sucessfully Changed.');</script>");
          con.Close();
          Response.Redirect("default.aspx");
        }
        else
        {
            Response.Write("<script>alert('Sorry! The Old password do not match. You will automatically be logged out.');</script>");
            Response.Redirect("logout.aspx");
        }
       
    }

  }
  



