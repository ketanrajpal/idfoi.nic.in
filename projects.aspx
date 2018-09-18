<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
.mytabtab tr:nth-child(odd){
background-color:#ededed;
}
.mytabtab td
{
padding:10px;
font-size:13px !important;
}
.mytabtab td:nth-child(1)
{
font-weight:bold !important;
}
</style>
<% 
string strProjectID=string.Empty;
functions a;
SqlConnection con;
SqlCommand cmd;
SqlDataReader dr;
System.Globalization.CultureInfo cultureInfo = new System.Globalization.CultureInfo("hi-IN");
try
{
  a = new functions();
  strProjectID=Request.QueryString["project"];
  if (!string.IsNullOrEmpty(strProjectID))
  {
      hdnProjectCode.Value = strProjectID;
      con = new SqlConnection(a.connect());
      con.Open();
      cmd = new SqlCommand("select per_unit_cost,quantity from project where id='" + Request.QueryString["project"] + "'", con);
      dr = cmd.ExecuteReader();
      string strMaxQuantity = "0";
      
       
      while (dr.Read())
      {
          lblUnitPrice.Text = string.Format(cultureInfo, "{0:C}", Convert.ToInt32(dr["per_unit_cost"]));
          lblUnitPrice.Text = lblUnitPrice.Text.Substring(0, lblUnitPrice.Text.IndexOf("."));
          strMaxQuantity = Convert.ToString(dr["quantity"]);
          lblTotal.Text = string.Format(cultureInfo, "{0:C}", Convert.ToInt32(dr["per_unit_cost"]));
          lblTotal.Text = lblTotal.Text.Substring(0, lblTotal.Text.IndexOf("."));
      }
      
      con.Close();
      if (!string.IsNullOrEmpty(strMaxQuantity))
      {
          drpQuantity.DataSource = Enumerable.Range(1, Convert.ToInt32(strMaxQuantity));
          drpQuantity.DataBind();
      }
      else
      {
          drpQuantity.Items.Insert(0, new ListItem("1", "1"));
      }
  }
}
catch
{
    Response.Redirect("errors.aspx");
}

    a = new functions();
    int i = 0;
    //string puc;
    if (!string.IsNullOrEmpty(strProjectID))
    {
        con = new SqlConnection(a.connect());
        con.Open();
        cmd = new SqlCommand("select * from project where id='" + strProjectID + "'", con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            i++;
        %><h1><% Response.Write(dr["title"].ToString()); %></h1><%


//puc=dr["per_unit_cost"].ToString();

%>

<table width="100%" border="1" class="mytabtab">
<tr><td style="width:250px;">Aim of the Project</td>
<td><% Response.Write(System.Web.HttpUtility.HtmlDecode(Convert.ToString(dr["aim"]))); %></td>
</tr>
<tr><td>Short justification for the project</td>
<td><% Response.Write(System.Web.HttpUtility.HtmlDecode(Convert.ToString(dr["justification"]))); %></td>
</tr>

<% if (Convert.ToString(dr["new_project"]) != "")
   { %>
<tr><td>Whether existing or new project</td>
<td><% Response.Write(Convert.ToString(dr["new_project"])); %></td>
</tr>
<% } %>
<tr><td>Implementing agency and NGOs associated</td>
<td><% Response.Write(System.Web.HttpUtility.HtmlDecode(Convert.ToString(dr["implementation_strategy"]))); %></td>
</tr>
<tr><td>Target beneficiaries</td><td><% Response.Write(System.Web.HttpUtility.HtmlDecode(Convert.ToString(dr["beneficiary"]))); %></td>
</tr>
<% if (Convert.ToString(dr["location"]) != "")
   { %>
<tr><td>Target geographic location</td>
<td><% Response.Write(Convert.ToString(dr["location"])); %></td>
</tr>
<% } %>
<% if (Convert.ToString(dr["budget"]) != "")
   { %>
<tr><td>Project timeline</td>
<td><% Response.Write(Convert.ToString(dr["timeline_to"])); %></td>
</tr>
<% } %>
<% if (Convert.ToString(dr["budget"]) != "")
   { %>
<tr><td>Estimated budget</td>
<td><% Response.Write(Convert.ToString(dr["budget"])); %> 
</td>
</tr>
<% } %>
<% if (Convert.ToString(dr["per_unit_cost"]) != "")
   { %>
<tr><td>Per Unit Cost</td>
<td><% string unitcost = string.Format(cultureInfo, "{0:C}", Convert.ToInt32(dr["per_unit_cost"]));
       Response.Write(unitcost.Substring(0, unitcost.IndexOf("."))); %> 
</td>
</tr>
<% } %>
<% if (Convert.ToString(dr["cost"]) != "")
   { %>
<tr><td>Whether it includes capital cost as well as maintenance cost</td>
<td><% Response.Write(Convert.ToString(dr["cost"])); %> </td>
</tr>
<% } %>
</table>
<% if (Convert.ToString(dr["link"]) != "")
   { %>
<p><a href="<% Response.Write(a.path() +"projects/"+ Convert.ToString(dr["link"])); %>">For detailed project proposal, click here</a></p>
<% } %>
<%
}

        con.Close();
    }
    if (i == 0)
    {
        Response.Redirect("error.aspx");
    }
    
