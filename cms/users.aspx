<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<a href="users.aspx" class="detail_but">View Details</a><a href="users.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Users</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Name</td>
  <td>Organisation</td>
  <td>Position</td>
  <td>Landline</td>
  <td>Mobile</td>
  <td>Email</td>
  <td>State</td>
  <td>Type</td>
  <td>Approve</td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from users", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(dr["first_name"].ToString()); %>&nbsp;<% Response.Write(dr["surname"].ToString()); %></td>
          <td><% Response.Write(dr["organisation"].ToString()); %></td>
          <td><% Response.Write(dr["position"].ToString()); %></td>
          <td><% Response.Write(dr["landline"].ToString()); %></td>
          <td><% Response.Write(dr["mobile"].ToString()); %></td>
          <td><% Response.Write(dr["email"].ToString()); %></td>
          <td><% Response.Write(dr["state"].ToString()); %></td>
          <td><% Response.Write(dr["type"].ToString()); %></td>
          <td><% Response.Write(dr["approve"].ToString()); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" class="delete" href="delete.aspx?mod=users&id=<% Response.Write(dr["id"].ToString()); %>&url=users.aspx"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
 <td>Name</td>
  <td>Organisation</td>
  <td>Position</td>
  <td>Landline</td>
  <td>Mobile</td>
  <td>Email</td>
  <td>State</td>
  <td>Type</td>
  <td>Approve</td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>

<form class="form" name="myform" id="myform" runat="server">
<label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
   <label for='title'>Title<span class="imp">*</span></label>
      <asp:DropDownList id="title" name="title" runat="server">
       <asp:ListItem Value="-1">Select Title</asp:ListItem>
       </asp:DropDownList>
       <asp:RegularExpressionValidator id="require_title"
                   ControlToValidate="title"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter title"
                   runat="server"/>
        </fieldset>
 
  <fieldset>
      <label for="first_name">First Name <span class="imp">*</span></label>
      <asp:TextBox id="first_name" name="first_name" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_first_name" ControlToValidate="first_name" runat="server" ErrorMessage="Please enter the First name." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="surname">Surname<span class="imp">*</span></label>
      <asp:TextBox id="surname" name="surname" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_surname" ControlToValidate="surname" runat="server" ErrorMessage="Please enter the surname." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
   <fieldset>
      <label for="organisation">Organization<span class="imp">*</span></label>
      <asp:TextBox id="organisation" name="organisation" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_organisation" ControlToValidate="organisation" runat="server" ErrorMessage="Please enter the organisation." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
     <fieldset>
      <label for="position">Position<span class="imp">*</span></label>
      <asp:TextBox id="position" name="position" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_position" ControlToValidate="position" runat="server" ErrorMessage="Please enter the position." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="landline">Landline<span class="imp">*</span></label>
      <asp:TextBox id="landline" name="landline" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_landline" ControlToValidate="landline" runat="server" ErrorMessage="Please enter the landline no." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="mobile">Mobile<span class="imp">*</span></label>
      <asp:TextBox id="mobile" name="mobile" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_mobile" ControlToValidate="mobile" runat="server" ErrorMessage="Please enter the mobile no." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="email">Email<span class="imp">*</span></label>
      <asp:TextBox id="email" name="email" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter the email." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="state">State<span class="imp">*</span></label>
      <asp:DropDownList id="state" name="state" runat="server">
       <asp:ListItem asp:DropDownListed="True" value="-1">Select a State</asp:ListItem>
       </asp:DropDownList>
       <asp:RegularExpressionValidator id="require_state"
                   ControlToValidate="state"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a state"
                   runat="server"/>
       </fieldset>
    <fieldset>
      <label for="type">Type<span class="imp">*</span></label>
      <asp:DropDownList id="type" name="type" runat="server">
       <asp:ListItem asp:DropDownListed="True" value="-1">Select a Type</asp:ListItem>
      </asp:DropDownList>
      <asp:RegularExpressionValidator id="require_type"
                   ControlToValidate="type"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter type"
                   runat="server"/>
    </fieldset>
     <fieldset>
      <label for="approve">Approve<span class="imp">*</span></label>
      <asp:DropDownList id="approve" name="approve" runat="server">
       <asp:ListItem asp:DropDownListed="True" value="-1">Select Approval</asp:ListItem>
       <asp:ListItem Value="1">Yes</asp:ListItem>
        <asp:ListItem Value="0">No</asp:ListItem>
      </asp:DropDownList>
      <asp:RegularExpressionValidator id="require_approve"
                   ControlToValidate="type"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter approval"
                   runat="server"/>
    </fieldset>
     <fieldset>
      <label for="password">Passsword<span class="imp">*</span></label>
      <asp:TextBox id="password" name="password" runat="server" TextMode="Password" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_password" ControlToValidate="password" runat="server" ErrorMessage="Please enter the password." CssClass="validation"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator8" runat="server" ErrorMessage="Password length must be greater than 7 characters"  CssClass="validation" ControlToValidate="password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,100}$"></asp:RegularExpressionValidator>
    </fieldset>
    <fieldset>
      <label for="confirm_password">Confirm Passsword<span class="imp">*</span></label>
      <asp:TextBox id="confirm_password" name="confrim_password" runat="server" TextMode="Password" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_confirm_password" ControlToValidate="confirm_password" runat="server" ErrorMessage="Please enter the confirm password." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
<asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator9" runat="server" ErrorMessage="Password length must be greater than 7 characters"  CssClass="validation" ControlToValidate="confirm_password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,100}$"></asp:RegularExpressionValidator>
    <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click"/>
 </fieldset>
</form>
<script src="js/md5.js"></script>

<script>
    $("#myform").submit(function () {
        hash = CryptoJS.MD5(document.getElementById("ContentPlaceHolder1_password").value);
        document.getElementById("ContentPlaceHolder1_password").value = hash;
        document.getElementById("ContentPlaceHolder1_confirm_password").value = hash;
        return true;
    });

</script>
<% } %>
</asp:Content>