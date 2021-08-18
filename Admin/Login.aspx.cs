using System;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtuser.Text.Trim().ToLower();
        string password = txtcontra.Text.Trim();

        if (username == "usuario" && password == "1234")
        {
            Security security = new Security()
            {
                IdUsuario = 1,
                Username = "usuario",
                OcultarControles = true
            };
            string json = security.ToJson();
            string encrypted = Util.Encrypt(json);
            Util.CreateCookie("Admin", encrypted);

            Util.GoTo("Default.aspx");
        }
        else
        {
            // Usuario y/o contraseña invalido
        }
    }
}