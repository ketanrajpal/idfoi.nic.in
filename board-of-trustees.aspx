<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% Session["page"]="board-of-trustees"; %>
<h1>Board of Trustees</h1>
<div class="profile_bg"></div>
<%
    functions a = new functions();
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from category ORDER BY ordern", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %><h2><% Response.Write(dr["name"].ToString()); %></h2><ul class="board-of-trustees clear"><%
        
        cmd = new SqlCommand("select * from board_of_trustees where category='"+dr["id"].ToString()+"'", con);
        SqlDataReader dr1 = cmd.ExecuteReader();
        while (dr1.Read())
        {
            
        %>
        
        <li class="board-detailed"> <img src="<% Response.Write(a.path() +"board_of_trustees/"+ dr1["image"].ToString()); %>" class="bot">
        <div class="profile_div">
          <h3><% Response.Write(dr1["name"].ToString()); %></h3>
          <h4><% Response.Write(dr1["designation"].ToString()); %></h4>
          <span data-id="#<% Response.Write(dr1["id"].ToString()); %>_detailed" class="open_detailed fa fa-chevron-circle-right"></span> </div>
        <div class="detailed" id="<% Response.Write(dr1["id"].ToString()); %>_detailed"> <img src="img/close-detailed.png" class="close" data-id="#<% Response.Write(dr1["id"].ToString()); %>_detailed"> <img src="<% Response.Write(a.path() +"board_of_trustees/"+ dr1["image"].ToString()); %>" class="bot">
          <div class="profile_div">
            <h3><% Response.Write(dr1["name"].ToString()); %></h3>
            <h4><% Response.Write(dr1["designation"].ToString()); %></h4>
            <p><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr1["description"].ToString())); %></p>
          </div>
        </div>
      </li>
        <%
}
        %></ul><%
    }
    con.Close();    
%>
<script>
    $(".open_detailed").click(function () {

        var slug = $(this).attr("data-id");
        $(".profile_bg").fadeIn("fast");
        $(slug).fadeIn("slow");

        $(body).css("opacity", 0.5);

    });

    $(".close").click(function () {

        var slug = $(this).attr("data-id");

        $(slug).fadeOut("fast");
        $(".profile_bg").hide();

    });

    $(document).ready(function () {

        var x = $(window).height();
        var y = $(window).width();
        var imgy = 940;
        var finy = y - imgy;
        $(".detailed").css({
            left: finy / 2
        });

        $(".profile_bg").height(x);
        $(".profile_bg").width(y);

    });
	 
    </script>

</asp:Content>

