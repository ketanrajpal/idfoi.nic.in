<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="nodal_officer.aspx.cs" Inherits="nodal_officer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Nodal Officer</h1>
<form class="form feedback" name="myform" id="myform" runat="server">
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
 <div class="clear"></div>
  <fieldset>
      <label for="first_name">First Name <span class="imp">*</span></label>
      <asp:TextBox id="first_name" name="first_name" runat="server" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_first_name" ControlToValidate="first_name" runat="server" ErrorMessage="Please enter the First name." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="surname">Surname<span class="imp">*</span></label>
      <asp:TextBox id="surname" name="surname" runat="server" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_surname" ControlToValidate="surname" runat="server" ErrorMessage="Please enter the surname." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
   <fieldset>
      <label for="organisation">Organization<span class="imp">*</span></label>
      <asp:TextBox id="organisation" name="organisation" runat="server" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_organisation" ControlToValidate="organisation" runat="server" ErrorMessage="Please enter the organisation." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
     <fieldset>
      <label for="position">Position<span class="imp">*</span></label>
      <asp:TextBox id="position" name="position" runat="server" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_position" ControlToValidate="position" runat="server" ErrorMessage="Please enter the position." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="landline">Landline<span class="imp">*</span></label>
      <asp:TextBox id="landline" name="landline" runat="server" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_landline" ControlToValidate="landline" runat="server" ErrorMessage="Please enter the landline no." CssClass="validation"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="regular_landline" runat="server" ControlToValidate="landline" ErrorMessage="Phone number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation"></asp:RegularExpressionValidator>
      </fieldset>
    <fieldset>
      <label for="mobile">Mobile<span class="imp">*</span></label>
      <asp:TextBox id="mobile" name="mobile" runat="server" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_mobile" ControlToValidate="mobile" runat="server" ErrorMessage="Please enter the mobile no." CssClass="validation"></asp:RequiredFieldValidator>
   <asp:RegularExpressionValidator ID="regular_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="Mobile number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation"></asp:RegularExpressionValidator>
   </fieldset>
    <fieldset>
      <label for="email">Email<span class="imp">*</span></label>
      <asp:TextBox id="email" name="email" runat="server" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter the email." CssClass="validation"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="regular_email" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="email" CssClass="validation"
      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
        <div class="clear"></div>
   <fieldset>
      <label for="password">Passsword<span class="imp">*</span></label>
      <asp:TextBox id="password" name="password" runat="server" TextMode="Password" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_password" ControlToValidate="password" runat="server" ErrorMessage="Please enter the password." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>
    <fieldset>
      <label for="confirm_password">Confirm Passsword<span class="imp">*</span></label>
      <asp:TextBox id="confirm_password" name="confrim_password" runat="server" TextMode="Password" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_confirm_password" ControlToValidate="confirm_password" runat="server" ErrorMessage="Please enter the confirm password." CssClass="validation"></asp:RequiredFieldValidator>
    </fieldset>

<asp:CompareValidator ID="compare_password" runat="server" ErrorMessage="Please check the password you have entered. It doesn't Match." CssClass="validation" ControlToCompare="confirm_password" ControlToValidate="password"></asp:CompareValidator>

    <fieldset>
    <asp:HiddenField ID="type" runat="server" Value="4" />
    <asp:HiddenField ID="approve" runat="server" Value="0" />
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Next" runat="server" onclick="submit_Click"/>
 </fieldset>
</form>
</asp:Content>

