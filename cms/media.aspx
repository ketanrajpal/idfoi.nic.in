<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="media.aspx.cs" Inherits="media" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">


<a href="media.aspx" class="detail_but">View Details</a><a href="media.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Media</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Category</td>
  <td>Title</td>
  <td>Date</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from media_media_category", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["media_category"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["title"].ToString())); %></td>

          <% functions a = new functions();
             string mydate = dr["event_date"].ToString();
             DateTime dt = Convert.ToDateTime(mydate); %>

          <td><% Response.Write(dt.Day + "/" + dt.Month + "/" + dt.Year); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
           <td><a title="Delete" class="delete" href="delete.aspx?mod=media&id=<% Response.Write(dr["id"].ToString()); %>&url=media.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
    <td>Category</td>
  <td>Title</td>
  <td>Date</td>
    <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
  <label>Media Category</label>
  <asp:DropDownList id="media_category" name="nodal_officer" runat="server"></asp:DropDownList>
  <asp:RegularExpressionValidator Display="Dynamic" id="require_media_category"
                   ControlToValidate="media_category"
                   ValidationExpression="\d+"
                   
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter Media category"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>Title</label>
  <asp:TextBox ID="title" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_title" ControlToValidate="title" runat="server" ErrorMessage="Please enter the title." CssClass="validation"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct title"  CssClass="validation" ControlToValidate="title" ValidationExpression="[a-zA-Z0-9-.,!@#$%^&*`;()_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
  <fieldset>
  <label>Sub Heading</label>
  <asp:TextBox ID="sub_heading" runat="server" autocomplete="off"></asp:TextBox>
   <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct sub heading"  CssClass="validation" ControlToValidate="sub_heading" ValidationExpression="[a-zA-Z0-9-.(),_ ]*$"></asp:RegularExpressionValidator>
  </fieldset>
 <fieldset>
  <label>Link</label>
  <asp:TextBox ID="link" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_link" ControlToValidate="link" runat="server" ErrorMessage="Please enter the link." CssClass="validation"></asp:RequiredFieldValidator>
 
 </fieldset>
  <fieldset>
  <label>Event Date</label>
  <asp:TextBox ID="event_date" class="datepicker" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_event_date" ControlToValidate="event_date" runat="server" ErrorMessage="Please enter the event date." CssClass="validation"></asp:RequiredFieldValidator>
  
 </fieldset>
 
 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
 </fieldset>
</form>
<% } %>

</asp:Content>
