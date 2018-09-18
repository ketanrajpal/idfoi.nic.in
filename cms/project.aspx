<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="project.aspx.cs" Inherits="project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">



<a href="project.aspx" class="detail_but">View Details</a><a href="project.aspx?slug=add" class="detail_but">Add Details</a>
<h1>Project</h1>
<div class="clear"></div>

<% if (Request.QueryString["slug"] == null || Request.QueryString["slug"] == null)
   { %>
<table class="display">
 <thead>
  <td>Title</td>
  <td>Sector</td>
  <td>Project Category </td>
  <td>Update</td>
  <td>Delete</td>
 </thead>
 <tbody>
 <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["defaultCon"].ConnectionString);
       con.Open();
       SqlCommand cmd = new SqlCommand("select * from project_category_sector order by id", con);
       SqlDataReader dr = cmd.ExecuteReader();
       while (dr.Read())
       {
         %>

         <tr>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["title"].ToString())); %></td>
          <td><% Response.Write(System.Web.HttpUtility.HtmlDecode(dr["sector"].ToString())); %></td>
          <td><% Response.Write(dr["project_category"]); %></td>
          <td><a title="Update" href="?slug=update&id=<% Response.Write(dr["id"].ToString()); %>"><span class="fa fa-pencil"></span></a></td>
          <td><a title="Delete" href="delete.aspx?mod=project&id=<% Response.Write(dr["id"].ToString()); %>&url=project.aspx" class="delete"><span class="fa fa-trash"></span></a></td>
         </tr>

         <%
       }
       con.Close();
 %>
 </tbody>
 <tfoot>
  <td>Title</td>
  <td>Sector</td>
  <td>Project Category </td>
  <td>Update</td>
  <td>Delete</td>
 </tfoot>
</table>

<% } if (Request.QueryString["slug"]== "update" || Request.QueryString["slug"] == "add")
   { %>
<form class="form" name="myform" id="myform" runat="server"><label class="validation" id="validate_server" runat="server"></label>
 <fieldset>
  <label>Title</label>
  <asp:TextBox ID="title" runat="server"></asp:TextBox>
  <asp:RequiredFieldValidator ID="require_title" ControlToValidate="title" runat="server" ErrorMessage="Please enter the title." CssClass="validation"></asp:RequiredFieldValidator>
  
   </fieldset>
 <fieldset>
  <label>Sector</label>
  <asp:DropDownList id="sector" name="sector" runat="server"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_sector"
                   ControlToValidate="sector"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter sector"
                   runat="server"/>
 </fieldset>
  <fieldset>
  <label>Target geographic location</label>
  <asp:TextBox ID="location" runat="server"></asp:TextBox>
  
    
    </fieldset>
 <fieldset>
  <label>Aim of the project</label>
  <asp:TextBox ID="aim" runat="server" TextMode="MultiLine" Columns="120" Rows="10"></asp:TextBox>
   
  </fieldset>
  <fieldset>
  <label>Short justification of the project</label>
  <asp:TextBox ID="justification" runat="server" TextMode="MultiLine" Columns="120" Rows="10"></asp:TextBox>
  
  </fieldset>
  <fieldset>
  <label>Target beneficiaries</label>
  <asp:TextBox ID="beneficiary" runat="server" TextMode="MultiLine" Columns="120" Rows="10"></asp:TextBox>
   
   
   </fieldset>
 <fieldset>
  <label>Whether existing or new project</label>
  <asp:TextBox ID="new_project" runat="server"></asp:TextBox>
     
  
   </fieldset>
  <fieldset>
  <label>Nodal Officer</label>
  <asp:TextBox ID="nodal_officer" runat="server"></asp:TextBox>
 </fieldset>
  <fieldset>
  <label>Implementing Agency</label>
  <asp:TextBox ID="implementation_strategy" runat="server" TextMode="MultiLine" Columns="120" Rows="10"></asp:TextBox>
  
 
 </fieldset>
   <fieldset>
  <label>Expected Benefits </label>
  <asp:TextBox ID="expected_benefits" runat="server" TextMode="MultiLine" Columns="120" Rows="10"></asp:TextBox>
 
 </fieldset>

 <fieldset>
  <label>Project Timeline</label>
  <asp:TextBox ID="timeline_to" runat="server" ></asp:TextBox>
  
 </fieldset>
 <fieldset>
  <label>Estimated budget</label>
  <asp:TextBox ID="budget" runat="server"></asp:TextBox>
 
 
 </fieldset>
 <fieldset>
  <label>Whether it includes capital cost as well as maintenance cost </label>
  <asp:TextBox ID="cost" runat="server"></asp:TextBox>
  
 
 </fieldset>
 
  <fieldset>
  <label>Per Unit Cost/Minimum Contribution by Overseas Indians </label>
  <asp:TextBox ID="per_unit_cost" runat="server"></asp:TextBox>
  

 </fieldset>
  
   <fieldset>
  <label>Approve</label>
   <asp:DropDownList id="approve" name="approve" runat="server">
       <asp:ListItem asp:DropDownListed="True" value="-1">Select Approval</asp:ListItem>
       <asp:ListItem Value="1">Yes</asp:ListItem>
       <asp:ListItem Value="0">No</asp:ListItem>
      </asp:DropDownList>
      <asp:RegularExpressionValidator id="require_approve"
                   ControlToValidate="approve"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter approval"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>Project Category</label>
  <asp:DropDownList id="project_category" name="project_category" runat="server"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_project_category"
                   ControlToValidate="project_category"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please enter Project Category"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>Project State</label>
  <asp:DropDownList id="project_state" name="project_state" runat="server"></asp:DropDownList>
  <asp:RegularExpressionValidator id="require_project_state"
                   ControlToValidate="project_state"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   CssClass="validation"
                   ErrorMessage="Please select Project State"
                   runat="server"/>
 </fieldset>
 <fieldset>
  <label>Download\Link\Pdf</label>
  <asp:FileUpload id="link" runat="server" />
  <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ErrorMessage="Please enter the correct link"  CssClass="validation" ControlToValidate="link" ValidationExpression="(^[a-zA-Z0-9\\:_-]+)+\.(jpeg|JPEG|gif|GIF|png|PNG|doc|docx|DOC|DOCX|pdf|PDF|jpg|JPG)$"></asp:RegularExpressionValidator>

 </fieldset>
 <fieldset>
  <asp:HiddenField ID="action" runat="server" Value="ADD" />
  <asp:HiddenField ID="identity" runat="server" Value="" />
  <asp:Button ID="submit" Text="Submit" runat="server" onclick="submit_Click" />
 </fieldset>
</form>
<% } %>

</asp:Content>