﻿<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="champions.aspx.cs" Inherits="champions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">


<a href="champions.aspx" class="detail_but">View Details</a><a href="champions.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Champions</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
 
  <td>Title</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from champions", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
         
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["title"].ToString())); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
           <td><a title="Delete" class="delete" href="delete.aspx?mod=champions&id=<% Response.Write(dr["id"].ToString()); %>&url=champions.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
   
  <td>Title</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
  <label>Title</label>
  <asp:TextBox ID="title" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_title" ControlToValidate="title" runat="server" ErrorMessage="Please enter the title." CssClass="validation"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct title"  CssClass="validation" ControlToValidate="title" ValidationExpression="[a-zA-Z0-9-.,()_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
  <fieldset>
      <label for="description">Description</label>
      <asp:TextBox id="description" TextMode="MultiLine" name="description" columns="120" rows="10" runat="server" autocomplete="off"></asp:TextBox>
      
   </fieldset>
     <fieldset>
    <label for="image">Image</label>
    <asp:FileUpload ID="image" runat = "server" autocomplete="off"/>
    <asp:RegularExpressionValidator id="RegularExpressionValidator2" CssClass="validation" runat="server" ErrorMessage="Only bmp, gif, png, jpg, jpeg are alowed."
ValidationExpression="(^[a-zA-Z0-9\\:_-]+)+\.(jpeg|JPEG|gif|GIF|png|PNG|doc|docx|DOC|DOCX|pdf|PDF|jpg|JPG)$" ControlToValidate="image"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
 <label>Order</label>
  <asp:TextBox ID="ordern" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_ordern" ControlToValidate="ordern" runat="server" ErrorMessage="Please enter the order." CssClass="validation"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter the correct order"  CssClass="validation" ControlToValidate="ordern" ValidationExpression="[a-zA-Z0-9-_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click"/>
 </fieldset>
</form>
<% } %>


</asp:Content>