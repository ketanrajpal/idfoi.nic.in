<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>Recent Outreach Events</h1>
<%
    functions a = new functions();
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from media where media_category='3' ORDER BY CONVERT(DateTime, event_date,101)  DESC", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %>
        <ul class="events" class="clear">
   <li><span class="fa fa-calendar"></span></li>
   <li><p><% Response.Write(dr["title"].ToString()); %></p></li>
  </ul>
  <div class="clear"></div>
  <br><br><%
    }
    con.Close();    
%>


</asp:Content>

