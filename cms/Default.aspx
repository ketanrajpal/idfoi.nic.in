<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<%@ OutputCache Duration="60" VaryByParam="none" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="js/md5.js" type="text/javascript"></script>
</head>
<body class="login">
<section> <img src="img/logo.png" id="logo">
  <h1>Sign in to your CRM account.</h1>
  <form method="post" name="login_form" id="login_form" runat="server">
    <div class="validation" id="new_validation" runat="server"></div>
    <fieldset>
      <label class="fa fa-user"></label>
      <asp:textbox type="text" placeholder="Username/Email" name="username" id="username" runat="server" autocomplete="off"></asp:textbox>
    </fieldset>
    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct Username/Email"  CssClass="validation" ControlToValidate="username" ValidationExpression="[a-z0-9-_@.]*$"></asp:RegularExpressionValidator>
    <fieldset>
      <label class="fa fa-unlock-alt"></label>
      <asp:textbox type="password" placeholder="Password" name="password" id="password" runat="server" autocomplete="off"></asp:textbox></fieldset>
<asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password length must be between 7 to 10 characters"  CssClass="validation" ControlToValidate="password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$"></asp:RegularExpressionValidator>
    <asp:Button ID="submit" Text="Login" runat="server" onclick="submit_Click" />
  </form><script type="text/javascript" language="javascript">   
 $(document).ready(function() {
    if(!(navigator.onLine)) 
    {
    alert("U'r Browser seems to be Offline! \n");
     window.location.href='default.aspx';
    return false;
    }
    else
    {
    
    return true;
    }
});
</script>

  <script>
$(document).ready(function () { $("input").attr("autocomplete", "off"); }); 
      $("#login_form").submit(function () {
          $("#username").parent("fieldset").removeClass("error");
          $("#password").parent("fieldset").removeClass("error");
          if ($("#username").val() == "" && $("#password").val() == "") {
              $("#username").parent("fieldset").addClass("error");
              $("#password").parent("fieldset").addClass("error");
              $("#username").focus();
              $(".validation").html("Please enter the username &amp; password.");
              return false;
          }
          else if ($("#username").val() == "") {
              $("#username").parent("fieldset").addClass("error");
              $("#username").focus();
              $(".validation").html("Please enter your username.");
              return false;
          }
          else if ($("#password").val() == "") {
              $("#password").parent("fieldset").addClass("error");
              $("#password").focus();
              $(".validation").html("Please enter your password.");
              return false;
          }
		  else{
			 hash = CryptoJS.MD5(document.getElementById("password").value);
			 document.getElementById("password").value=hash;
			 return true;
		  }
      });
  </script> 
</section>
</body>
</html>
