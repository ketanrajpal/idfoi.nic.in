<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editprofile.aspx.cs" Inherits="Editprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <h1>Editprofile</h1>
        <form class="feedback" name="myform" id="myform_2" runat="server">
  <fieldset>
  <label>Title<span class="imp">*</span></label>
  <asp:DropDownList id="title" name="title" runat="server">
       </asp:DropDownList>
       <asp:RegularExpressionValidator id="require_title"
                   ControlToValidate="title"
                   ValidationExpression="[A-Za-z]+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a title"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>First Name<span class="imp">*</span></label>
  <asp:TextBox ID="first_name" runat="server"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_first_name" ControlToValidate="first_name" runat="server" ErrorMessage="Please enter the first name." CssClass="validation"></asp:RequiredFieldValidator>
 </fieldset> 
              <fieldset>
  <label>Middle Name</label>
  <asp:TextBox ID="middle_name" runat="server" ></asp:TextBox>
 </fieldset>  
 <div class="clear"></div>
 <fieldset>
  <label>Surname<span class="imp">*</span></label>
  <asp:TextBox ID="surname" runat="server"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_require_first_name" ControlToValidate="surname" runat="server" ErrorMessage="Please enter the surname." CssClass="validation"></asp:RequiredFieldValidator>
 </fieldset>
  <fieldset>
  <label>Age group</label>
 <asp:DropDownList id="age_group" name="age_group" runat="server">
       <asp:ListItem asp:DropDownListed="True" value="-1">Select your Age group</asp:ListItem>
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
  <asp:TextBox ID="address" runat="server" TextMode="MultiLine" Columns="120" Rows="10"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_address" ControlToValidate="address" runat="server" ErrorMessage="Please enter the address." CssClass="validation"></asp:RequiredFieldValidator>
 </fieldset>
  <fieldset>
  <label>Landline</label>
  <asp:TextBox ID="landline" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="regular_landline" runat="server" ControlToValidate="landline" ErrorMessage="Phone number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
  <label>Mobile</label>
  <asp:TextBox ID="mobile" runat="server"></asp:TextBox>
  <asp:RegularExpressionValidator ID="regular_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="Mobile number is not valid"  ValidationExpression="[0-9]{10}" CssClass="validation"></asp:RegularExpressionValidator>
 </fieldset>
  <fieldset>
  <label>Email<span class="imp">*</span></label>
  <asp:TextBox ID="email" runat="server" ReadOnly="true"></asp:TextBox>
   <asp:RequiredFieldValidator ID="require_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter the email." CssClass="validation"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="regular_email" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="email" CssClass="validation"
      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
 </fieldset>
  <fieldset>
  <label>Profession</label>
  <asp:DropDownList id="profession" name="profession" runat="server"></asp:DropDownList>
   <asp:RegularExpressionValidator id="require_profession"
                   ControlToValidate="profession"
                   ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a profession"
                   runat="server"/>
 </fieldset>
 <div class="clear"></div>
   <fieldset>
  <label>Organization</label>
  <asp:TextBox ID="organization" runat="server"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_organization" ControlToValidate="organization" runat="server" ErrorMessage="Please enter the organization." CssClass="validation"></asp:RequiredFieldValidator>
 </fieldset>
 <fieldset>
  <label>Country of Residence<span class="imp">*</span></label>
  <asp:DropDownList id="country_residence" name="country_residence" runat="server"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_country_residence"
                   ControlToValidate="country_residence"
                   ValidationExpression="^([a-zA-Z0-9 '-_&,()\.])+$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a country residence"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>State of Organization in Indiad<span class="imp">*</span></label>
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
 <fieldset>
  <label>Area Of Interest</label>
   <asp:DropDownList id="area_of_interest" name="area_of_interest" runat="server"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_area_of_interest"
                   ControlToValidate="area_of_interest"
                   ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter areas of interest"
                   runat="server"/>
 </fieldset>
 
  <fieldset style="width:100%;">
  <label>Have you previously contributed to social and development projects in India<span class="imp">*</span></label>
   <asp:RadioButtonList id="previous_contribution" name="previous_contribution" runat="server">
   
        <asp:ListItem value="Yes">Yes</asp:ListItem>
        <asp:ListItem value="No">No</asp:ListItem>
        </asp:RadioButtonList >
        <asp:RegularExpressionValidator id="require_previous_contribution"
                   ControlToValidate="previous_contribution"
                   ValidationExpression="[A-Za-z]+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter previous contribution"
                   runat="server"/>
 </fieldset>
  <fieldset>
  <label>Sector of Your Contribution </label>
   <asp:DropDownList id="sector" name="sector" runat="server">
   
         </asp:DropDownList>          
        <asp:RegularExpressionValidator id="require_sector"
                   ControlToValidate="sector"
                   ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter sector"
                   runat="server"/>
   </fieldset>
   <fieldset>
  <label>How often do you visit India</label>
  <asp:DropDownList id="visit_india" name="visit_india" runat="server">
  <asp:ListItem value="-1">How often you visit</asp:ListItem>
        <asp:ListItem value="Once in six months"> Once in six months</asp:ListItem>
        <asp:ListItem value="Once in a year"> Once in a year </asp:ListItem>
        <asp:ListItem value="Once in 2 years"> Once in 2 years</asp:ListItem>
        <asp:ListItem value="Once in 3-5 years"> Once in 3-5 years </asp:ListItem>
        <asp:ListItem value="Not visited in 5-10 years"> Not visited in 5-10 years </asp:ListItem>
       </asp:DropDownList>
       
     
   </fieldset>
   <fieldset style="width:100%;">
  <label>Would you like to receive updates from IDF-OI about new Projects available</label>
  <asp:RadioButtonList id="a_update" name="a_update" runat="server">
   
   <asp:ListItem value="Yes">Yes</asp:ListItem>
        <asp:ListItem value="No">No</asp:ListItem>
        </asp:RadioButtonList >
         </fieldset>
          <asp:RegularExpressionValidator id="require_a_update"
                   ControlToValidate="a_update"
                   ValidationExpression="[A-Za-z]+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter update"
                   runat="server"/>
  
   <fieldset style="width:100%;">
  <label>Would you like to contribute to a Project identified by IDF-OI<span class="imp">*</span> </label>
