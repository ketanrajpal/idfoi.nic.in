<%@ Page Language="C#" %>

<% functions a = new functions();

   a.delete(Request.QueryString["mod"], Request.QueryString["id"]);
   Response.Redirect(Request.QueryString["url"]);
   
    %>
