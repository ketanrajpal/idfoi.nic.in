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

public partial class myprofile : System.Web.UI.Page
{
  // functions a = new functions();
   // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
   // SqlCommand cmd;
   
   

    protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["foo"]==null)
                Response.Redirect("login.aspx");
            string valueFromSession = Session["foo"].ToString();
         
        }
    
   
  }
  



