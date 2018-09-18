<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <h1>Register</h1>
        <form class="feedback" name="myform" id="myform_2" runat="server">
  <fieldset>
    <label>Title<span class="imp">*</span></label>
    <asp:DropDownList id="title" name="title" runat="server"> </asp:DropDownList>
    <asp:RegularExpressionValidator id="require_title"
                   ControlToValidate="title"
                   ValidationExpression="[A-Za-z]+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a title"
                   runat="server"/>
  </fieldset>
  <div class="clear"></div>
  <fieldset style="width:28%;">
    <label>First Name<span class="imp">*</span></label>
    <asp:TextBox ID="first_name" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="require_first_name" ControlToValidate="first_name" runat="server" ErrorMessage="Please enter the first name." CssClass="validation"></asp:RequiredFieldValidator>
  </fieldset>
  <fieldset style="width:28%;">
    <label>Middle Name</label>
    <asp:TextBox ID="middle_name" runat="server" ></asp:TextBox>
  </fieldset>
  <fieldset style="width:28%;">
    <label>Last Name<span class="imp">*</span></label>
    <asp:TextBox ID="surname" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="require_require_first_name" ControlToValidate="surname" runat="server" ErrorMessage="Please enter the surname." CssClass="validation"></asp:RequiredFieldValidator>
  </fieldset>
  <div class="clear"></div>
  <fieldset>
    <label>Age group</label>
    <asp:DropDownList id="age_group" name="age_group" runat="server">
      <asp:ListItem value="-1">Select your Age group</asp:ListItem>
      <asp:ListItem value="20-30">20-30</asp:ListItem>
      <asp:ListItem value="31-40">31-40</asp:ListItem>
      <asp:ListItem value="41-50">41-50</asp:ListItem>
      <asp:ListItem value="51-60">51-60</asp:ListItem>
      <asp:ListItem value="60-70">60-70</asp:ListItem>
      <asp:ListItem value="70+">70+</asp:ListItem>
    </asp:DropDownList>
  </fieldset>
  <div class="clear"></div>
  <fieldset style="width:100%;">
    <label>Address<span class="imp">*</span></label>
    <asp:TextBox ID="address" runat="server" TextMode="MultiLine" Columns="120" Rows="5"></asp:TextBox>
    <asp:RequiredFieldValidator ID="require_address" ControlToValidate="address" runat="server" ErrorMessage="Please enter the address." CssClass="validation"></asp:RequiredFieldValidator>
  </fieldset>
  <fieldset>
    <label>Mobile/Landline</label>
    <asp:TextBox ID="mobile" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regular_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="Mobile number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation"></asp:RegularExpressionValidator>
  </fieldset>
  <fieldset>
    <label>Email<span class="imp">*</span></label>
    <asp:TextBox ID="email" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="require_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter the email." CssClass="validation"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regular_email" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="email" CssClass="validation"
      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
  </fieldset>
  <fieldset>
    <label>Profession</label>
    <asp:DropDownList id="profession" name="profession" runat="server"></asp:DropDownList>
    
  </fieldset>
  <fieldset>
    <label>Country of Residence<span class="imp">*</span></label>
    <asp:DropDownList id="country_residence" name="country_residence" runat="server"></asp:DropDownList>
    <asp:RegularExpressionValidator id="require_profession"
                   ControlToValidate="country_residence"
                   ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please select your Country of Residence"
                   runat="server"/>
  </fieldset>
  <div class="clear"></div>
  <fieldset>
    <label>Nationality<span class="imp">*</span></label>
    <asp:DropDownList id="nationality" name="nationality" runat="server"></asp:DropDownList>
    <asp:RegularExpressionValidator id="RegularExpressionValidator2"
                   ControlToValidate="nationality"
                   ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please select your Nationality"
                   runat="server"/>
  </fieldset>
  <fieldset>
    <label>Place of Origin in India<span class="imp">*</span></label>
    <asp:DropDownList id="state" name="state" runat="server"></asp:DropDownList>
    <asp:RegularExpressionValidator id="require_state"
                   ControlToValidate="state"
                   ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a state"
                   runat="server"/>
  </fieldset>
  <div class="clear"></div>
  <fieldset style="width:100%;">
    <label>Have you previously contributed to social and development projects in India?</label>
    <asp:RadioButtonList id="previous_contribution" name="previous_contribution" runat="server">
      <asp:ListItem value="Yes">Yes</asp:ListItem>
      <asp:ListItem value="No">No</asp:ListItem>
    </asp:RadioButtonList>
  </fieldset>
  
  <fieldset style="width:100%;">
    <label>Would you like to receive updates from IDF-OI about new Projects available?</label>
    <asp:RadioButtonList id="a_update" name="a_update" runat="server" >
      <asp:ListItem value="Yes">Yes</asp:ListItem>
      <asp:ListItem value="No">No</asp:ListItem>
    </asp:RadioButtonList>
  </fieldset>
  
  <fieldset style="width:100%;">
    <label>Would you like to contribute to a Project identified by IDF-OI?</label>
    <asp:RadioButtonList id="contribute" name="contribute" runat="server" >
      <asp:ListItem value="Yes">Yes</asp:ListItem>
      <asp:ListItem value="No">No</asp:ListItem>
    </asp:RadioButtonList >
  </fieldset>
            <fieldset>
    <label>Your Preferred Sector Contribution </label>
    <asp:DropDownList id="sector" name="sector" runat="server"> </asp:DropDownList>
  </fieldset>
  <fieldset style="width:100%;">
    <label>Would like to contribute a fixed sum to IDF-OI on monthly basis?</label>
    <asp:RadioButtonList id="contribute_monthly" name="contribute_monthly" runat="server">
      <asp:ListItem value="Yes"> Yes</asp:ListItem>
      <asp:ListItem value="No"> No</asp:ListItem>
    </asp:RadioButtonList >
  </fieldset>
  <fieldset>
    <label>If yes, how much?</label>
    <asp:DropDownList id="invest" name="invest" runat="server">
      <asp:ListItem value="-1">select contribution amount</asp:ListItem>
      <asp:ListItem value="$50 - $100"> $50 - $100</asp:ListItem>
      <asp:ListItem value="$100 - $200"> $100 - $200</asp:ListItem>
      <asp:ListItem value="$200 - $300"> $200 - $300</asp:ListItem>
      <asp:ListItem value="$300- $400"> $300- $400</asp:ListItem>
      <asp:ListItem value="$400 - $500"> $400 - $500</asp:ListItem>
      <asp:ListItem value="Above $500"> Above $500</asp:ListItem>
    </asp:DropDownList>
  </fieldset>
  <div class="clear"></div>

            <% if (Session["foo"] == null && Session["register_name"] == null)
                { %>

  <fieldset>
    <label>Password <span class="imp">*</span> </label>
    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RegularExpressionValidator id="RegularExpressionValidator1"
                   ControlToValidate="password"
                   ValidationExpression="^.{8,16}$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter the 8 to 16 charector"
                   runat="server"/>
  </fieldset>
  <fieldset>
    <label>Confirm Password <span class="imp">*</span></label>
    <asp:TextBox ID="confirm_password" runat="server" TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="Compare" runat="server" ControlToCompare="password" ControlToValidate="confirm_password" CssClass="validation" ErrorMessage="Please Reenter the values"></asp:CompareValidator>
  </fieldset>

            <% } %>

  <fieldset>
    <asp:HiddenField ID="action" runat="server" Value="ADD" />
    <asp:HiddenField ID="identity" runat="server" Value="" />
    <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
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
    <script>
    $("#myform").submit(function () {
        hash = CryptoJS.MD5(document.getElementById("content_password").value);
        document.getElementById("content_password").value = hash;
        document.getElementById("content_confirm_password").value = hash;
        return true;
    });

</script>
</asp:Content>