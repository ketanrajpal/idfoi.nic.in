<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="careers.aspx.cs" Inherits="careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script runat="server">

</script>
<h1>Jobs at IDF-OI</h1>
        <ul class="india-inspires">
<%
    functions a = new functions();
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from careers", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %>
        <li><a href="<% Response.Write(a.path() +"careers/"+ dr["uploads"].ToString()); %>" target="_blank">
        <% Response.Write(dr["heading"].ToString()); %></a>
    <span class="date"><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["description"].ToString())); %></span></li>

  <%
    }
    con.Close();    
%>

</asp:Content>

