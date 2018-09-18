<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Login</h1>
    <p>Please enter your email and password below.</p>
        <form class="feedback" name="myform" id="myform_2" runat="server">
    
            <fieldset>

            

                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV1" runat="server" 
                                ControlToValidate="txtEmail" 
                                ErrorMessage="Please Enter Email" CssClass="validation" 
                                SetFocusOnError="True">
    </asp:RequiredFieldValidator>
            
</fieldset>           
            <div class="clear"></div> 
            <fieldset>
                <label>Password</label>
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtpwd" 
                                ErrorMessage="Please Enter Password" CssClass="validation" 
                                SetFocusOnError="True">
    </asp:RequiredFieldValidator>
                </fieldset> <div class="clear"></div> 
  <asp:Button ID="loginpage" Text="Login" runat="server" onclick="loginpage_Click" />
     <asp:Label ID="lbl" runat="server" Text="."></asp:Label>
            
</form>
</asp:Content>