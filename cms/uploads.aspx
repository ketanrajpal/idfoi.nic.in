<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="uploads.aspx.cs" Inherits="uploads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<a href="uploads.aspx" class="detail_but">View Details</a><a href="uploads.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Uploads</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Uploads</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from uploads", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td>http://www.cms.idfoi.org/uploads<% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["text"].ToString())); %></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=uploads&id=<% Response.Write(dr["id"].ToString()); %>&url=uploads.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
 <td>Uploads</td>
 <td>Delete</td>
</tfoot>
</table>

<% } if (Request.QueryString["slug"] == "add")
   { %>
   <form class="form" name="myform" id="myform" runat="server">
   <div class="validation" id="validate_server" runat="server"></div>
   <fieldset>
      <label for="text">Upload File</label>
       <asp:FileUpload ID="text" runat = "server" autocomplete="off"/>
      <asp:RegularExpressionValidator id="RegularExpressionValidator1" CssClass="validation" runat="server" ErrorMessage="Invalid File Name (Allowed Extensions: jpg, jpeg, gif, png, doc, docx, pdf)"
ValidationExpression="(^[a-zA-Z0-9\\:_-]+)+\.(jpeg|JPEG|gif|GIF|png|PNG|doc|docx|DOC|DOCX|pdf|PDF|jpg|JPG)$" ControlToValidate="text"></asp:RegularExpressionValidator>
 </fieldset>
    <fieldset>
   <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click"  />
  </fieldset>
   </form>
    <% } %>
</asp:Content>

