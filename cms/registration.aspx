<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
    <a href="registration.aspx" class="detail_but">View Details</a><a href="registration.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Registration </h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>First Name</td>
  <td>address</td>
  <td>landline</td>
  
<td>Country Residence</td>
  <td>Update</td>
  
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from registration", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["first_name"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["address"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["landline"].ToString())); %></td>
         
<td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["country_residence"].ToString())); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
  <td>First Name</td>
  <td>address</td>
  <td>landline</td>
  
<td>Country Residence</td>
  <td>Update</td>
  
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
  <label>Titile<span class="imp">*</span></label>
  <asp:DropDownList id="title" name="title" runat="server" autocomplete="off">
       </asp:DropDownList>
 </fieldset>
 <fieldset>
  <label>First Name<span class="imp">*</span></label>
  <asp:TextBox ID="first_name" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_first_name" ControlToValidate="first_name" runat="server" ErrorMessage="Please enter the first name." CssClass="validation"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct first name"  CssClass="validation" ControlToValidate="first_name" ValidationExpression="[a-zA-Z0-9-_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
 <fieldset>
  <label>Surname<span class="imp">*</span></label>
  <asp:TextBox ID="surname" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_require_first_name" ControlToValidate="surname" runat="server" ErrorMessage="Please enter the surname." CssClass="validation"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct surname"  CssClass="validation" ControlToValidate="surname" ValidationExpression="[a-zA-Z0-9-_ ]*$"></asp:RegularExpressionValidator>
 </fieldset>
  <fieldset>
  <label>Age group<span class="imp">*</span></label>
 <asp:DropDownList id="age_group" name="age_group" runat="server" autocomplete="off">
       <asp:ListItem asp:DropDownListed="True" value="-1">Select your Age group</asp:ListItem>
        <asp:ListItem value="20-30">20-30</asp:ListItem>
        <asp:ListItem value="31-40">31-40</asp:ListItem>
        <asp:ListItem value="41-50">41-50</asp:ListItem>
        <asp:ListItem value="51-60">51-60</asp:ListItem>
        <asp:ListItem value="60-70">60-70</asp:ListItem>
        <asp:ListItem value="70+">70+</asp:ListItem>
       </asp:DropDownList>
 </fieldset>
 <fieldset>
  <label>Address<span class="imp">*</span></label>
  <asp:TextBox ID="address" runat="server" TextMode="MultiLine" Columns="120" Rows="10" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_address" ControlToValidate="address" runat="server" ErrorMessage="Please enter the address." CssClass="validation"></asp:RequiredFieldValidator>
 </fieldset>
  <fieldset>
  <label>Landline<span class="imp">*</span></label>
  <asp:TextBox ID="landline" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_landline" ControlToValidate="landline" runat="server" ErrorMessage="Please enter the landline." CssClass="validation"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter the correct landline"  CssClass="validation" ControlToValidate="landline" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
</fieldset>
 <fieldset>
  <label>mobile<span class="imp">*</span></label>
  <asp:TextBox ID="mobile" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_mobile" ControlToValidate="mobile" runat="server" ErrorMessage="Please enter the mobile." CssClass="validation"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter the correct mobile"  CssClass="validation" ControlToValidate="mobile" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
 </fieldset>
  <fieldset>
  <label>Email<span class="imp">*</span></label>
  <asp:TextBox ID="email" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter the email." CssClass="validation"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter the correct email"  CssClass="validation" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
 </fieldset>
  <fieldset>
  <label>Profession<span class="imp">*</span></label>
  <asp:DropDownList id="profession" name="profession" runat="server" autocomplete="off"></asp:DropDownList>
   <asp:RegularExpressionValidator Display="Dynamic" id="require_profession"
                   ControlToValidate="profession"
                   ValidationExpression="\d+"
                   
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a profession"
                   runat="server"/>
 </fieldset>
   <fieldset>
  <label>Organization<span class="imp">*</span></label>
  <asp:TextBox ID="organization" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator Display="Dynamic" ID="require_organization" ControlToValidate="organization" runat="server" ErrorMessage="Please enter the organization." CssClass="validation"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter the correct organization"  CssClass="validation" ControlToValidate="organization" ValidationExpression="[a-zA-Z0-9-_ ]*$"></asp:RegularExpressionValidator>