%>



<form id="frmProject" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        var Quantity = 0;
        var unit = 0;
        $("#<%=drpQuantity.ClientID %>").change(function () {
            try {
                Quantity = parseInt($("#<%=drpQuantity.ClientID %> option:selected").text().toString().replace(",", ""));
                unit = parseInt($("#<%=lblUnitPrice.ClientID %>").html().toString().replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace("₹", ""));
            }
            catch (e) {
                Quantity = 0;
                unit = 0;
            }
            var totalAmt = Quantity * unit;
            var tmpAmt = '';
            tmpAmt = totalAmt.toLocaleString('en-IN', { maximumSignificantDigits: 3 });
            $("#<%=lblTotal.ClientID %>").html("₹ " + tmpAmt);
        });
    });
    function btnContributeClick() {
        var url = "";
        var quantity = $("#<%=drpQuantity.ClientID %> option:selected").text();
        if (quantity == "Select") {
            alert("Please select Quantity");
        }
        else {
            if ($("#<%=rbIndividual.ClientID %>").is(":checked")) {
                url = "./contribute_individual.aspx?amount=" + $("#<%=lblTotal.ClientID %>").html().toString().replace("₹", "").trim().replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "") + "&ProjectCode=" + $("#<%=hdnProjectCode.ClientID %>").val();
            }
            else {
                url = "./contribute_association.aspx?amount=" + $("#<%=lblTotal.ClientID %>").html().toString().replace("₹", "").trim().replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "") + "&ProjectCode=" + $("#<%=hdnProjectCode.ClientID %>").val();
            }
            window.location = url;
        }
    }
</script>

    <br /><br />

<h2>Contribution</h2>
<table width="100%" border="1" class="mytabtab">
<tbody>
<tr><td style="width:400px;">
Donation Option</td>
    <td style="text-align:right;">Break-up cost in INR</td>
  </tr><tr><td style="width:400px;">Unit Price</td>
    <td style="text-align:right;"><asp:Label ID="lblUnitPrice" runat="server" /> </td>
  </tr>
  
  <tr><td style="width:400px;">Quantity</td>
    <td style="text-align:right;">
    <asp:DropDownList ID="drpQuantity" runat="server" Width="80" />
    </td>
  </tr>
  
  
  <tr><td style="width:400px;">Total</td>
    <td style="text-align:right;">
    <asp:HiddenField ID="hdnProjectCode" runat="server" />
    <asp:Label ID="lblTotal" runat="server" Text="0" />
    </td>
  </tr>
</tbody>
</table>
<br /><br />

    <p>I want to contribute as: (You can contribute as an individual, or a group of individuals or even through your respective Indian Associations)
    <br /><br />
    <asp:RadioButton ID="rbIndividual" runat="server" GroupName="contribute" Text="Individual" Checked="true" /><br />
  <asp:RadioButton ID="rbAssociate" runat="server" GroupName="contribute" Text="Associate" /><br /><br />
    </p>
    <input type="button" class="btn" value="Contribute" onclick="javascript:btnContributeClick();" />
</form>
</asp:Content>
