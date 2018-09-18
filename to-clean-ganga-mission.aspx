<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% Session["page"]="giving-back"; %>
<% functions a = new functions(); %>
<h1><% Response.Write(a.get_value("name", "project_category", "2")); %></h1>
<% Response.Write(System.Web.HttpUtility.HtmlDecode(a.get_value("description", "project_category", "2"))); %>
<p><a href="<% Response.Write(a.get_value("link", "project_category", "2")); %>" target="_blank"><% Response.Write(a.get_value("link_label", "project_category", "2")); %></a></p>


</asp:Content>

