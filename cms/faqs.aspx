<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="faqs.aspx.cs" Inherits="faqs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">

<a href="faqs.aspx" class="detail_but">View Details</a><a href="faqs.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Faqs</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Question</td>
  <td>Answer</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from faqs", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["question"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["answer"].ToString())); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=faqs&id=<% Response.Write(dr["id"].ToString()); %>&url=faqs.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
  <td>Question</td>
  <td>Answer</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
    <fieldset>
      <label for="question">Question</label>
    <asp:TextBox id="question" name="question" runat="server" autocomplete="off" />
      <asp:RequiredFieldValidator Display="Dynamic" ID="require_question" ControlToValidate="question" runat="server" ErrorMessage="Please enter the question." CssClass="validation"></asp:RequiredFieldValidator>

   </fieldset>
    <fieldset>
      <label for="answer">Answer</label>
    <asp:TextBox id="answer" name="answer" runat="server" autocomplete="off"/>
      <asp:RequiredFieldValidator Display="Dynamic" ID="require_answer" ControlToValidate="answer" runat="server" ErrorMessage="Please enter the answer." CssClass="validation"></asp:RequiredFieldValidator>

   </fieldset>
    <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="Button1" Text="Submit" runat="server" onclick="submit_Click"/>
    </form>
    <% } %>
 
</asp:Content>

