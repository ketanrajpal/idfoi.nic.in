<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<a href="feedback.aspx" class="detail_but">View Details</a>
<h1>Feedback</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Name</td>
  <td>Organization</td>
  <td>Address</td>
  <td>Telephone</td>
  <td>Email</td>
  <td>Designation</td>
  <td>Message</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from feedback", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["name"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["organization"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["addresss_line_1"].ToString()));%>,<% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["addresss_line_1"].ToString()));%></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["telephone"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["email"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["designation"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["message"].ToString())); %></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=feedback&id=<% Response.Write(dr["id"].ToString()); %>&url=feedback.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
 <td>Name</td>
  <td>Organization</td>
  <td>Address</td>
  <td>Telephone</td>
  <td>Email</td>
  <td>Designation</td>
  <td>Message</td>
  <td>Delete</td>
</tfoot>
</table>
<% } if (Request.QueryString["slug"] == "add")
   { %>
   <% } %>
</asp:Content>

