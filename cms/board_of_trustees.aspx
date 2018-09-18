<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="board_of_trustees.aspx.cs" Inherits="board_of_trustees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<a href="board_of_trustees.aspx" class="detail_but">View Details</a><a href="board_of_trustees.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Board of Trustees</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Name</td>
  <td>Designation</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from board_of_trustees", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["name"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["designation"].ToString())); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=board_of_trustees&id=<% Response.Write(dr["id"].ToString()); %>&url=board_of_trustees.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
  <td>Name</td>
  <td>Designation</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
  <label>Name</label>
  <asp:TextBox ID="name" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_name" ControlToValidate="name" runat="server" ErrorMessage="Please enter the name." CssClass="validation"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct name"  CssClass="validation" ControlToValidate="name" ValidationExpression="[a-zA-Z0-9-.,`&()_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
  <label>Designation</label>
  <asp:TextBox ID="designation" runat="server" autocomplete="off" name="designation"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_designation" ControlToValidate="designation" runat="server" ErrorMessage="Please enter the designation." CssClass="validation"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct designation"  CssClass="validation" ControlToValidate="designation" ValidationExpression="[a-zA-Z0-9-`&.,()_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
  <label>Category</label>
   <asp:DropDownList id="category" name="category" runat="server" autocomplete="off"></asp:DropDownList>
   <asp:RegularExpressionValidator Display="Dynamic" id="require_category"
                   ControlToValidate="category"
                   ValidationExpression="\d+"
                   
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please select category"
                   runat="server"/>
 </fieldset>
  <fieldset>
  <label>Description</label>
  <asp:TextBox ID="description" TextMode="MultiLine" Columns="120" Rows="10" runat="server" autocomplete="off"></asp:TextBox>
  
</fieldset>
 <fieldset>
  <label>Image</label>
 <asp:FileUpload ID="image" runat = "server" autocomplete="off" />
  <asp:RegularExpressionValidator id="RegularExpressionValidator3" CssClass="validation" runat="server" ErrorMessage="Only bmp, gif, png, jpg, jpeg are alowed."
ValidationExpression="(^[a-zA-Z0-9\\:_-]+)+\.(jpeg|JPEG|gif|GIF|png|PNG|doc|docx|DOC|DOCX|pdf|PDF|jpg|JPG)$" ControlToValidate="image"></asp:RegularExpressionValidator>
</fieldset>
 <fieldset>
   <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />

  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
 </fieldset>
</form>
<% } %>

</asp:Content>