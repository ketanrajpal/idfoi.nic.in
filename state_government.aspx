<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="state_government.aspx.cs" Inherits="state_government" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>For Project Submission</h1>
<form class="form feedback" name="myform" id="myform" runat="server">

<fieldset>
   <label for='category'>Select category to which you belong<span class="imp">*</span></label>
      <asp:DropDownList id="category" name="category" runat="server" autocomplete="off">
       </asp:DropDownList>
       <asp:RegularExpressionValidator id="require_category"
                   ControlToValidate="category"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter category"
                   runat="server"/>
        </fieldset>
         <fieldset>
      <label for="address">Address for Correspondence<span class="imp">*</span></label>
      <asp:TextBox id="address" name="address" runat="server" autocomplete="off"></asp:TextBox>
      <asp:RequiredFieldValidator ID="require_address" ControlToValidate="address" runat="server" ErrorMessage="Please enter the address." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct address"  CssClass="validation" ControlToValidate="address" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
    </fieldset>
    <div class="clear"></div>
    <asp:Button ID="submit" Text="Next" runat="server" onclick="submit_Click"/>

        </form>
</asp:Content>

