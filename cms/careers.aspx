<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="careers.aspx.cs" Inherits="careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
    <a href="careers.aspx" class="detail_but">View Details</a><a href="careers.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Careers</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Heading</td>
  <td>Description</td>
  <td>Upload File</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from careers", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
         <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["heading"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["description"].ToString())); %></td>
          <td><% Response.Write(dr["uploads"].ToString()); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=careers&id=<% Response.Write(dr["id"].ToString()); %>&url=careers.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
  <td>Heading</td>
  <td>Description</td>
  <td>Upload File</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
<fieldset>
      <label for="heading">Heading</label>
      <asp:TextBox id="heading" name="heading" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator Display="Dynamic" ID="require_heading" ControlToValidate="heading" runat="server" ErrorMessage="Please enter the Heading." CssClass="validation"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct Heading"  CssClass="validation" ControlToValidate="Heading" ValidationExpression="[a-zA-Z0-9-.(),_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
       <fieldset>
      <label for="description">Description</label>
    <asp:TextBox id="description" TextMode="multiline" Columns="120" Rows="10" runat="server" autocomplete="off"/>
      
    </fieldset>
    <fieldset>
      <label for="uploads">Upload File</label>
       <asp:FileUpload ID="uploads" runat = "server" autocomplete="off" />
    <asp:RegularExpressionValidator id="RegularExpressionValidator2" CssClass="validation" runat="server" ErrorMessage="Only bmp, gif, png, jpg, jpeg, doc, xls, pdf, docx, ppt are alowed."
ValidationExpression="(^[a-zA-Z0-9\\:_-]+)+\.(jpeg|JPEG|gif|GIF|png|PNG|doc|docx|DOC|DOCX|pdf|PDF|jpg|JPG)$" ControlToValidate="uploads"></asp:RegularExpressionValidator>
    </fieldset>
   <fieldset>
   <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click"/>
  </fieldset>
    </form>
    <% } %>
</asp:Content>