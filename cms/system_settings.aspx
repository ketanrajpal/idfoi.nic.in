<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="system_settings.aspx.cs" Inherits="system_settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<% String mod = Request.QueryString["mod"];

   if (Request.QueryString["mod"] == null)
   {
       Response.Redirect("dashboard.aspx");
   }
   string title=null;
   if (mod == "title")
   {
       title = "Title";
   }
   else if(mod=="type")
   {
       title = "Type";
   }
   else if (mod == "state")
   { title = "State"; }
   else if (mod == "category")
   { title = "Category"; }
   else if (mod == "project_state")
   { title = "Project State"; }
   else if (mod == "implementation_agency")
   { title = "Implementation Agency"; }
   else if (mod == "profession")
   { title = "Profession"; }
   else if (mod == "area_of_interest")
   { title = "Area of Interset"; }
   else if (mod == "sector")
   { title = "Sector"; }
   else if(mod == "media_category")
   { title = "Media Category"; }
   else if (mod == "country_residence")
   { title = "Country Residence"; }
   else if (mod == "state_government")
   { title = "State Government"; }
else{ 
Response.Redirect("http://idfoi.org/error.aspx");}
   
       
    %>
<a href="system_settings.aspx?mod=<%=mod %>" class="detail_but">View Details</a><a href="system_settings.aspx?mod=<%=mod %>&slug=add" class="detail_but">Add Details</a>
<h1><% =title %></h1>
<div class="clear"></div>


<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Name</td>
  <td>Order</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from "+mod, con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(dr["name"].ToString()); %></td>
          <td><% Response.Write(dr["ordern"].ToString()); %></td>
          <td><a title="Update" href="?mod=<% =mod %>&slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" href="delete.aspx?mod=<% =mod %>&id=<% Response.Write(dr["id"].ToString()); %>&url=system_settings.aspx?mod=<% =mod %>" class="delete"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
  <td>Name</td>
  <td>Order</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>


<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server">

<label class="validation" id="validate_server" runat="server"></label>

 <fieldset>
  <label>Name</label>
  <asp:TextBox ID="name" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_name" ControlToValidate="name" runat="server" ErrorMessage="Please enter the name." CssClass="validation" EnableClientScript="false"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct name"  CssClass="validation" ControlToValidate="name" ValidationExpression="[a-zA-Z0-9-_ ]*$" EnableClientScript="false"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
  <label>Order</label>
  <asp:TextBox ID="ordern" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_ordern" ControlToValidate="ordern" runat="server" ErrorMessage="Please enter the order." CssClass="validation" EnableClientScript="false"></asp:RequiredFieldValidator>
   <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct order" CssClass="validation" ControlToValidate="ordern" ValidationExpression="[0-9]*$" EnableClientScript="false"></asp:RegularExpressionValidator>
</fieldset>
 <fieldset>
  
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />

  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
 </fieldset>
</form>
<% } %>
</asp:Content>
