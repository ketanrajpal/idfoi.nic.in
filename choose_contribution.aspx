<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="choose_contribution.aspx.cs" Inherits="choose_contribution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1>Choose your Contribution</h1>

    <script>

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function submit_form() {
            if (document.getElementById('amount').value == "") {
                alert("Please enter the amount.");
                return false;
            } else {

                if (document.getElementById('contribute_as').value == "individual") {
                    window.location = "contribute_individual.aspx?amount=" + document.getElementById('amount').value;
                }
                else {
                    window.location = "contribute_association.aspx?amount=" + document.getElementById('amount').value;
                }
            }
        }

    </script>

    <form name="myform" id="myform" runat="server" class="feedback">
        <fieldset class="state_fieldset">
            <label>Select a State<span class="imp">*</span></label>
            <asp:DropDownList ID="state" runat="server" AutoPostBack="True" onselectedindexchanged="state_dropdown"></asp:DropDownList>
        </fieldset>

        <fieldset class="sector_fieldset">
            <label>Select a Sector<span class="imp">*</span></label>
            <asp:DropDownList ID="sector" runat="server"  AutoPostBack="True" onselectedindexchanged="sector_dropdown"></asp:DropDownList>
        </fieldset>
        <div class="clear"></div>
        
        <h2 id="project_heading" runat="server"></h2>

        <ul class="list" id="show_projects" runat="server" style="list-style:disc !important;"></ul>
    </form>

    <style>

        .donate{
            color:#fff;
            background-color:#ef4036;
            font-size:12px;
            border-radius:2px;
            padding:2px 5px;
            display:none;
            position:absolute;
        }
        .list li:hover .donate {
            display: inline-block;
        }

    </style>

</asp:Content>

