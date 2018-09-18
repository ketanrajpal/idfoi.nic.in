<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">

<a href="news.aspx" class="detail_but">View Details</a><a href="news.aspx?slug=add" class="detail_but">Add Details</a>
<h1>News</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Description</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from news", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["description"].ToString())); %></td>
          
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=news&id=<% Response.Write(dr["id"].ToString()); %>&url=news.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
  <td>Description</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server">
    <fieldset>
      <label for="description">Description</label>
    <asp:TextBox id="description" name="description" TextMode="MultiLine" Columns="120" Rows="10" runat="server" />
      
    </fieldset>
    
   
    <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="Button1" Text="Submit" runat="server" onclick="submit_Click"/>
    </form>
    <% } %>
 
</asp:Content>
