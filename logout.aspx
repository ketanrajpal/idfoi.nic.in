<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="logout.aspx.cs" Inherits="logout" %>
<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>LOGOUT</h1>
        <form class="feedback" name="myform" id="myform_2" runat="server">
    
 <div class="clear"></div>
    
            

 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="logout" runat="server" onclick="submit_Click" />
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