<asp:DropDownList id="contribute" name="contribute" runat="server">
<asp:ListItem value="-1">select contribute</asp:ListItem>
 <asp:ListItem value="As Individual"> As Individual</asp:ListItem>
        <asp:ListItem value="Through an Association "> Through an Association </asp:ListItem>
        <asp:ListItem value="As a Group of Individuals"> As a Group of Individuals </asp:ListItem>
        </asp:DropDownList>
         
 </fieldset>
  <fieldset>
  <label>Would like to contribute a fixed sum to IDF-OI on monthly basis </label>
<asp:RadioButtonList id="contribute_monthly" name="contribute_monthly" runat="server">

 <asp:ListItem value="Yes"> Yes</asp:ListItem>
        <asp:ListItem value="No"> No</asp:ListItem>
        </asp:RadioButtonList >
    
 </fieldset>
 <fieldset>
  <label>If yes, how much<span class="imp">*</span> </label>
<asp:DropDownList id="invest" name="invest" runat="server">
<asp:ListItem value="-1">select your contribution</asp:ListItem>
 <asp:ListItem value="$50 - $100"> $50 - $100</asp:ListItem>
        <asp:ListItem value="$100 - $200"> $100 - $200</asp:ListItem>
        <asp:ListItem value="$200 - $300"> $200 - $300</asp:ListItem>
        <asp:ListItem value="$300- $400"> $300- $400</asp:ListItem>
        <asp:ListItem value="$400 - $500"> $400 - $500</asp:ListItem>
        <asp:ListItem value="Above $500"> Above $500</asp:ListItem>
        </asp:DropDownList>
       </fieldset>
 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="Editpro" Text=" Edit " runat="server" onclick="Editpro_Click" />
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