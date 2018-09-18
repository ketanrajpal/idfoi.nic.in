using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class project : System.Web.UI.Page
{ functions a = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            sector.DataSource = a.dropdown_bind("sector");
            sector.DataBind();
            sector.DataTextField = "name";
            sector.DataValueField = "id";
            sector.DataBind();
            sector.Items.Insert(0, new ListItem("Select a sector", "-1"));

            project_state.DataSource = a.dropdown_bind("project_state");
            project_state.DataBind();
            project_state.DataTextField = "name";
            project_state.DataValueField = "id";
            project_state.DataBind();
            project_state.Items.Insert(0, new ListItem("Select a sector", "-1"));

            

            project_category.DataSource = a.dropdown_bind("project_category");
            project_category.DataBind();
            project_category.DataTextField = "name";
            project_category.DataValueField = "id";
            project_category.DataBind();
            project_category.Items.Insert(0, new ListItem("Select a Project Category", "-1"));


            if (Request.QueryString["slug"] == "update")
            {
                title.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("title", "project", Request.QueryString["id"]));
                sector.SelectedValue = a.get_value("sector", "project", Request.QueryString["id"]);
                location.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("location", "project", Request.QueryString["id"]));
                aim.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("aim", "project", Request.QueryString["id"]));
                justification.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("justification", "project", Request.QueryString["id"]));
                beneficiary.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("beneficiary", "project", Request.QueryString["id"]));
                new_project.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("new_project", "project", Request.QueryString["id"]));
                nodal_officer.Text = a.get_value("nodal_officer", "project", Request.QueryString["id"]);
                implementation_strategy.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("implementation_strategy", "project", Request.QueryString["id"]));
                expected_benefits.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("expected_benefits", "project", Request.QueryString["id"]));
                
                timeline_to.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("timeline_to", "project", Request.QueryString["id"]));
                budget.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("budget", "project", Request.QueryString["id"]));
                
                per_unit_cost.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("per_unit_cost", "project", Request.QueryString["id"]));
                
                
                cost.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("cost", "project", Request.QueryString["id"]));
                approve.Text = System.Web.HttpUtility.HtmlDecode(a.get_value("approve", "project", Request.QueryString["id"]));
                project_category.SelectedValue = a.get_value("project_category", "project", Request.QueryString["id"]);
                project_state.SelectedValue = a.get_value("project_state", "project", Request.QueryString["id"]);
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
            
            string path_link = System.IO.Path.GetFileName(link.PostedFile.FileName);
            string filename_link = "_project_" + a.slug(path_link);
            link.PostedFile.SaveAs(Server.MapPath("uploads/projects/") + filename_link);

            string sql = "Insert into project(title, sector, location, aim,justification, beneficiary, new_project, nodal_officer, implementation_strategy, expected_benefits,timeline_to, budget, per_unit_cost,cost,approve, project_category, link, project_state) VALUES ('" + System.Security.SecurityElement.Escape(a.get_string(title.Text)) + "','" + sector.SelectedValue + "','" + System.Security.SecurityElement.Escape(a.get_string(location.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(aim.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(justification.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(beneficiary.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(new_project.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(nodal_officer.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(implementation_strategy.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(expected_benefits.Text)) + "','" + System.Security.SecurityElement.Escape(timeline_to.Text) + "','" + System.Security.SecurityElement.Escape(a.get_string(budget.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(per_unit_cost.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(cost.Text)) + "','" + approve.SelectedValue + "','" + project_category.SelectedValue + "','" + filename_link + "','" + project_state.SelectedValue + "')"; 
            a.execute_sql(sql);
            Response.Redirect("project.aspx?ADD");
        }
        else if (action.Value == "UPDATE")
        {
            string sql = null;
           
            string filename_link = null;
           

            if (link.HasFile)
            {
                string path_link = System.IO.Path.GetFileName(link.PostedFile.FileName);
                filename_link = "_project_" + a.slug(path_link);
                link.PostedFile.SaveAs(Server.MapPath("uploads/projects/") + filename_link);
                sql = "UPDATE project SET title='" + System.Security.SecurityElement.Escape(a.get_string(title.Text)) + "', sector='" + sector.SelectedValue + "', location='" + System.Security.SecurityElement.Escape(a.get_string(location.Text)) + "', aim='" + System.Security.SecurityElement.Escape(a.get_string(aim.Text)) + "', justification='" + System.Security.SecurityElement.Escape(a.get_string(justification.Text)) + "', beneficiary='" + System.Security.SecurityElement.Escape(a.get_string(beneficiary.Text)) + "', new_project='" + System.Security.SecurityElement.Escape(a.get_string(new_project.Text)) + "', nodal_officer='" + System.Security.SecurityElement.Escape(a.get_string(nodal_officer.Text)) + "', implementation_strategy='" + System.Security.SecurityElement.Escape(a.get_string(implementation_strategy.Text)) + "', expected_benefits='" + System.Security.SecurityElement.Escape(a.get_string(expected_benefits.Text)) + "', timeline_to='" + System.Security.SecurityElement.Escape(timeline_to.Text) + "', budget='" + System.Security.SecurityElement.Escape(a.get_string(budget.Text)) + "', per_unit_cost='" + System.Security.SecurityElement.Escape(a.get_string(per_unit_cost.Text)) + "', cost='" + a.get_string(cost.Text) + "', approve='" + approve.SelectedValue + "', project_category='" + project_category.SelectedValue + "', link='" + filename_link + "', project_state='" + project_state.SelectedValue + "' where id='" + identity.Value + "'";
            }
            else
            {
                sql = "UPDATE project SET title='" + System.Security.SecurityElement.Escape(a.get_string(title.Text)) + "', sector='" + sector.SelectedValue + "', location='" + System.Security.SecurityElement.Escape(a.get_string(location.Text)) + "', aim='" + System.Security.SecurityElement.Escape(a.get_string(aim.Text)) + "', justification='" + System.Security.SecurityElement.Escape(a.get_string(justification.Text)) + "', beneficiary='" + System.Security.SecurityElement.Escape(a.get_string(beneficiary.Text)) + "', new_project='" + System.Security.SecurityElement.Escape(a.get_string(new_project.Text)) + "', nodal_officer='" + System.Security.SecurityElement.Escape(a.get_string(nodal_officer.Text)) + "', implementation_strategy='" + System.Security.SecurityElement.Escape(a.get_string(implementation_strategy.Text)) + "', expected_benefits='" + System.Security.SecurityElement.Escape(a.get_string(expected_benefits.Text)) + "', timeline_to='" + System.Security.SecurityElement.Escape(timeline_to.Text) + "', budget='" + System.Security.SecurityElement.Escape(a.get_string(budget.Text)) + "', per_unit_cost='" + System.Security.SecurityElement.Escape(a.get_string(per_unit_cost.Text)) + "',cost='" + System.Security.SecurityElement.Escape(a.get_string(cost.Text)) + "', approve='" + approve.SelectedValue + "', project_category='" + project_category.SelectedValue + "', project_state='" + project_state.SelectedValue + "' where id='" + identity.Value + "'";
            }
            a.execute_sql(sql);
            Response.Redirect("project.aspx?ADD");
        }}
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
    }
    }
