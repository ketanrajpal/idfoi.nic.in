<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>IDF-OI Champions</h1>
<ul class="champions">

<%
    functions a = new functions();
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from champions ORDER BY ordern", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %>
        
        
        <li style="margin-right:5%;width:45%;text-align:center;" class="left">
         <h2><% Response.Write(dr["title"].ToString()); %></h2>
         <center><div style="background-image:url('<% Response.Write(a.path() +"champions/"+ dr["image"].ToString()); %>');height:150px;width:150px;background-size:cover;background-position:center center;border-radius:50%;margin:auto !important;display:block;"></div></center>
         <p class="force-center"><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["description"].ToString())); %></p>
        </li>

        
        <%
    }
    con.Close();    
%>
</ul>
<div class="clear"></div>

<style>

.champions p
{
    text-align:center !important;
    font-size:13px !important;
    margin-top:10px;
}

</style>

</asp:Content>

