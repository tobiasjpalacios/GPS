/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    public BasePage()
    {
        if (Util.ReadCookie("Admin") != null)
        {
            try
            {
                string cookie = Util.ReadCookie("Admin");
                string json = Util.Decrypt(cookie);
                Security security = json.ToObject<Security>();
            }
            catch
            {
                Util.GoTo("Login.aspx");
            }
        }
        else
        {
            Util.GoTo("Login.aspx");
        }
    }

    public Security GetSecurity()
    {
        if (Util.ReadCookie("Admin") != null)
        {
            try
            {
                string cookie = Util.ReadCookie("Admin");
                string json = Util.Decrypt(cookie);
                Security security = json.ToObject<Security>();
                return security;
            }
            catch
            {
                return null;
            }
        }
        else
        {
            return null;
        }
    }
}