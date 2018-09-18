<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<% functions a = new functions(); %>
<h1><% Response.Write(a.get_value("heading", "pages", "7")); %>
<span><% Response.Write(a.get_value("sub_heading", "pages", "7")); %></span></h1>
<% Response.Write(System.Web.HttpUtility.HtmlDecode(a.get_value("description", "pages", "7"))); %>


</asp:Content>

