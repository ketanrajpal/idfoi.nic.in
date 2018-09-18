<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Feedback</h1>
    <p>Please answer as many questions as you are able to or are comfortable with. Your answers will help us to shape the work of IDF-OI and make our work in shaping India's future more effective.</p>
    <form class="form feedback" name="myform" id="myform" runat="server">
    
     <div class="error"></div>
      <fieldset>
      <label for="name">Name <span class="imp">*</span></label>
      <asp:TextBox id="name" name="name" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_name" ControlToValidate="name" runat="server" ErrorMessage="Please enter the name." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct name"  CssClass="validation" ControlToValidate="name" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
    </fieldset>
      <fieldset>
        <label>Organization<span class="imp">*</span></label>
        <asp:TextBox id="organization" name="organization" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_organization" ControlToValidate="organization" runat="server" ErrorMessage="Please enter the organization." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct organization"  CssClass="validation" ControlToValidate="organization" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
    </fieldset>
      <div class="clear"></div>
      <fieldset>
        <label>Address Line 1<span class="imp">*</span></label>
       <asp:TextBox id="addresss_line_1" name="addresss_line_1" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_addresss_line_1" ControlToValidate="addresss_line_1" runat="server" ErrorMessage="Please enter the addresss line 1." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter the correct addresss line 1"  CssClass="validation" ControlToValidate="addresss_line_1" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
         </fieldset>
      <fieldset>
        <label>Address Line 2<span class="imp">*</span></label>
        <asp:TextBox id="addresss_line_2" name="addresss_line_2" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_addresss_line_2" ControlToValidate="addresss_line_2" runat="server" ErrorMessage="Please enter the addresss line 2." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter the correct addresss line 2"  CssClass="validation" ControlToValidate="addresss_line_2" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
      </fieldset>
      <div class="clear"></div>
      <fieldset>
        <label>Telephone<span class="imp">*</span></label>
       <asp:TextBox id="telephone" name="telephone" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_telephone" ControlToValidate="telephone" runat="server" ErrorMessage="Please enter the telephone." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="regular_telephone" runat="server" ControlToValidate="telephone" ErrorMessage="Phone number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation" Display="Dynamic"></asp:RegularExpressionValidator>
      </fieldset>
      <fieldset>
        <label>Email<span class="imp">*</span></label>
       <asp:TextBox id="email" name="email" runat="server" autocomplete="off"></asp:TextBox>
    <asp:RequiredFieldValidator ID="require_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter the email." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="email" CssClass="validation"
      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
   </fieldset>
      <div class="clear"></div>
      <fieldset>
        <label>Designation<span class="imp">*</span></label>
        <asp:TextBox id="designation" name="designation" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_designation" ControlToValidate="designation" runat="server" ErrorMessage="Please enter the designation." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter the correct designation"  CssClass="validation" ControlToValidate="designation" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>   
       </fieldset>
     <fieldset>
        <label>Message<span class="imp">*</span></label>
         <asp:TextBox id="message" name="message" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_message" ControlToValidate="message" runat="server" ErrorMessage="Please enter the message." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter the correct message"  CssClass="validation" ControlToValidate="message" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
      </fieldset>
      <div class="clear"></div>
       <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />

  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click"/>
  <div ID="new_validation" runat="server"></div>
      </form>
</asp:Content>