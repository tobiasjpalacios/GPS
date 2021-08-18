using System;
using System.Collections.Generic;

public partial class _Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string usuarioLogueado = GetSecurity().Username;

        List<GPS.Proyecto> proyectos = new GPS.Proyecto().Select();
    }

    protected void AddUsuario(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }

    protected void ListaUsuario(object sender, EventArgs e)
    {
        Response.Redirect("UserList.aspx");
    }

    protected void InformeUsuario(object sender, EventArgs e)
    {
        Response.Redirect("Informe.aspx");
    }

    protected void IrPrincipal(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void lnkSalir_Click(object sender, EventArgs e)
    {
        Util.DeleteCookie("Admin");
        Util.GoTo("Login.aspx");
    }
}