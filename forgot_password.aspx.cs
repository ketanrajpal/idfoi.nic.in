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

public partial class forgot_password : System.Web.UI.Page
{
  // functions a = new functions();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
    SqlCommand cmd;
   
   

    protected void Page_Load(object sender, EventArgs e)
        {
           
    }
    protected void forgot_pwd_Click(object sender, EventArgs e)
    {
        //string strConnection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        string str = "SELECT email,Password FROM registration WHERE email = @email";

         cmd = new SqlCommand(str,con);

        //cmd.Connection = connection;

        cmd.CommandType = CommandType.Text;

        cmd.CommandText = str;

 

        SqlParameter email = new SqlParameter("@Email", SqlDbType.VarChar, 50);

        email.Value = txtEmail.Text.Trim().ToString();

        cmd.Parameters.Add(email);

 

        //Create Dataset to store results and DataAdapter to fill Dataset 

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        con.Open();

        da.Fill(ds);

        con.Close();

        if(ds.Tables[0].Rows.Count > 0 )

        {

            MailMessage loginInfo = new MailMessage();

            loginInfo.To.Add(txtEmail.Text.ToString());

            loginInfo.From = new MailAddress("irshadmpct12@gmail.com");

            loginInfo.Subject = "Forgot Password Information";

 

            loginInfo.Body = "email " + ds.Tables[0].Rows[0]["email"] + "<br><br>Password: " + ds.Tables[0].Rows[0]["Password"] + "<br><br>";

            loginInfo.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com"; 

            smtp.Port = 25;

            smtp.EnableSsl = true;

            smtp.Credentials = new System.Net.NetworkCredential("irshadmpct12@gmail.com", "password");

            smtp.Send(loginInfo);

            lbl.Text = "Password is sent to you email id,you can now login";
                //<a href="Login.aspx">Login</a>";

        }

        else

        {

            lbl.Text = "Email Address Not Registered";

        }

    }
   

  }
  



