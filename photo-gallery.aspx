<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Photo Gallery</h1>
<ul class="gallery" class="clear">
<%
    functions a = new functions();
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from photo_gallery ORDER BY id DESC", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>
         <li>
         
         <a class="example-image-link" href="<% Response.Write(a.path() +"photo_gallery/"+ dr["image"].ToString()); %>" data-lightbox="example-1"  data-title="<% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["description"].ToString())); %>"><p><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["description"].ToString())); %></p><img src="<% Response.Write(a.path() +"photo_gallery/"+ dr["image"].ToString()); %>" width="300"></a>
    
        
         <%
       }
       con.Close();
 %>
 </ul>

</asp:Content>

