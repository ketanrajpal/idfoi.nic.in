<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="change_password.aspx.cs" Inherits="change_password" %>
<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Update Password</h1>
        <form class="feedback" name="myform" id="myform_2" runat="server">
    
 <div class="clear"></div>
            <fieldset>
                <label>Old Password</label>
                <asp:TextBox ID="Old_Password" runat="server" TextMode="Password"></asp:TextBox>

            </fieldset>

            <div class="clear"></div>

             <fieldset>
                <label>New Password</label>
                <asp:TextBox ID="New_Password" runat="server" TextMode="Password"></asp:TextBox>
                 <asp:RegularExpressionValidator id="RegularExpressionValidator1"
                   ControlToValidate="New_Password"
                   ValidationExpression="^.{8,16}$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter the 8 to 16 charector"
                     runat="server"/>
            </fieldset>
<fieldset>
                <label>Confirm Password</label>
                <asp:TextBox ID="confirm_password" runat="server" TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="Compare" runat="server" ControlToCompare="New_Password" ControlToValidate="confirm_password" CssClass="validation" ErrorMessage="Please Check the Invalid Password"></asp:CompareValidator>

            </fieldset>


 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="Change_Password" Text="Update" runat="server" onclick="Change_Password_Click" />
     <asp:Label ID="lbl" runat="server" Text="." CssClass="validation"></asp:Label>
 </fieldset>
            
</form>
<style>
table tr{
float:left;
margin-right:10px;
}
table tr label{
display:inline-block !important;
}
</style>
</asp:Content>