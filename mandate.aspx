<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% functions a = new functions(); %>
<h1><% Response.Write(a.get_value("heading", "pages", "3")); %><span><% Response.Write(a.get_value("sub_heading", "pages", "3")); %></span></h1>
<% Response.Write(System.Web.HttpUtility.HtmlDecode(a.get_value("description", "pages", "3"))); %><p><a href="<% Response.Write(a.get_value("link", "pages", "3")); %>" target="_blank"><% Response.Write(a.get_value("link_label", "pages", "3")); %></a></p>
</asp:Content>

