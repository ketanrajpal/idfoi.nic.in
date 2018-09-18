<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>Frequently Asked Questions</h1>

<ul class="india-inspires accordion">
<%
    functions a = new functions();
    SqlConnection con = new SqlConnection(a.connect());
    con.Open();
    SqlCommand cmd = new SqlCommand("select * from faqs", con);
    SqlDataReader dr = cmd.ExecuteReader();
    while (dr.Read())
    {
        %>

<li>   
    <div><% Response.Write(dr["question"].ToString()); %></div>
    <span class="date"><% Response.Write(dr["answer"].ToString()); %></span>
   </li>

 
  <%
    }
    con.Close();    
%>
</ul>
<script>
$( ".accordion" ).accordion({
  header: "div",
collapsible: true
});
</script>
<style>
ul li{
list-style:none !important;
}
.ui-widget-content{
border:none !important;
}
</style>
</asp:Content>

