<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="logout.aspx.cs" Inherits="logout" %>
<script runat="server">


</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("input[name='chkPassPort']").click(function () {
            if ($("#chkYes").is(":checked")) {
                $("#dvPassport").show();
            } else {
                $("#dvPassport").hide();
            }
        });
    });
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>LOGOUT</h1>
        <form class="feedback" name="myform" id="myform_2" runat="server">
    <span>Do you have Passport?</span>
<label for="chkYes">
    <input type="radio" id="chkYes" name="chkPassPort" />
    Yes
</label>
<label for="chkNo">
    <input type="radio" id="chkNo" name="chkPassPort" />
    No
</label>
<hr />
<div id="dvPassport" style="display: none">
    Passport Number:
    <input type="text" id="txtPassportNumber" />
</div>
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