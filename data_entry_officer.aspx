<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="data_entry_officer.aspx.cs" Inherits="data_entry_officer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Data Entry Officer</h1>
<form class="form feedback" name="myform" id="myform" runat="server">
<label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
   <label for='title'>Title<span class="imp">*</span></label>
      <asp:DropDownList id="title" name="title" runat="server" autocomplete="off">
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
      <asp:TextBox id="first_name" name="first_name" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_first_name" ControlToValidate="first_name" runat="server" ErrorMessage="Please enter the First name." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct first name"  CssClass="validation" ControlToValidate="first_name" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
      </fieldset>
    <fieldset>
      <label for="surname">Surname<span class="imp">*</span></label>
      <asp:TextBox id="surname" name="surname" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_surname" ControlToValidate="surname" runat="server" ErrorMessage="Please enter the surname." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct surname"  CssClass="validation" ControlToValidate="surname" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
  </fieldset>
   <fieldset>
      <label for="organisation">Organization<span class="imp">*</span></label>
      <asp:TextBox id="organisation" name="organisation" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_organisation" ControlToValidate="organisation" runat="server" ErrorMessage="Please enter the organisation." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter the correct organisation"  CssClass="validation" ControlToValidate="organisation" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
   </fieldset>
     <fieldset>
      <label for="position">Position<span class="imp">*</span></label>
      <asp:TextBox id="position" name="position" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_position" ControlToValidate="position" runat="server" ErrorMessage="Please enter the position." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter the correct position"  CssClass="validation" ControlToValidate="position" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
    </fieldset>
    <fieldset>
      <label for="landline">Landline<span class="imp">*</span></label>
      <asp:TextBox id="landline" name="landline" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_landline" ControlToValidate="landline" runat="server" ErrorMessage="Please enter the landline no." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="regular_landline" runat="server" ControlToValidate="landline" ErrorMessage="Phone number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation" Display="Dynamic"></asp:RegularExpressionValidator>
   </fieldset>
    <fieldset>
      <label for="mobile">Mobile<span class="imp">*</span></label>
      <asp:TextBox id="mobile" name="mobile" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_mobile" ControlToValidate="mobile" runat="server" ErrorMessage="Please enter the mobile no." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regular_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="Mobile number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation" Display="Dynamic"></asp:RegularExpressionValidator>
  </fieldset>
    <fieldset>
      <label for="email">Email<span class="imp">*</span></label>
      <asp:TextBox id="email" name="email" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter the email." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="regular_email" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="email" CssClass="validation"
      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
     </asp:RegularExpressionValidator>
   </fieldset>
    <fieldset>
      <label for="state">State<span class="imp">*</span></label>
      <asp:DropDownList id="state" name="state" runat="server" autocomplete="off">
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
      <asp:TextBox id="password" name="password" runat="server" TextMode="Password" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_password" ControlToValidate="password" runat="server" ErrorMessage="Please enter the password." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
   <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Password length must be between 7 to 10 characters"  CssClass="validation" ControlToValidate="password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" Display="Dynamic"></asp:RegularExpressionValidator>
   </fieldset>
    <fieldset>
      <label for="confirm_password">Confirm Passsword<span class="imp">*</span></label>
      <asp:TextBox id="confirm_password" name="confrim_password" runat="server" TextMode="Password" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_confirm_password" ControlToValidate="confirm_password" runat="server" ErrorMessage="Please enter the confirm password." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Please enter the correct confirm password"  CssClass="validation" ControlToValidate="confirm_password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" Display="Dynamic"></asp:RegularExpressionValidator>
    <asp:CompareValidator ID="compare_password" runat="server" ErrorMessage="Please check the password you have entered. It doesn't Match." CssClass="validation" ControlToCompare="confirm_password" ControlToValidate="password"></asp:CompareValidator>
   </fieldset>
<fieldset>
    <asp:HiddenField ID="type" runat="server" Value="5" />
    <asp:HiddenField ID="approve" runat="server" Value="0" />
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
 <asp:Button ID="submit" Text="Next" runat="server" CssClass="btn" onclick="submit_Click" />
 </fieldset>
 </form>
</asp:Content>
