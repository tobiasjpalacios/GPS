<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Centros.aspx.cs" Inherits="Centros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Principal </title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous" />
</head>
<body>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <form id="form1" runat="server">

        

        <div class=" row mt-5">
            <div class="ml-4 col-2">
                <div class=" lista ">
                    <div>
                        <h3>Programas </h3>
                        <div class="accordion accordion-flush" id="accordionFlushExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                        Administracion
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item active ">
                                                <asp:Button runat="server" OnClick="IrPrincipal" Style="border: none; background: none" Text="Principal" /></li>
                                            <li class="list-group-item" onserverclick="AddUsuario">
                                                <asp:Button runat="server" Style="border: none; background: none" OnClick="AddUsuario" CssClass="border: none" Text="Cargar Usuarios " /></li>
                                            <li class="list-group-item" onserverclick="ListaUsuario">
                                                <asp:Button runat="server" Style="border: none; background: none" OnClick="ListaUsuario" CssClass="border: none" Text="Lista de Usuarios" />
                                            </li>
                                            <li class="list-group-item" onserverclick="ListaUsuario">
                                                <asp:Button runat="server" Style="border: none; background: none" OnClick="CargaCentro" CssClass="border: none" Text="Cargar Centro" />
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                        Salud Reproductiva
                                    </button>
                                </h2>
                                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">Principal</li>
                                            <li class="list-group-item">Registrar Usuario</li>
                                            <li class="list-group-item">Lista de Usuarios </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                        Embarazadas y Puerperas
                                    </button>
                                </h2>
                                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
                                </div>
                            </div>
                        </div>

                         <asp:LinkButton CssClass="btn btn-danger ml-3 mt-5 col-10" ID="LinkButton1" Text="Cerrar Sesión" runat="server" OnClick="lnkSalir_Click" />
                         <asp:Button  CssClass="btn btn-info ml-3 mt-2 col-10" OnClick="Unnamed_Click" Text="Nuevo centro" runat="server"/>   
                    </div>
                </div>
            </div>

            <div class="col-9">
                <div class=" text-center">
                    <h1>Adminstracion</h1>
                    <h3>Pagina Principal</h3>

                    <div class="row ml-5 mt-5">
                       
                        <asp:GridView
                           ID="tb_centros"
                            CssClass="table table-bordered" 
                            runat="server" 
                            AutoGenerateColumns="False"
                            OnRowDataBound="tb_centros_RowDataBound" >

                            <Columns>
                                 <asp:BoundField HeaderText="ID" DataField="IdCentroSalud" />
                               <asp:BoundField HeaderText="Numero" DataField="Numero" />
                               <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                               <asp:BoundField  HeaderText="Zona" DataField="Zona"/>
                               <asp:BoundField  HeaderText="Telefono " DataField="Telefono"/>
                            
                            <asp:TemplateField HeaderText="Opciones">
                        <ItemTemplate>

                            <asp:Button ID="btnEditar" Text="Editar" CssClass="btn btn-primary" runat="server" OnClick="BtnEditar" />
                            <asp:Button ID="btnDelete" Text="Eliminar" CssClass="btn btn-danger" runat="server" OnClick="BtnBorrar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                            
                            
                            </Columns>


                        </asp:GridView>

                        
                    </div>
                </div>
            </div>
        </div>


        <div id="mdlAdd" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5  id="titulomodal" class="modal-title col text-center"> <asp:Label runat="server" ID="titulomdl"></asp:Label>  </h5>  
                        </div>
                       
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                     <div class="container">
                            <formview>
                                <div class="row mt-3 ml-2">
                                    <div class="form-group col-2 text-left">
                                        <asp:Label Text="Numero " runat="server" />
                                        <asp:TextBox ID="txtnumero" CssClass="form-control " runat="server" />
                                    </div>
                                    <div class="form-group col-9 text-left">
                                        <asp:Label Text="Nombre" runat="server" />
                                        <asp:TextBox ID="txtNombre"  CssClass="form-control " runat="server" />
                                    </div>
                                </div>
                                <div class="row mt-3 ml-2 ">
                                    <div class="form-group col-2 text-left">
                                        <asp:Label Text="Zona" runat="server" />
                                        <asp:TextBox ID="txtZona" type="numnber" Text="1..6" CssClass="form-control " runat="server" />
                                    </div>
                                    <div class="form-group col-9 text-left">
                                        <asp:Label Text="telefono" runat="server" />
                                        <asp:TextBox ID="txtTelefono"  CssClass="form-control " runat="server" />
                                    </div>
                                </div>
                        
                                <asp:Button  CssClass="btn btn-info ml-4 mt-2 mb-3 col-10" OnClick="CrearCentro" Text="Nuevo centro" runat="server"/>

                            </formview>
                        </div>
                    
                    
                </div>
            </div>
        </div>

        <div id="mdlEditar" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5   class="modal-title col"> Edite los Valores del Centro </h5>  
                        </div>
                       
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                     <div class="container">
                            <formview>
                                <div class="row mt-3  ml-3">
                                    <div class="form-group col-2 text-left">
                                        <asp:Label Text="Numero " runat="server" />
                                        <asp:TextBox ID="txtNumero1" CssClass="form-control " runat="server" />
                                    </div>
                                    <div class="form-group col-9 text-left">
                                        <asp:Label Text="Nombre" runat="server" />
                                        <asp:TextBox ID="txtNombre1"  CssClass="form-control " runat="server" />
                                    </div>
                                </div>
                                <div class="row mt-3  ml-3">
                                    <div class="form-group col-2 text-left">
                                        <asp:Label Text="Zona" runat="server" />
                                        <asp:TextBox ID="txtZona1" type="numnber" Text="1..6" CssClass="form-control " runat="server" />
                                    </div>
                                    <div class="form-group col-9 text-left">
                                        <asp:Label Text="telefono" runat="server" />
                                        <asp:TextBox ID="txtTelefono1"  CssClass="form-control " runat="server" />
                                    </div>
                                </div>
                        
                                <div class="row">
                                    <asp:Button  CssClass="btn btn-info ml-4 mt-2 mb-3 col-10" ID="btnGuardar" OnClick="BtnGuardar" Text="Guardar Cambios " runat="server"/>
                                </div>
                                <div class="row">
                                    <asp:Button  CssClass="btn btn-danger ml-4 mt-2 mb-3 col-10" ID="btnEliminar" OnClick="BtnBorrar" Text="Elimanar Negocio " runat="server"/>
                                </div>


                            </formview>
                        </div>
                      </div>
                    
                </div>
            </div>
        
        <div id="mdlValidar" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5   class="modal-title col"> Edite los Valores del Centro </h5>  
                        </div>
                       
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <h4>Esta seguro que desea eliminar el centro </h4>
                     <div class="container">
                            <asp:Button Text="Aceptar" OnClick="BtnBorrar" runat="server" />
                         <asp:Button Text="cancelar" runat="server" />
                        </div>
                      </div>
                    
                </div>
            </div>

    </form>
    <script>
       $(document).ready(function () {
           $('.collapse').collapse()

       });
    </script>
</body>
</html>

