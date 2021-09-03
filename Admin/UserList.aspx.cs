using MagicSQL;
using System;
using System.Data;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserList : BasePage
{
    protected void Page_Load(object sender, EventArgs e)

    {
       
        if (!IsPostBack)
        {
            Userlist();
            foreach (GPS.CentroSalud centroSalud in new GPS.CentroSalud().Select())
            {
                ch_centros.Items.Add(new ListItem(centroSalud.Nombre, centroSalud.IdCentroSalud.ToString()));

            }
        }
    }
    protected void Userlist()
    {

        tb_user.DataSource = new GPS.Usuario().Select().Where(User => User.Baja ==null);
        tb_user.DataBind();

    }
    protected void lnkSalir_Click(object sender, EventArgs e)
    {
        Util.DeleteCookie("Admin");
        Util.GoTo("Login.aspx");
    }
    protected void Related()
    {
        
        
    }

    protected void tb_user_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GPS.Usuario usuario = (GPS.Usuario)e.Row.DataItem;
            
            string id = usuario.IdUsuario.ToString();
            Button btnDelete = (Button)e.Row.FindControl("btnDelete");
            Button btnEditar = (Button)e.Row.FindControl("btnEditar");
            btnEditar.CommandArgument = id;
            btnDelete.CommandArgument = id;
            DataTable dt = new SP("GPS").Execute("usp_get_relaciones",P.Add("idUsuario",id));
            GridView gd = (GridView)e.Row.FindControl("tb_permisos");
            gd.DataSource = dt;
            gd.DataBind();
        }
    }

    protected void btnPermisos_Click(object sender, EventArgs e)
    {
        Util.ExecJsScript("$('#mdlAdd').modal('show');");
    }
}