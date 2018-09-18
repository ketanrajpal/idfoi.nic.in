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

public partial class login : System.Web.UI.Page
{
  // functions a = new functions();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
    SqlCommand cmd;
   
   

    protected void Page_Load(object sender, EventArgs e)
        {
           
        
        }
    protected void loginpage_Click(object sender, EventArgs e)
    {
        try
        {
            string st = "select email, password, first_name, middle_name, surname, id from registration where email='" + txtEmail.Text + "' and password='" + txtpwd.Text + "'";
            cmd = new SqlCommand(st,con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string uid = dr.GetValue(0).ToString();
                string upd = dr.GetValue(1).ToString();
                if ((uid == txtEmail.Text) && (upd == txtpwd.Text))
                {
                    Session["foo"] = txtEmail.Text.Trim();
                    Session["id"] = dr.GetValue(5).ToString();
                    Session["register_name"] = dr.GetValue(2).ToString() +" "+ dr.GetValue(3).ToString() + " " + dr.GetValue(4).ToString();
                    Response.Redirect("default.aspx");
                }
                else
                    Response.Write("<script>alert('Email and Password donot Match. Please renter again.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Email and Password donot Match. Please renter again.')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
       
         
    }

   
   
  }
  



