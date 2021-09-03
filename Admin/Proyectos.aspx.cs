using MagicSQL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Proyectos : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            LoadProyecto();
            foreach (GPS.CentroSalud centroSalud in new GPS.CentroSalud().Select())
            {
                ch_centros.Items.Add(new ListItem(centroSalud.Nombre, centroSalud.IdCentroSalud.ToString()));

            }
        }

    }
    protected void LoadProyecto()
    {
        GridView1.Visible = true;
        GridView1.DataSource=new  GPS.Proyecto().Select().Where(centro => (centro.Baja == null));
        GridView1.DataBind();
        
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
    protected void ListarProyectos(object sender , EventArgs e)
    {
       ;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {

        btnGuardar1.Visible = true;
        btnGuardarEdicion.Visible = false;
        Util.ExecJsScript("$('#mdlAdd').modal('show');");

       
            
    }

    protected void tb_proyectos_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GPS.Proyecto proyecto = (GPS.Proyecto)e.Row.DataItem;

            string id = proyecto.IdProyecto.ToString();
            Button btnDelete = (Button)e.Row.FindControl("btnDelete");
            Button btnEditar = (Button)e.Row.FindControl("btnEditar");
           
            
            btnEditar.CommandArgument = id;
            btnDelete.CommandArgument = id;
            DataTable dt = new SP("GPS").Execute("usp_proyeto_centro", P.Add("id", id));
            GridView gd = (GridView)e.Row.FindControl("tb_pr");
            gd.DataSource = dt;
            gd.DataBind();
        }
    }

    protected void btnGuardar1_Click(object sender, EventArgs e)
    {


       
        string nombre = p_name.Text;
        List<GPS.Proyecto> project = new GPS.Proyecto().Select().Where(proy => proy.Nombre == nombre).ToList();
        if (project.Count == 0)
        {
            GPS.Proyecto py = new GPS.Proyecto()
            {
                Nombre = p_name.Text,
                Alta = DateTime.Now
            };
            py.Insert();

            foreach (ListItem listItem in ch_centros.Items)
            {
                if (listItem.Selected)
                {
                    string a = listItem.Selected.ToString();

                    var id = listItem.Value;

                    GPS.CentroSalud_Proyecto relacion = new GPS.CentroSalud_Proyecto()
                    {
                        IdCentroSalud = id.ToInt(),
                        IdProyecto = py.IdProyecto,
                        Alta = DateTime.Now
                        
                    };
                    relacion.Insert();



                }
            }
        }
        else
        {

        }

        LoadProyecto();
    }

    protected void tb_proyectos1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void btnEditar_Click(object sender, EventArgs e)
    {

        string id = ((Button)sender).CommandArgument;
        Button btnGuardarEdicion = (Button)Page.FindControl("btnGuardarEdicion");
        btnGuardarEdicion.CommandArgument = id;
        GPS.Proyecto py = new GPS.Proyecto().Select(id.ToInt());
        p_name.Text = py.Nombre;
        List<GPS.CentroSalud_Proyecto> relacion =  new GPS.CentroSalud_Proyecto().Select().Where(proy => proy.IdProyecto == id.ToInt()).ToList();
        foreach (GPS.CentroSalud_Proyecto rel  in relacion )
        {
            foreach (ListItem listItem in ch_centros.Items)
            {
                
                var id_center = listItem.Value;
                if (id_center.ToInt() == rel.IdCentroSalud)
                {
                    listItem.Selected = true;

                }
                
            }

        }
        


        Util.ExecJsScript("$('#mdlAdd').modal('show');");
        btnGuardarEdicion.Visible = true;
        btnGuardar1.Visible = false;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;
        GPS.Proyecto proyecto = new GPS.Proyecto().Select(id.ToInt());
        proyecto.Baja = DateTime.Now;
        proyecto.Update();
        LoadProyecto();
    }

    protected void CleanSelected(object sender,EventArgs e)
    {
        foreach (ListItem listItem in ch_centros.Items)
        {
            listItem.Selected = false;


        }
    }
    protected void CleanSelector()
    {
        foreach (ListItem listItem in ch_centros.Items)
        {
            listItem.Selected = false;


        }
    }

    protected void btnGuardarEdicion_Click(object sender, EventArgs e)
    {

        string id = ((Button)sender).CommandArgument;
        GPS.Proyecto py = new GPS.Proyecto().Select(id.ToInt());
        py.Nombre = p_name.Text;
        py.Update();

        List<GPS.CentroSalud_Proyecto> relacion = new GPS.CentroSalud_Proyecto().Select().Where(proy => proy.IdProyecto == id.ToInt()).ToList();
        foreach (ListItem listItem in ch_centros.Items)
        {
            var id_center = listItem.Value;
            if (listItem.Selected)
            {
                if (relacion.Count != 0)
                {
                    GPS.CentroSalud_Proyecto rela = new GPS.CentroSalud_Proyecto()
                    {
                        IdCentroSalud = id_center.ToInt(),
                        IdProyecto = id.ToInt(),
                        Alta = DateTime.Now

                    };
                    rela.Insert();
                }
                else
                {
                    foreach (GPS.CentroSalud_Proyecto rel in relacion)
                    {
                        if (rel.IdCentroSalud != id_center.ToInt())
                        {
                            GPS.CentroSalud_Proyecto rela = new GPS.CentroSalud_Proyecto()
                            {
                                IdCentroSalud = id_center.ToInt(),
                                IdProyecto = id.ToInt(),
                                Alta = DateTime.Now

                            };
                            rela.Insert();
                        }

                    }
                }
               
            }
            else
            {
                foreach (GPS.CentroSalud_Proyecto rel in relacion)
                {
                    if (rel.IdCentroSalud == id_center.ToInt())
                    {
                        if (rel.Baja != null)
                        {
                            rel.Baja = DateTime.Now;
                            rel.Update();
                        }
                       

                    }
                   
                }
            }

        }
        LoadProyecto();
        CleanSelector();
    }
}