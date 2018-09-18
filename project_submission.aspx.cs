using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class project_submission : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        functions a = new functions();
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
            project_state.Items.Insert(0, new ListItem("Select a Project State", "-1"));

            implementation_agency.DataSource = a.dropdown_bind("implementation_agency");
            implementation_agency.DataBind();
            implementation_agency.DataTextField = "name";
            implementation_agency.DataValueField = "id";
            implementation_agency.DataBind();
            implementation_agency.Items.Insert(0, new ListItem("Select a Implementation Agency", "-1"));
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
        functions a = new functions();
        string path_image = System.IO.Path.GetFileName(image.PostedFile.FileName);
        string filename_image = "_project_" + a.slug(path_image);
        image.PostedFile.SaveAs(Server.MapPath("uploads/projects/") + filename_image);

        string path_link = System.IO.Path.GetFileName(link.PostedFile.FileName);
        string filename_link = "_project_" + a.slug(path_link);
        link.PostedFile.SaveAs(Server.MapPath("uploads/projects/") + filename_link);

        string sql = "Insert into project(title, sector, location, aim, beneficiary, new_project, nodal_officer, implementation_strategy, expected_benefits, timeline_from, timeline_to, budget, implementation_agency, per_unit_cost, capital_cost, maintenance_cost, image, approve, project_category, link, project_state) VALUES ('" + a.get_string(title.Text) + "','" + sector.SelectedValue + "','" + a.get_string(location.Text) + "','" + System.Security.SecurityElement.Escape(a.get_string(aim.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(beneficiary.Text)) + "','" + a.get_string(new_project.Text) + "','" + a.get_string(nodal_officer.Value) + "','" + System.Security.SecurityElement.Escape(a.get_string(implementation_strategy.Text)) + "','" + System.Security.SecurityElement.Escape(a.get_string(expected_benefits.Text)) + "','" + timeline_from.Text + "','" + timeline_to.Text + "','" + a.get_string(budget.Text) + "','" + implementation_agency.SelectedValue + "','" + a.get_string(per_unit_cost.Text) + "','" + a.get_string(capital_cost.Text) + "','" + a.get_string(maintenance_cost.Text) + "','" + filename_image + "','" + approve.Value + "','" + project_category.Value + "','" + filename_link + "','" + project_state.SelectedValue + "')";
        a.execute_sql(sql);
        Response.Redirect("default.aspx?ADD");
    }
    
        else
        {
            validate_server.InnerHtml = "The entered information is incorrect. Please rewrite again.";
        }
}}
