using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.Configuration;

public partial class choose_contribution : System.Web.UI.Page
{
    functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                state.DataSource = a.dropdown_bind("project_state", "name", "name", "id");
                state.DataBind();
                state.DataTextField = "name";
                state.DataValueField = "id";
                state.DataBind();
                state.Items.Insert(0, new ListItem("Select a  state", "-1"));


                if (!string.IsNullOrEmpty(Request.QueryString["state"]) && state.Items.FindByValue(Request.QueryString["state"]) != null)
                {
                    state.SelectedValue = Request.QueryString["state"];
                    StringBuilder sb = new StringBuilder();
                    sb.Append("SELECT distinct dbo.sector.id AS SectorID, dbo.sector.name AS SectorName ");
                    sb.Append(" FROM            dbo.project INNER JOIN ");
                    sb.Append(" dbo.sector ON dbo.project.sector = dbo.sector.id INNER JOIN ");
                    sb.Append(" dbo.project_state ON dbo.project.project_state = dbo.project_state.id ");
                    sb.Append(" WHERE        (dbo.project_state.id = " + state.SelectedValue + ") ");
                    sector.DataSource = dropdown_bind(sb.ToString());
                    sector.DataBind();
                    sector.DataTextField = "SectorName";
                    sector.DataValueField = "SectorID";
                    sector.DataBind();
                    sector.Items.Insert(0, new ListItem("Select a  sector", "-1"));

                    if (!string.IsNullOrEmpty(Request.QueryString["sector"]) && sector.Items.FindByValue(Request.QueryString["sector"]) != null)
                    {
                        sector.SelectedValue = Request.QueryString["sector"];
                    }
                }
                else
                {
                    sector.DataSource = a.dropdown_bind("sector", "name", "name", "id");
                    sector.DataBind();
                    sector.DataTextField = "name";
                    sector.DataValueField = "id";
                    sector.DataBind();
                    sector.Items.Insert(0, new ListItem("Select a  sector", "-1"));

                    if (!string.IsNullOrEmpty(Request.QueryString["sector"]) && sector.Items.FindByValue(Request.QueryString["sector"]) != null)
                    {
                        sector.SelectedValue = Request.QueryString["sector"];
                    }
                }
                

                string strStateIDRequest = Request.QueryString["state"];
                string strSectorIDRequest = Request.QueryString["sector"];
                if (!string.IsNullOrEmpty(strStateIDRequest) && state.Items.FindByValue(strStateIDRequest) != null && !string.IsNullOrEmpty(strSectorIDRequest) && sector.Items.FindByValue(strSectorIDRequest) != null)
                {
                    DropDownSelectionChange("statesector");
                }
                else if (!string.IsNullOrEmpty(strStateIDRequest) && state.Items.FindByValue(strStateIDRequest) != null)
                {
                    state.SelectedValue = state.Items.FindByValue(strStateIDRequest).Value;
                    DropDownSelectionChange("state");
                }
                else if (!string.IsNullOrEmpty(strSectorIDRequest) && sector.Items.FindByValue(strSectorIDRequest) != null)
                {
                    sector.SelectedValue = state.Items.FindByValue(strSectorIDRequest).Value;
                    DropDownSelectionChange("sector");
                }
            }
            catch (Exception ex)
            {
                show_projects.InnerHtml = ex.Message;
            }
        }
    }
    protected void state_dropdown(object sender, EventArgs e)
    {
        try
        {
            string url = Request.Url.AbsoluteUri;
            if (Request.Url.AbsoluteUri.Contains("?"))
            {
                url = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.IndexOf('?'));
            }
            if (state.SelectedValue != "-1" && sector.SelectedValue != "-1")
            {
                url += "?state=" + state.SelectedValue + "&sector=" + sector.SelectedValue;
            }
            else if (state.SelectedValue != "-1")
            {
                url += "?state=" + state.SelectedValue;
            }
            else if (sector.SelectedValue != "-1")
            {
                url += "?sector=" + sector.SelectedValue;
            }
            Response.Redirect(url);
            //DropDownSelectionChange("state");
        }
        catch (Exception ex)
        {
            show_projects.InnerHtml = ex.Message;
        }
    }
    protected void sector_dropdown(object sender, EventArgs e)
    {
        try
        {
            //DropDownSelectionChange("sector");
            string url = Request.Url.AbsoluteUri;
            if (Request.Url.AbsoluteUri.Contains("?"))
            {
                url = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.IndexOf('?'));
            }
            if (state.SelectedValue != "-1" && sector.SelectedValue != "-1")
            {
                url += "?state=" + state.SelectedValue + "&sector=" + sector.SelectedValue;
            }
            else if (sector.SelectedValue != "-1")
            {
                url += "?sector=" + sector.SelectedValue;
            }
            else if (state.SelectedValue != "-1")
            {
                url += "?state=" + state.SelectedValue;
            }
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
            show_projects.InnerHtml = ex.Message;
        }
    }
    private void DropDownSelectionChange(string sender)
    {
        if (sender.ToLower() == "statesector")
        {
            String sql = "";
            int i = 0;
            project_heading.InnerHtml = "Filter by State and Sector: " + state.SelectedItem + " and " + sector.SelectedItem;
            sql = "Select * from project where sector = '" + sector.SelectedValue + "' and project_state='" + state.SelectedValue + "'";
            show_projects.InnerHtml = "";
            SqlConnection con = new SqlConnection(a.connect());
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                show_projects.InnerHtml += " <li>" + Convert.ToString(dr["title"]) + " <a href='projects.aspx?project=" + Convert.ToString(dr["id"]) + "' target='new'><span class='fa fa-globe'></a></li>";
                i++;
            }
            con.Close();
            if (i == 0)
            {
                show_projects.InnerHtml = "Sorry, No Projects available. Please change your selection.<br><br>";
            }
        }
        else if (sender.ToLower() == "sector")
        {
            String sql = "";
            int i = 0;
            project_heading.InnerHtml = "Filter by Sector: " + sector.SelectedItem;
            sql = "Select * from project where sector = '" + sector.SelectedValue + "'";
            show_projects.InnerHtml = "";
            SqlConnection con = new SqlConnection(a.connect());
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                show_projects.InnerHtml += " <li>" + Convert.ToString(dr["title"]) + " <a href='projects.aspx?project=" + Convert.ToString(dr["id"]) + "' target='new'><span class='fa fa-globe'></a></li>";
                i++;
            }
            con.Close();
            if (i == 0)
            {
                show_projects.InnerHtml = "Sorry, No Projects available. Please change your selection.<br><br>";
            }
        }
        else if (sender.ToLower() == "state")
        {
            String sql = "";
            int i = 0;
            project_heading.InnerHtml = "Filter by State: " + state.SelectedItem;
            sql = "Select * from project where project_state='" + state.SelectedValue + "'";
            show_projects.InnerHtml = "";
            SqlConnection con = new SqlConnection(a.connect());
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                show_projects.InnerHtml += " <li>" + dr["title"].ToString() + " <a href='projects.aspx?project=" + dr["id"].ToString() + "' target='new'><span class='fa fa-globe'></a></li>";
                i++;
            }
            con.Close();
            if (i == 0)
            {
                show_projects.InnerHtml = "Sorry, No Projects available. Please change your selection.<br><br>";
            }
        }
    }
    private DataTable dropdown_bind(string QueryString)
    {
        string cstr = ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString;
        SqlConnection con = new SqlConnection(cstr);
        StringBuilder com = new StringBuilder();
        SqlDataAdapter adpt = new SqlDataAdapter(QueryString, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        return dt;
    }
}