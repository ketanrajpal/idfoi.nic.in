<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="photo_gallery.aspx.cs" Inherits="photo_gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<a href="photo_gallery.aspx" class="detail_but">View Details</a><a href="photo_gallery.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Photo Gallery</h1>
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
       SqlCommand cmd = new SqlCommand("select * from photo_gallery", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["description"].ToString())); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=photo_gallery&id=<% Response.Write(dr["id"].ToString()); %>&url=photo_gallery.aspx"><span class="fa fa-trash"></span></a></td>
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
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
<fieldset>
      <label for="description">Description</label>
      <asp:TextBox id="description" name="description" runat="server" autocomplete="off"></asp:TextBox>
      
  </fieldset>
    <fieldset>
      <label for="image">Image</label>
       <asp:FileUpload ID="image" runat = "server" autocomplete="off"/>
     <asp:RegularExpressionValidator id="RegularExpressionValidator2" CssClass="validation" runat="server" ErrorMessage="Only bmp, gif, png, jpg, jpeg are alowed."
ValidationExpression="(^[a-zA-Z0-9\\:_-]+)+\.(jpeg|JPEG|gif|GIF|png|PNG|doc|docx|DOC|DOCX|pdf|PDF|jpg|JPG)$" ControlToValidate="image"></asp:RegularExpressionValidator>
    </fieldset>
    <fieldset>
    <label for="image_thumb">Image Thumb</label>
    <asp:FileUpload ID="image_thumb" runat = "server" autocomplete="off"/>
 <asp:RegularExpressionValidator id="RegularExpressionValidator3" CssClass="validation" runat="server" ErrorMessage="Only bmp, gif, png, jpg, jpeg are alowed."
ValidationExpression="(^[a-zA-Z0-9\\:_-]+)+\.(jpeg|JPEG|gif|GIF|png|PNG|doc|docx|DOC|DOCX|pdf|PDF|jpg|JPG)$" ControlToValidate="image_thumb"></asp:RegularExpressionValidator>
</fieldset>
   <fieldset>
   <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
  </fieldset>
    </form>
    <% } %>
</asp:Content>
