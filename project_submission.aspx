<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="project_submission.aspx.cs" Inherits="project_submission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Project Submission</h1>
<form class="feedback" name="myform" id="myform" runat="server">
<label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
  <label>Title<span class="imp">*</span></label>
  <asp:TextBox ID="title" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_title" ControlToValidate="title" runat="server" ErrorMessage="Please enter the title." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter the correct title"  CssClass="validation" ControlToValidate="title" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
 
</fieldset>
 <fieldset>
  <label>Sector<span class="imp">*</span></label>
  <asp:DropDownList id="sector" name="sector" runat="server" autocomplete="off"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_sector"
                   ControlToValidate="sector"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter sector"
                   runat="server"/>
 </fieldset>
<div class="clear"></div>
  <fieldset>
 <label>Location<span class="imp">*</span></label>
  <asp:TextBox ID="location" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_location" ControlToValidate="location" runat="server" ErrorMessage="Please enter the location." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter the correct location"  CssClass="validation" ControlToValidate="location" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
 
</fieldset>
 <fieldset>
  <label>Aim<span class="imp">*</span></label>
  <asp:TextBox ID="aim" runat="server" autocomplete="off"></asp:TextBox>
 <asp:RequiredFieldValidator ID="require_aim" ControlToValidate="aim" runat="server" ErrorMessage="Please enter the aim." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator> 
  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter the correct aim"  CssClass="validation" ControlToValidate="aim" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
 
</fieldset>
 <div class="clear"></div>
  <fieldset>
  <label>Beneficiary<span class="imp">*</span></label>
  <asp:TextBox ID="beneficiary" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_beneficiary" ControlToValidate="beneficiary" runat="server" ErrorMessage="Please enter the beneficiary." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter the correct beneficiary"  CssClass="validation" ControlToValidate="beneficiary" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
 
</fieldset>
 <fieldset>
  <label>Is this a New Project?<span class="imp">*</span></label>
   <asp:DropDownList id="new_project" name="new_project" runat="server" autocomplete="off">
       <asp:ListItem asp:DropDownListed="True" value="-1">Select</asp:ListItem>
       <asp:ListItem Value="1">Yes</asp:ListItem>
       <asp:ListItem Value="0">No</asp:ListItem>
      </asp:DropDownList>
      <asp:RegularExpressionValidator id="require_anew_project"
                   ControlToValidate="new_project"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please select an option"
                   runat="server"/>
 </fieldset>


 <asp:HiddenField Value="31" id="nodal_officer" runat="server" />
<div class="clear"></div>
 <fieldset>
  <label>Implementation Strategy<span class="imp">*</span></label>
  <asp:TextBox ID="implementation_strategy" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_implementation_strategy" ControlToValidate="implementation_strategy" runat="server" ErrorMessage="Please enter the implementation strategy." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter the correct implementation strategy"  CssClass="validation" ControlToValidate="implementation_strategy" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>

 </fieldset>
 <fieldset>
  <label>Expected Benefits<span class="imp">*</span></label>
  <asp:TextBox ID="expected_benefits" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_expected_benefits" ControlToValidate="expected_benefits" runat="server" ErrorMessage="Please enter the expected benefits." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter the correct expected benefits"  CssClass="validation" ControlToValidate="expected_benefits" ValidationExpression="[a-zA-Z0-9-_ ]*$" Display="Dynamic"></asp:RegularExpressionValidator>

</fieldset>
<div class="clear"></div>
 <fieldset>
  <label>Timeline From<span class="imp">*</span></label>
  <asp:TextBox ID="timeline_from" runat="server" CssClass="datepicker" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_timeline_from" ControlToValidate="timeline_from" runat="server" ErrorMessage="Please enter the timeline from." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>

 </fieldset>
 <fieldset>
  <label>Timeline To<span class="imp">*</span></label>
  <asp:TextBox ID="timeline_to" runat="server" CssClass="datepicker" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_timeline_to" ControlToValidate="timeline_to" runat="server" ErrorMessage="Please enter the timeline to." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
 
</fieldset>
<div class="clear"></div>
 <fieldset>
  <label>Budget<span class="imp">*</span></label>
  <asp:TextBox ID="budget" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_budget" ControlToValidate="budget" runat="server" ErrorMessage="Please enter the budget." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="compare_budget" runat="server" Operator="DataTypeCheck" Type="Integer" CssClass="validation" ControlToValidate="budget" ErrorMessage="Value must be a whole number" />
 
</fieldset>
 <fieldset>
  <label>Implementation Agency<span class="imp">*</span></label>
  <asp:DropDownList id="implementation_agency" name="implementation_agency" runat="server" autocomplete="off"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_implementation_agency"
                   ControlToValidate="implementation_agency"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter Implementation Agency"
                   runat="server"/>
 </fieldset>
  <div class="clear"></div>
  <fieldset>
  <label>Per Unit Cost<span class="imp">*</span></label>
  <asp:TextBox ID="per_unit_cost" runat="server" autocomplete="off"></asp:TextBox>
   <asp:RequiredFieldValidator ID="require_per_unit_cost" ControlToValidate="per_unit_cost" runat="server" ErrorMessage="Please enter the per unit cost." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
 <asp:CompareValidator ID="compare_per_unit_cost" runat="server" Operator="DataTypeCheck" Type="Integer" CssClass="validation" ControlToValidate="per_unit_cost" ErrorMessage="Value must be a whole number" />

 </fieldset> 
  <fieldset>
  <label>Capital Cost<span class="imp">*</span></label>
  <asp:TextBox ID="capital_cost" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_capital_cost" ControlToValidate="capital_cost" runat="server" ErrorMessage="Please enter the capital cost." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
 <asp:CompareValidator ID="campare_capital_cost" runat="server" Operator="DataTypeCheck" Type="Integer" CssClass="validation" ControlToValidate="capital_cost" ErrorMessage="Value must be a whole number" />

</fieldset>
   <fieldset>
  <label>Maintenance Cost<span class="imp">*</span></label>
  <asp:TextBox ID="maintenance_cost" runat="server" autocomplete="off"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_maintenance_cost" ControlToValidate="maintenance_cost" runat="server" ErrorMessage="Please enter the maintenance cost." CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="compare_maintenance_cost" runat="server" Operator="DataTypeCheck" Type="Integer" CssClass="validation" ControlToValidate="maintenance_cost" ErrorMessage="Value must be a whole number" />
  
</fieldset>
  <fieldset>
  <label>Image<span class="imp">*</span></label>
  <asp:FileUpload id="image" runat="server" autocomplete="off"/>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter the correct image"  CssClass="validation" ControlToValidate="image" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" Display="Dynamic"></asp:RegularExpressionValidator>

</fieldset>
 <div class="clear"></div>
 <asp:HiddenField Value="0" id="approve" runat="server" />
<asp:HiddenField Value="4" id="project_category" runat="server" />
 <fieldset>
  <label>Project State<span class="imp">*</span></label>
  <asp:DropDownList id="project_state" name="project_state" runat="server" autocomplete="off"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_project_state"
                   ControlToValidate="project_state"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please select Project State"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>Download\Link\Pdf<span class="imp">*</span></label>
  <asp:FileUpload id="link" runat="server" autocomplete="off"/>
   <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Please enter the correct link"  CssClass="validation" ControlToValidate="link" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf)$" Display="Dynamic"></asp:RegularExpressionValidator>

</fieldset><div class="clear"></div>
 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" CssClass="btn" onclick="submit_Click" />
 </fieldset>
</form>

</asp:Content>

