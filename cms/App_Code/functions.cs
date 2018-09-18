using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public class functions
{
        string cstr = ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString;
        public void execute_sql(string sql)
        {
            SqlConnection con = new SqlConnection(cstr);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public string connect()
        {
            return cstr;
        }

        public string get_value(string field, string table, string id)
        {
            string value = null;
            SqlConnection con = new SqlConnection(cstr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select "+field+" from "+table+" where id='"+id+"'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                value=dr[field].ToString();
            }
            con.Close();
            return value;
        }

        public void delete(string table, string id)
        {
            SqlConnection con = new SqlConnection(cstr);
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM "+table +" where id='"+id+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
		public string slug(string str)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in str) {
                if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '.' || c == '_') {
                    sb.Append(c);
               }
            }
            return sb.ToString();
        }

        public DataTable dropdown_bind(string table)
        {
            SqlConnection con = new SqlConnection(cstr);
            string com = "Select * from "+table;
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            return dt;
        }

        public string md5hash(MD5 md5Hash, string input)
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        public string get_string(string str)
        {
            str = str.Trim();
            string new_str=str.Replace("'", "&rsquo;");
            return new_str.Replace("\"", "&quot;");
        }

    }
