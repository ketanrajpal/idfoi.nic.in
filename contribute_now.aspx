<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contribute_now.aspx.cs" Inherits="contribute_now" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1>Contribute Now:</h1>


    <script type="text/javascript">
$(document).ready(function() {
        // Tooltip only Text
        $('.masterTooltip').hover(function(){
                var title = $(this).attr('title');
                $(this).data('tipText', title).removeAttr('title');
                $('<p class="tooltip"></p>')
                .text(title)
                .appendTo('body')
                .fadeIn('slow');
        }, function() {
                $(this).attr('title', $(this).data('tipText'));
                $('.tooltip').remove();
        }).mousemove(function(e) {
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

        function show_field() {
            $(".contribute_field").show();
        }
        function hide_field() {
            $(".contribute_field").hide();
        }

        function submit_form() {

            if (document.getElementById('individual').checked == false && document.getElementById('association').checked == false) {
                alert("Please select what you want to Contribute as?");
                return false;
            } else {
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
            }
        }

    </script>

    <form name="myform" id="myform" method="post" class="feedback" onsubmit="return submit_form()">
        <p>
           <!-- You want to Contribute-->
            <p style="background-color:#ededed;line-height:150%;padding:10px 20px;width:300px;float:right;display:block;">You can contribute as an individual, or a group of individuals or even through your respective Indian Associations</p>
            I want to contribute as: <span class="imp">*</span>
            
        <p>
            <input type="radio" id="individual" name="contribute_as" value="individual" />&nbsp;&nbsp;As Individual<br />
            <input type="radio" id="association" name="contribute_as" value="association" />&nbsp;&nbsp;As Association<br />
            </p>
            <br />


            <fieldset>
                <label>Contribution Amount in INR</label>
            <input type="text" name="amount" id="amount" onkeypress="return isNumberKey(event)" />

            </fieldset>


            <div class="clear"></div>

        <input type="submit" />

    </form>
    <div class="clear"></div>

</asp:Content>

