<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% Session["page"]=Request.QueryString["project"]; %>
<% functions a = new functions(); %>

<h1>Projects</h1>

<%
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from project where id='"+Request.QueryString["project"]+"'", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %><h1><% Response.Write(dr["title"].ToString()); %></h1><p><%

%><p><%
    }
    con.Close();    
%>

</asp:Content>
