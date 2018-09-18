<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="india-inspires">

<h1>India Inspired</h1>

<%
    functions a = new functions();
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from media where media_category='4' ORDER BY event_date", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %><li>   
    <a href="<% Response.Write(dr["link"].ToString()); %>" target="_blank"><% Response.Write(dr["title"].ToString()); %></a>
    <span class="date"><% Response.Write(dr["sub_heading"].ToString()); %></span>
   </li><%
    }
    con.Close();    
%>

 </ul>

</asp:Content>

