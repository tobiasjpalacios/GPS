using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<GPS.Proyecto> proyectos = new GPS.Proyecto().Select();
    }

    protected void AddUsuario(object sender , EventArgs e)
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
}