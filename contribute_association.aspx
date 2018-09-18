<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="contribute_association.aspx.cs" Inherits="contribute_association" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        li
        {
            list-style-type: none !important;
        }
    </style>
    <h1>
        Registration Form For Indian Associations</h1>
    <asp:Panel ID="pnlBody" runat="server">
        <form id="myform" name="myform" runat="server" class="feedback">
        <fieldset style="width: 100%">
            <label>
                Complete name of the Association<span class="imp">*</span></label>
            <asp:TextBox ID="association_name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="require_first_name" ControlToValidate="association_name"
                runat="server" ErrorMessage="Please enter the name of the association." CssClass="validation"></asp:RequiredFieldValidator>
        </fieldset>
        <fieldset style="width: 100%">
            <label>
                Complete name of President/Chief Official<span class="imp">*</span></label>
        </fieldset>
        <fieldset style="width: 28%;">
            <label>
                First Name<span class="imp">*</span></label>
            <asp:TextBox ID="association_first_name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="association_first_name"
                runat="server" ErrorMessage="Please enter your first name." CssClass="validation"></asp:RequiredFieldValidator>
        </fieldset>
        <fieldset style="width: 28%;">
            <label>
                Middle Name</label>
            <asp:TextBox ID="association_middle_name" runat="server"></asp:TextBox>
        </fieldset>
        <fieldset style="width: 28%;">
            <label>
                Last Name<span class="imp">*</span></label>
            <asp:TextBox ID="association_last_name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="association_last_name"
                runat="server" ErrorMessage="Please enter your last name." CssClass="validation"></asp:RequiredFieldValidator>
        </fieldset>
        <div class="clear">
        </div>
        <fieldset>
            <label>
                Are you a registered organisation?</label>
            <asp:DropDownList ID="registered_organization" runat="server">
                <asp:ListItem Value="-1" Selected="True">Select an option</asp:ListItem>
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="registered_organization"
                runat="server" ErrorMessage="Please select an option." CssClass="validation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator" ControlToValidate="registered_organization"
                ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$" Display="Static" EnableClientScript="true"
                CssClass="validation" ErrorMessage="Please select an option." runat="server" />
        </fieldset>
        <fieldset>
            <label>
                If Yes,Plese Enter the Registration Number</label>
            <asp:TextBox ID="registration_number" runat="server"></asp:TextBox>
        </fieldset>
        <div class="clear">
        </div>
        <fieldset>
            <label>
                Where is the Organisation Located?</label>
            <asp:DropDownList ID="association_country_residence" runat="server">
            </asp:DropDownList>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="association_country_residence"
                ValidationExpression="^([a-zA-Z0-9 '-_&,()\.])+$" Display="Static" EnableClientScript="true"
                CssClass="validation" ErrorMessage="Please select your proof of verification."
                runat="server" />
        </fieldset>
        <fieldset>
            <label>
                Select Verification Proof<span class="imp">*</span></label>
            <asp:DropDownList ID="association_verification_proof" runat="server">
                <asp:ListItem Value="-1" Selected="True">Select an option</asp:ListItem>
                <asp:ListItem Value="passport_no">Passport No</asp:ListItem>
                <asp:ListItem Value="oci_card_no">OCI Card No</asp:ListItem>
                <asp:ListItem Value="pio_card_no">PIO Card No</asp:ListItem>
            </asp:DropDownList>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="association_verification_proof"
                ValidationExpression="^([a-zA-Z0-9 '-_&,()\.])+$" Display="Static" EnableClientScript="true"
                CssClass="validation" ErrorMessage="Please select your Passport No./OCI/PIO Card No?"
                runat="server" />
        </fieldset>
        <fieldset>
            <label>
                Verification No<span class="imp">*</span></label>
            <asp:TextBox ID="association_verification_no" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="association_verification_no"
                runat="server" ErrorMessage="Please enter your email address." CssClass="validation"></asp:RequiredFieldValidator>
        </fieldset>
        <fieldset>
            <label>
                Email Address<span class="imp">*</span></label>
            <asp:TextBox ID="association_email_address" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="association_email_address"
                runat="server" ErrorMessage="Please enter your email address." CssClass="validation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regular_email" runat="server" ErrorMessage="Please Enter Valid Email ID"
                ControlToValidate="association_email_address" CssClass="validation" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </fieldset>
        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" />
        <asp:Button Text="Submit" ID="submit" runat="server" OnClick="submit_Click" />
        </form>
    </asp:Panel>
    <table id="tbl_PaymentGateway" cellpadding="0" cellspacing="0" runat="server" visible="false">
        <tr>
            <td align="center">
                <asp:Literal ID="ltBody" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <style>
        select
        {
            width: 98%;
        }
    </style>

    <br /><br /><br />
    <p style="background-color:#f5f5f5;padding:10px;border:1px solid #ededed;">
        <b>Why should I give my Passport No./OCI/PIO Card No?</b>
        <br /><br />IDF-OI requires the Passport/OCI/PIO card number to ensure that the contributions are coming from a NRI/PIO. As the contribution is exempt from the Foreign Contribution Regulation Act (FCRA), IDF-OI is required to keep maintain the passport/ OCI/PIO card details of NRIs who contribute online through IDF-OI. IDF-OI will not share your personal details with any other third party.
</p>


</asp:Content>
