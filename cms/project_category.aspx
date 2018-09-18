<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="project_category.aspx.cs" Inherits="project_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">

<a href="project_category.aspx" class="detail_but">View Details</a><a href="project_category.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Project Category</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Name</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from project_category", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["name"].ToString())); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=project_category&id=<% Response.Write(dr["id"].ToString()); %>&url=project_category.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
 <td>Name</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server" enctype="multipart/form-data"><label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
  <label>Name</label>
  <asp:TextBox ID="name" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_name" ControlToValidate="name" runat="server" ErrorMessage="Please enter the name." CssClass="validation"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct name"  CssClass="validation" ControlToValidate="name" ValidationExpression="[a-zA-Z0-9-_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
  <label>Description</label>
  <asp:TextBox ID="description" runat="server" TextMode="MultiLine" Columns="120" Rows="10" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_description" ControlToValidate="description" runat="server" ErrorMessage="Please enter the description." CssClass="validation"></asp:RequiredFieldValidator>
</fieldset>
 <fieldset>
  <label>Link</label>
  <asp:TextBox ID="link" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_link" ControlToValidate="link" runat="server" ErrorMessage="Please enter the link." CssClass="validation"></asp:RequiredFieldValidator>
</fieldset>
 <fieldset>
  <label>Link Label</label>
  <asp:TextBox ID="link_label" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_link_label" ControlToValidate="link_label" runat="server" ErrorMessage="Please enter the link label." CssClass="validation"></asp:RequiredFieldValidator>
 </fieldset>
 <fieldset>
  <label>Image</label>
  <asp:FileUpload id="image" runat="server" autocomplete="off"/>
  
 </fieldset>
 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
 </fieldset>
</form>
<% } %>

</asp:Content>