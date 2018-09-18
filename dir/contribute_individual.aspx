<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="contribute_individual.aspx.cs" Inherits="contribute_individual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        // Tooltip only Text
        $('.masterTooltip').hover(function () {
            var title = $(this).attr('title');
            $(this).data('tipText', title).removeAttr('title');
            $('<p class="tooltip"></p>')
                 .text(title)
                 .appendTo('body')
                 .fadeIn('slow');
        }, function () {
            $(this).attr('title', $(this).data('tipText'));
            $('.tooltip').remove();
        }).mousemove(function (e) {
            var mousex = e.pageX + 20; //Get X coordinates
            var mousey = e.pageY + 10; //Get Y coordinates
            $('.tooltip')
                 .css({ top: mousey, left: mousex })
        });
    });

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }

//    function show_field() {
//        $(".contribute_field").show();
//    }
//    function hide_field() {
//        $(".contribute_field").hide();
//    }

    function submit_form() {

        if (document.getElementById('idfoipool').checked == false && document.getElementById('specific').checked == false) {
            alert("Please select where do you want to contribute.");
            return false;
        } else if (document.getElementById('individual').checked == false && document.getElementById('association').checked == false) {
            alert("Please select what you want to Contribute as?");
            return false;
        } else {
            if (document.getElementById('idfoipool').checked) {
                if (document.getElementById('amount').value == "") {
                    alert("Please enter the amount you want to contribute.");
                    return false;
                }
                else {
                    if (document.getElementById('individual').checked) {
                        document.myform.action = "contribute_individual.aspx?amount=" + document.getElementById('amount').value;
                    }
                    else if (document.getElementById('association').checked) {
                        document.myform.action = "contribute_association.aspx?amount=" + document.getElementById('amount').value;
                    }
                }
            } else if (document.getElementById('specific').checked) {
                if (document.getElementById('individual').checked) {
                    document.myform.action = "choose_contribution.aspx?contribute=individual";
                }
                else if (document.getElementById('association').checked) {
                    document.myform.action = "choose_contribution.aspx?contribute=association";
                }
            }
        }
    }

    </script>
    <script type="text/javascript">
        function validationCheck() {
            var validate = true;
            if ($("#<%= individual_first_name.ClientID %>").val() == "") {
                $("#spnFirstName").show();
                validate = false;
            }
            else {
                $("#spnFirstName").hide();
            }

            if ($("#<%= individual_last_name.ClientID %>").val() == "") {
                $("#spnLastName").show();
                validate = false;
            }
            else {
                $("#spnLastName").hide();
            }

            if ($("#<%= individual_email_address.ClientID %>").val() == "") {
                $("#spnEmail").show();
                validate = false;
            }
            else {
                var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
                if (pattern.test($("#<%= individual_email_address.ClientID %>").val()) == false) {
                    $("#spnEmail").html("Please enter proper Email Address");
                    $("#spnEmail").show();
                    validate = false;
                }
                else {
                    $("#spnEmail").hide();
                }
            }

            if ($("#<%= individual_country_residence.ClientID %> option:selected").val() == "-1") {
                $("#spnCountryResidence").show();
                validate = false;
            }
            else {
                $("#spnCountryResidence").hide();
            }

            if ($("#<%= individual_state.ClientID %> option:selected").val() == "-1") {
                $("#spnState").show();
                validate = false;
            }
            else {
                $("#spnState").hide();
            }

//            if ($("#<%= indian.ClientID %>").val() == "") {
//                $("#spnindian").show();
//                validate = false;
//            }
//            else {
//                $("#spnindian").hide();
//            }

            if ($("#<%= Foreingn.ClientID %>").val() == "") {
                $("#spnForeingn").show();
                validate = false;
            }
            else {
                $("#spnForeingn").hide();
            }

            if ($("#<%= individual_verification_no.ClientID %>").val() == "") {
                $("#spnindividual_verification_no").show();
                validate = false;
            }
            else {
                $("#spnindividual_verification_no").hide();
            }

            return validate;
        }
    </script>

    
    <h1>
        Registration Form For an Overseas Indian</h1>
    <asp:Panel ID="pnlBody" runat="server">
        <form name="myform" id="myform" runat="server" class="feedback">
        <fieldset style="width: 28%;">
            <label>
                First Name<span class="imp">*</span></label>
            <asp:TextBox ID="individual_first_name" runat="server"></asp:TextBox>
            <span id="spnFirstName" style="font-size:small;color:Red;display:none;">Please enter your First Name</span>
            <%--<asp:RequiredFieldValidator ID="require_first_name" ControlToValidate="individual_first_name"
                runat="server" ErrorMessage="Please enter your first name." CssClass="validation"></asp:RequiredFieldValidator>--%>
        </fieldset>
        <fieldset style="width: 28%;">
            <label>
                Middle Name</label>
            <asp:TextBox ID="individual_middle_name" runat="server"></asp:TextBox>
        </fieldset>
        <fieldset style="width: 28%;">
            <label>
                Last Name<span class="imp">*</span></label>
            <asp:TextBox ID="individual_last_name" runat="server"></asp:TextBox>
            <span id="spnLastName" style="font-size:small;color:Red;display:none;">Please enter your Last Name</span>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="individual_last_name"
                runat="server" ErrorMessage="Please enter your last name." CssClass="validation"></asp:RequiredFieldValidator>--%>
        </fieldset>
        <div class="clear">
        </div>
        <fieldset>
            <label>
                Email Address<span class="imp">*</span></label>
            <asp:TextBox ID="individual_email_address" runat="server"></asp:TextBox>
            <span id="spnEmail" style="font-size:small;color:Red;display:none;">Please enter your Email Address</span>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="individual_email_address"
                runat="server" ErrorMessage="Please enter your email address." CssClass="validation"></asp:RequiredFieldValidator>--%>
            <%--<asp:RegularExpressionValidator ID="regular_email" runat="server" ErrorMessage="Please Enter Valid Email ID"
                ControlToValidate="individual_email_address" CssClass="validation" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
        </fieldset>
        <fieldset>
            <label>
                Nationality<span class="imp">*</span></label>
            <asp:DropDownList ID="individual_country_residence" name="country_residence" runat="server">
            </asp:DropDownList>
            <span id="spnCountryResidence" style="font-size:small;color:Red;display:none;">Please select your Nationality</span>
            <%--<asp:RegularExpressionValidator ID="require_state" ControlToValidate="individual_country_residence"
                ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$" Display="Static" EnableClientScript="true"
                CssClass="validation" ErrorMessage="Please select your country of residence."
                runat="server" />--%>
        </fieldset>
        <div class="clear">
        </div>
        <fieldset>
            <label>
                Place of Origin in India<span class="imp">*</span></label>
            <asp:DropDownList ID="individual_state" name="state" runat="server">
            </asp:DropDownList>
            <span id="spnState" style="font-size:small;color:Red;display:none;">Please select your State</span>
            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="individual_state"
                ValidationExpression="^[a-zA-Z][a-zA-Z\s]+$" Display="Static" EnableClientScript="true"
                CssClass="validation" ErrorMessage="Please select your the state of origin."
                runat="server" />--%>
        </fieldset>
       
        <fieldset>
            <label>
                Are You :</label>
            <input type="radio" id="individual" name="contribute_Residend" value="individual" checked="checked"
                onclick="show_field()" />A Non Resident Indian<br />
            <input type="radio" id="association" name="contribute_Residend" value="association"
                onclick="show_field()" />A Person of Indian Origin<br />
        </fieldset>
        
        <fieldset style="display:none;">
            <label>
                Please Enter Your Foreign Passport No. or OCI Card No<span class="imp">*</span></label>
            <asp:TextBox ID="indian" runat="server"></asp:TextBox>
            <span id="spnindian" style="font-size:small;color:Red;display:none;">Please enter Your Foreign Passport No. or OCI Card No.</span>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="indian"
                runat="server" ErrorMessage="Please enter Your Foreign Passport No. or OCI Card No." CssClass="validation"></asp:RequiredFieldValidator>--%>
        </fieldset>
        <fieldset>
            <label>
                Please Enter Your Foreign Passport No. or OCI Card No.<span class="imp">*</span></label>
            <asp:TextBox ID="Foreingn" runat="server"></asp:TextBox>
            <span id="spnForeingn" style="font-size:small;color:Red;display:none;">Please enter Your Foreign Passport No. or OCI Card No.</span>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Foreingn"
                runat="server" ErrorMessage="Please enter Your Foreign Passport No. or OCI Card No." CssClass="validation"></asp:RequiredFieldValidator>--%>
        </fieldset>
        <!--</fieldset>
        <input type="radio" id="specific" name="con_method" value="specific" onclick="hide_field()" />
        <input type="radio" id="specifics" name="con_method" value="specific" onclick="hide_field()" />
        <div class="clear"></div>-->
        <fieldset>
            <label>
                Verification No<span class="imp">*</span></label>
            <asp:TextBox ID="individual_verification_no" runat="server"></asp:TextBox>
            <span id="spnindividual_verification_no" style="font-size:small;color:Red;display:none;">Please enter Your Verification No.</span>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="individual_verification_no"
                runat="server" ErrorMessage="Please enter your verification id." CssClass="validation"></asp:RequiredFieldValidator>--%>
        </fieldset>
        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" />
        <div class="clear">
        </div>
        <asp:Button Text="Submit" ID="submit" runat="server" OnClientClick="return validationCheck();" OnClick="submit_Click" />
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
</asp:Content>
