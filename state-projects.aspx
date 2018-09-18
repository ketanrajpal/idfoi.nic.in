<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% Session["page"]="giving-back"; %>
<% functions a = new functions(); %>
<h1><% Response.Write(a.get_value("name", "project_category", "3")); %></h1>
<% Response.Write(System.Web.HttpUtility.HtmlDecode(a.get_value("description", "project_category", "3"))); %>
<p><a href="<% Response.Write(a.get_value("link", "project_category", "3")); %>" target="_blank"><% Response.Write(a.get_value("link_label", "project_category", "3")); %></a></p>

<h1>Projects</h1>

<%
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("Select DISTINCT project_state from project where project_category='3'", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %><h2><% Response.Write(a.get_value("name", "project_state", dr["project_state"].ToString())); %></h2><ul class="list"><%
        
        cmd = new SqlCommand("select * from project where project_state='"+dr["project_state"].ToString()+"' and project_category='3'", con);
        SqlDataReader dr1 = cmd.ExecuteReader();
        while (dr1.Read())
        {
            
        %>
        <li><% Response.Write(dr1["title"].ToString()); %> <!--<a href="<% Response.Write(a.path() +"projects/"+ dr1["link"].ToString()); %>" target="new"><span class="fa fa-file-pdf-o"></span></a>-->&nbsp;<a href="projects.aspx?project=<% Response.Write(dr1["id"].ToString()); %>" target="new"><span class="fa fa-globe"></span></a></li>
        
        <%
}
        %></ul><%
    }
    con.Close();    
%>

</asp:Content>

