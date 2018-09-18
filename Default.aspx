<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<% 
    
    Session["page"] = "home";
    
    functions a = new functions(); %>
    <div style="padding:20px;border:1px solid #cccccc;padding-right:18px;margin-top:4px;">
<h1 style="margin-top:0px !important;color:#1563a5;"><% Response.Write(a.get_value("heading", "pages", "11")); %><span><% Response.Write(a.get_value("sub_heading", "pages", "11")); %></span></h1>
<% Response.Write(System.Web.HttpUtility.HtmlDecode(a.get_value("description", "pages", "11"))); %><p><br />
    <a style="line-height:200%;color:#ef4036;font-weight:bold;" href="<% Response.Write(a.get_value("link", "pages", "11")); %>" target="_blank"><% Response.Write(a.get_value("link_label", "pages", "11")); %></a></p>
        </div>
    <br>


    <a href="contribute_now.aspx"> <div class="flag_img">
        <img src="../img/contribute-to-pool-fund.jpg" />
        <span>
            <b style="display:block;font-size:14px;font-weight:700;">Not sure which project you want to support?</b><br />Contribute funds to IDF-OI pool fund. The Managing Committee of IDF-OI will disburse funds to projects. You may indicate sector you wish to contribute. The reporting and feedback to donors will remain the same.
        </span>
        </div>
    </a>

   <a href="choose_contribution.aspx"> <div class="flag_img" style="margin-left:15px;">
        <img src="../img/contribute-to-states-india.jpg" />
        <span><br />
            <b style="display:block;font-size:14px;font-weight:700;line-height:150%;">Contribute to the development of your Motherland. Select social and development projects in States of India/Place of your Origin in India.</b>
        </span>
    </div> </a>

    <div class="clear"></div>
    <br />
<a href="choose_contribution.aspx"><h5 style="color:#000;">Select Sector/Project of your choice</h5></a>


    <section id="carolax">

        <article>

            <a href="choose_contribution.aspx?sector=2" class="icon"><img src="../img/education-icon.jpg" /></a>

            <ul>

                <li>
                    <a href="choose_contribution.aspx?state=3&sector=2" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Fans for Govt Schools in Sikkim</div>
                        </a>
                </li>

                <li>
                    <a href="choose_contribution.aspx?state=9&sector=2" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Safe Drinking Water in Govt Schools in Punjab</div>
                        </a>
                </li>

            </ul>

            <a href="choose_contribution.aspx?sector=2" class="read-more-link">Read More <span class="fa fa-play-circle"></span></a>

        </article>


        <article>

            <a href="choose_contribution.aspx?sector=5" class="icon"><img src="../img/women-empowerment-icon.jpg" /></a>

            <ul>

                <li>
                    <a href="choose_contribution.aspx?state=4&sector=5" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Empowerment of Women in Mizoram</div>
                        </a>
                </li>

                <li>
                    <a href="choose_contribution.aspx?state=13&sector=5" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Women & Child care centres in Madhya Pradesh</div>
                        </a>
                </li>

            </ul>

            <a href="choose_contribution.aspx?sector=5" class="read-more-link">Read More <span class="fa fa-play-circle"></span></a>

        </article>

        <article>

            <a href="choose_contribution.aspx?sector=4" class="icon"><img src="../img/sanitation-icon.jpg" /></a>

            <ul>

                <li>
                    <a href="choose_contribution.aspx?state=3&sector=4" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Sanitary Complex in Sikkim<br /><br /></div>
                        </a>
                </li>

                <li>
                    <a href="choose_contribution.aspx?state=11&sector=4" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Solid & Liquid waste management in Karanataka</div>
                        </a>
                </li>

            </ul>

            <a href="choose_contribution.aspx?sector=4" class="read-more-link">Read More <span class="fa fa-play-circle"></span></a>

        </article>



        <article>

            <a href="choose_contribution.aspx?sector=3" class="icon"><img src="../img/healthcare-icon.jpg" /></a>

            <ul>

                <li>
                    <a href="choose_contribution.aspx?state=10&sector=3" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Empower Persons with disabilities in Tamil Nadu</div>
                        </a>
                </li>

                <li>
                    <a href="choose_contribution.aspx?state=10&sector=3" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Establishment of Cancer institute in Rajasthan</div>
                        </a>
                </li>

            </ul>

            <a href="choose_contribution.aspx?sector=3" class="read-more-link">Read More <span class="fa fa-play-circle"></span></a>

        </article>

        <article>

            <a href="choose_contribution.aspx?sector=7" class="icon"><img src="../img/sustainable-icon.jpg" /></a>

            <ul>

                <li>
                    <a href="choose_contribution.aspx?state=3&sector=4" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Strenthen ITI's in Madhya Pradesh</div>
                        </a>
                </li>

                <li>
                    <a href="choose_contribution.aspx?state=11&sector=4" class="clear">
                    <div><img src="../img/arrow-new.png" /></div>
                    <div>Livestock production for self heep group in Mizoram</div>
                        </a>
                </li>

            </ul>

            <a href="choose_contribution.aspx?sector=7" class="read-more-link">Read More <span class="fa fa-play-circle"></span></a>

        </article>

    </section>


    <script>$(document).ready(function () {    $("#carolax").bxSlider({
        minSlides: 2,
        maxSlides: 3,
        moveSlides: 1,
    slideWidth: 210,
    slideMargin: 10,
    slideSelector: 'article',
    pager: false,
    controls:true
    });
});</script>


</asp:Content>