</fieldset>
 <fieldset>
  <label>Country Residence<span class="imp">*</span></label>
  <asp:DropDownList id="country_residence" name="country_residence" runat="server" autocomplete="off"></asp:DropDownList>
  <asp:RegularExpressionValidator Display="Dynamic" id="require_country_residence"
                   ControlToValidate="country_residence"
                   ValidationExpression="\d+"
                   
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a country residence"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>State<span class="imp">*</span></label>
  <asp:DropDownList id="state" name="state" runat="server" autocomplete="off"></asp:DropDownList>
  <asp:RegularExpressionValidator Display="Dynamic" id="require_state"
                   ControlToValidate="state"
                   ValidationExpression="\d+"
                   
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter a state"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>Area Of Interest<span class="imp">*</span></label>
   <asp:DropDownList id="area_of_interest" name="area_of_interest" runat="server" autocomplete="off"></asp:DropDownList>
  <asp:RegularExpressionValidator Display="Dynamic" id="require_area_of_interest"
                   ControlToValidate="area_of_interest"
                   ValidationExpression="\d+"
                   
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter areas of interest"
                   runat="server"/>
 </fieldset>
 
  <fieldset>
  <label>Have you previously contributed to social and development projects in India<span class="imp">*</span></label>
   <asp:DropDownList id="previous_contribution" name="previous_contribution" runat="server" autocomplete="off">
   <asp:ListItem value="-1">select contribution</asp:ListItem>
        <asp:ListItem value="1">Yes</asp:ListItem>
        <asp:ListItem value="0">No</asp:ListItem>
        </asp:DropDownList>
 </fieldset>
  <fieldset>
  <label>Sector<span class="imp">*</span></label>
   <asp:DropDownList id="sector" name="sector" runat="server" autocomplete="off">
   
         </asp:DropDownList>          
        
   </fieldset>
   <fieldset>
  <label>Would you like to receive updates from IDF-OI about new Projects available<span class="imp">*</span></label>
  <asp:DropDownList id="a_update" name="a_update" runat="server" autocomplete="off">
   <asp:ListItem value="-1">Select updates</asp:ListItem>
   <asp:ListItem value="1">Yes</asp:ListItem>
        <asp:ListItem value="0">No</asp:ListItem>
        </asp:DropDownList>
         </fieldset>

  <fieldset>
  <label>How often do you visit India<span class="imp">*</span></label>
  <asp:DropDownList id="visit_india" name="visit_india" runat="server" autocomplete="off">
  <asp:ListItem value="-1">How often you visit</asp:ListItem>
        <asp:ListItem value="Once in six months"> Once in six months</asp:ListItem>
        <asp:ListItem value="Once in a year"> Once in a year </asp:ListItem>
        <asp:ListItem value="Once in 2 years"> Once in 2 years</asp:ListItem>
        <asp:ListItem value="Once in 3-5 years"> Once in 3-5 years </asp:ListItem>
        <asp:ListItem value="Not visited in 5-10 years"> Not visited in 5-10 years </asp:ListItem>
       
 
                   </asp:DropDownList>
 </fieldset>
   <fieldset>
  <label>Would you like to contribute to a Project identified by IDF-OI<span class="imp">*</span> </label>
<asp:DropDownList id="contribute" name="contribute" runat="server" autocomplete="off">
<asp:ListItem value="-1">select contribute</asp:ListItem>
 <asp:ListItem value="As Individual"> As Individual</asp:ListItem>
        <asp:ListItem value="Through an Association "> Through an Association </asp:ListItem>
        <asp:ListItem value="As a Group of Individuals"> As a Group of Individuals </asp:ListItem>

  
                   </asp:DropDownList>
 </fieldset>
 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
 </fieldset>
</form>
<% } %>
</asp:Content>
