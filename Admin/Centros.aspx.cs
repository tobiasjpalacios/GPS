using MagicSQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Centros : BasePage
{

   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTabla();
        }

    }

    protected void tb_centros_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GPS.CentroSalud centroSalud = (GPS.CentroSalud)e.Row.DataItem;
            string id = centroSalud.IdCentroSalud.ToString();
            Button btnDelete = (Button)e.Row.FindControl("btnDelete");
            Button btnEditar = (Button)e.Row.FindControl("btnEditar");
            btnEditar.CommandArgument = id;
            btnDelete.CommandArgument = id;
        }
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

    protected void CargaCentro(object sender, EventArgs e)
    {
        Response.Redirect("Centros.aspx");
    }

    protected void lnkSalir_Click(object sender, EventArgs e)
    {
        Util.DeleteCookie("Admin");
        Util.GoTo("Login.aspx");
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        titulomdl.Text = "Cargar Nuevo Centro"; 
        Util.ExecJsScript("$('#mdlAdd').modal('show');");
    }

    protected void CrearCentro(object sender, EventArgs e)
    {
        GPS.CentroSalud centro = new GPS.CentroSalud()
        {
            Numero = txtnumero.Text.ToInt(),
            Nombre = txtNombre.Text,
            Zona = txtZona.Text.ToInt(),
            Telefono = txtZona.Text,
            Alta = DateTime.Now


        };
        centro.Insert();
        LoadTabla();
    }

  

    protected void BtnEditar(object sender , EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;

        GPS.CentroSalud centro = new GPS.CentroSalud().Select(id.ToInt());
        txtNombre1.Text = centro.Nombre;
        txtNumero1.Text = centro.Numero.ToString();
        txtTelefono1.Text = centro.Telefono.ToString();
        txtZona1.Text = centro.Zona.ToString();

        Button btnEliminar = (Button)Page.FindControl("btnEliminar");
        Button btnGuardar = (Button)Page.FindControl("btnGuardar");
        btnGuardar.CommandArgument = id;
        btnEliminar.CommandArgument = id;
        Util.ExecJsScript("$('#mdlEditar').modal('show');");
    }

    protected void BtnBorrar(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;
        GPS.CentroSalud centro = new GPS.CentroSalud().Select(id.ToInt());
        centro.Baja = DateTime.Now;
        centro.Update();
        LoadTabla();
    }

    protected void Control(Object sender, EventArgs e)
    {
        Util.ExecJsScript("$('#mdlValidar').modal('show');");

    }

    protected void BtnGuardar(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;
        GPS.CentroSalud centro = new GPS.CentroSalud().Select(id.ToInt());

        centro.Numero = txtNumero1.Text.ToInt();
        centro.Nombre = txtNombre1.Text;
        centro.Zona = txtZona1.Text.ToInt();
        centro.Telefono = txtTelefono1.Text;
       


        
        centro.Update();
        LoadTabla();
    }
    protected void LoadTabla()
    {
        tb_centros.DataSource = new GPS.CentroSalud().Select().Where(centro => centro.Baja == null);
        tb_centros.DataBind();
    }
}
