using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Collections.Generic;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void B_DNI_ServerClick(object sender, EventArgs e)
        {
        var dniBusqueda = TB_DNI.Text;
        List<GPS.Usuario> busqueda = new GPS.Usuario().Select().Where(usuario => (usuario.NumeroDocumento == dniBusqueda) && (usuario.Baja == null)).ToList();
        
        if (busqueda.Count == 0)
        {
            nota.Text = "Dni no registrado ";
        }
        else
        {
            nota.Text = null;
            List<GPS.Usuario>viejoUsuario = new GPS.Usuario().Select().Where(usuario => (usuario.NumeroDocumento == dniBusqueda) && (usuario.Baja == null)).ToList();
            txtApellido.Text = viejoUsuario.FirstOrDefault().Apellido;
            txtNombre.Text = viejoUsuario.FirstOrDefault().Nombres;
            TxtUsuario.Text = viejoUsuario.FirstOrDefault().Username;
            txtContraseña.Text = viejoUsuario.FirstOrDefault().Password;
            txtTelefono.Text = viejoUsuario.FirstOrDefault().Telefono;
            txtEmail.Text = viejoUsuario.FirstOrDefault().Email;



        }



    }
    protected void mdlCentro(object sender, EventArgs e)
    {
        
        Util.ExecJsScript("$('#Centro').modal('show');");
    }


    protected void limpiar()
    {
        txtApellido.Text = null;
        txtNombre.Text = null;
        TxtUsuario.Text = null;
        txtContraseña.Text = null;
        txtTelefono.Text = null;
        txtEmail.Text = null;
    }


    protected void Unnamed_Click(object sender, EventArgs e)
    {

        var dniBusqueda = TB_DNI.Text;


        List<GPS.Usuario> Usuario = new GPS.Usuario().Select().Where(usuario => (usuario.NumeroDocumento == dniBusqueda) && (usuario.Baja == null)).ToList();
        if (Usuario.Count == 0)
        {
            GPS.Usuario user = new GPS.Usuario()
            {
                NumeroDocumento = dniBusqueda,
                Apellido = txtApellido.Text,
                Nombres = txtNombre.Text,
                Email = txtEmail.Text,
                Telefono = txtTelefono.Text,
                Username = TxtUsuario.Text,
                Password = txtContraseña.Text,
                Alta = DateTime.Now,
            };
            user.Insert();
           
            limpiar();
        }
        else
        {
            Usuario.FirstOrDefault().NumeroDocumento = dniBusqueda;
            Usuario.FirstOrDefault().Apellido = txtApellido.Text;
            Usuario.FirstOrDefault().Nombres = txtNombre.Text;
            Usuario.FirstOrDefault().Email = txtEmail.Text;
            Usuario.FirstOrDefault().Telefono = txtTelefono.Text;
            Usuario.FirstOrDefault().Username = TxtUsuario.Text;
            Usuario.FirstOrDefault().Password = txtContraseña.Text;
            Usuario.FirstOrDefault().Alta = DateTime.Now;
            Usuario.FirstOrDefault().Update();
            limpiar();
        }
        
    }
}