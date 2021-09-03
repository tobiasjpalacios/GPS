using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Collections.Generic;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        
        string username = txtuser.Text.Trim().ToLower();
        string password = txtcontra.Text.Trim();

       
        List<GPS.Usuario> ingreso = new GPS.Usuario().Select().Where(usuario => (usuario.Password.ToLower().Trim() == password.ToLower().Trim()) && (usuario.Username.ToLower().Trim() == username.ToLower().Trim()) && (usuario.Baja == null)).ToList();




        if (ingreso.Count > 0 )
        {
            
            Security security = new Security()
            {
             IdUsuario = ingreso.FirstOrDefault().IdUsuario
             
            };
            string json = security.ToJson();
            string encrypted = Util.Encrypt(json);
            Util.CreateCookie("Admin", encrypted);

            Util.GoTo("Default.aspx");
        }
        else
        {
            Util.ExecJsScript("$('#mdlError').modal('show');");
            // Usuario y/o contraseña invalido
        }
    }
}