using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
	private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;
    protected void Page_Load(object sender, EventArgs e)
    {
		HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
		HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
		HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
		HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
		HttpContext.Current.Response.Cache.SetNoStore();
		Response.Cache.SetCacheability(HttpCacheability.NoCache); //Cache-Control : no-cache, Pragma : no-cache
		Response.Cache.SetExpires(DateTime.Now.AddDays(-1)); //Expires : date time
		Response.Cache.SetNoStore(); //Cache-Control :  no-store
		Response.Cache.SetProxyMaxAge(new TimeSpan(0, 0, 0)); //Cache-Control: s-maxage=0
		Response.Cache.SetValidUntilExpires(false);
		Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);//Cache-Control:  must-revalidate
		Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
 Response.Cache.SetCacheability(HttpCacheability.NoCache);
 Response.Cache.SetNoStore();

		if (Session["LoggedIn"] != null && Session["AuthToken"] != null && Request.Cookies["AuthToken"] != null){
			if (!Session["AuthToken"].ToString().Equals(Request.Cookies["AuthToken"].Value))
			{
				Session.Clear();
				Session.Abandon();
				Session.RemoveAll();
				Response.Redirect("default.aspx");
			}
		}
		
		if(Session["AuthToken"]==null || Session["name"]==null || Session["id"]==null || Session["username"] == null){
			Response.Redirect("default.aspx");
		}
		
    }
	protected void Page_Init(object sender, EventArgs e)
    {
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null
        && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;
            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
 
                Value = _antiXsrfTokenValue
            };
            if (Request.IsSecureConnection)
            responseCookie.Secure = true;
            Response.Cookies.Set(responseCookie);
        }
 
            Page.PreLoad += master_Page_PreLoad;
        }
 
        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] =
                Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                //Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] !=  (Context.User.Identity.Name ?? String.Empty))
            {
            throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }
}
