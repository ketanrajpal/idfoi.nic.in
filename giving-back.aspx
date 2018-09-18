<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% Session["page"]="giving-back"; %>
<% functions a = new functions(); %>
<h1><% Response.Write(a.get_value("heading", "pages", "6")); %>
<span><% Response.Write(a.get_value("sub_heading", "pages", "6")); %></span></h1>
<% Response.Write(System.Web.HttpUtility.HtmlDecode(a.get_value("description", "pages", "6"))); %>

</asp:Content>

