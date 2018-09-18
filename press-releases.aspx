<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>Press Releases</h1>

<ul class="india-inspires">

<%
    functions a = new functions();
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from media where media_category='2' ORDER BY CONVERT(DateTime, event_date,101)  DESC", con);
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

