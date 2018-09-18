<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="pages.aspx.cs" Inherits="pages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
    <a href="pages.aspx" class="detail_but">View Details</a><a href="pages.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Pages</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Heading</td>
  <td>Sub Heading</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from pages", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["heading"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["sub_heading"].ToString())); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
           <td><a title="Delete" class="delete" href="delete.aspx?mod=pages&id=<% Response.Write(dr["id"].ToString()); %>&url=pages.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
 <td>Heading</td>
  <td>Sub Heading</td>
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
    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct heading"  CssClass="validation" ControlToValidate="heading" ValidationExpression="[a-zA-Z0-9-.`!@#$%^&*()?,_ ]*$"></asp:RegularExpressionValidator>
   
</fieldset>
    <fieldset>
      <label for="sub_heading">Sub Heading</label>
      <asp:TextBox id="sub_heading" name="sub_heading" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct sub heading"  CssClass="validation" ControlToValidate="sub_heading" ValidationExpression="[a-zA-Z0-9-.!@#$%^&*()?,_ ]*$"></asp:RegularExpressionValidator>
   
</fieldset>
    <fieldset>
      <label for="description">Description</label>
    <asp:TextBox id="description" TextMode="multiline" Columns="120" Rows="10" runat="server" autocomplete="off" />
      
</fieldset>
    <fieldset>
      <label for="link_label">Link Label</label>
      <asp:TextBox id="link_label" name="link_label" runat="server" autocomplete="off"></asp:TextBox>
     <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter the correct link label"  CssClass="validation" ControlToValidate="link_label" ValidationExpression="[a-zA-Z0-9-_ ]*$"></asp:RegularExpressionValidator>
    </fieldset>
    <fieldset>
      <label for="link">Link</label>
      <asp:TextBox id="link" name="link" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter the correct link"  CssClass="validation" ControlToValidate="link" ValidationExpression="^(http(?:s)?\:\/\/[a-zA-Z0-9]+(?:(?:\.|\-)[a-zA-Z0-9]+)+(?:\:\d+)?(?:\/[\w\-]+)*(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)$"></asp:RegularExpressionValidator>
    </fieldset>
   <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click"/>
    </form>
    <% } %>
</asp:Content>
