﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="UserList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lista Usuarios </title>

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
                                            <li class="list-group-item ">Principal</li>
                                            <li class="list-group-item ">Registrar Usuario</li>
                                            <li class="list-group-item active">Lista de Usuarios </li>
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
                         <asp:Button  CssClass="btn btn-info ml-3 mt-2 col-10" ID="btnPermisos" Text="Otorgar Permisos" OnClick="btnPermisos_Click" runat="server"/>
                    </div>
                </div>
            </div>
            <div class="col-9">
                <div class=" text-center">
                    <h1>Adminstracion</h1>
                    <h3>Lista de Usuarios  </h3>

                    <div class="row ml-5 mt-5">
                        <div class="col-md-4 from-group text-left ">
                            <span>Nombre</span>
                            <div class="input-group">
                                <input id="TB_DNI" class="form-control" onclick="this.select();" onkeypress="return isNumberKey(event)" autocomplete="chrome-off" />
                                <div class="input-group-append">
                                    <input type="submit" name="B_DNI" value="Buscar" id="B_DNI" class="btn btn-outline-secondary" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 from-group text-left ">
                            <span>Centro de Salud</span>
                            <div class="input-group">
                                <select class="form-control" id="exampleFormControlSelect">
                                    <option>Villa Revol</option>
                                    <option>Villa Libertador </option>
                                    <option>Heroes de Malvinas</option>
                                </select>
                                <div class="input-group-append">
                                    <input type="submit" name="B_DNI" value="filtrar" id="B_DNI2" class="btn btn-outline-secondary" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 from-group text-left ">
                            <span>Programa </span>
                            <div class="input-group">
                                <select class="form-control" id="exampleFormControlSelect1">
                                    <option>Salud Reproductiva</option>
                                    <option>Administracion</option>
                                    <option>Embarazadas y Puerperas</option>
                                </select>
                                <div class="input-group-append">
                                    <input type="submit" name="B_DNI" value="filtrar" id="B_DNI1" class="btn btn-outline-secondary" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5 ml-2">
                       <asp:GridView
                           ID="tb_user"
                            CssClass="table table-bordered" 
                            runat="server" 
                            AutoGenerateColumns="False"
                            OnRowDataBound="tb_user_RowDataBound" >

                            <Columns>
                               <asp:BoundField HeaderText="Nombres" DataField="Nombres" />
                               <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                               <asp:BoundField HeaderText="Usuario" DataField="Username" />
                               
                            <asp:TemplateField  HeaderText="Permisos">
                                <ItemTemplate>
                                    <asp:GridView CssClass="col" ID="tb_permisos" runat="server"></asp:GridView>
                                </ItemTemplate>
                            
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Opciones">
                        <ItemTemplate>


                            <asp:Button ID="btnEditar" Text="Editar" CssClass="btn btn-primary"  runat="server" />
                            <asp:Button ID="btnDelete" Text="Eliminar" CssClass="btn btn-danger" runat="server"  />
                        </ItemTemplate>
                    </asp:TemplateField>

                            
                            
                            </Columns>


                        </asp:GridView>
                        
                          <div id="mdlAdd" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5  id="titulomodal" class="modal-title col text-center"> <asp:Label runat="server" ID="titulomdl"></asp:Label>  </h5>  
                        </div>
                       <h4> Nuevo Proyecto</h4>
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                     <div class="container">
                            <formview>
                               
                                
                                
                                
                                <div class="row mt-3 ml-2">
            
                                <div class="form-group col-9 text-left">
                                       <asp:Label Text="Nombre" runat="server" />
                                       <asp:TextBox runat="server"  CssClass="form-control" ID="p_name"></asp:TextBox>
                                    </div>
                                    
                                    <div class="form-check">
                                       <label class="form-check-label" for="flexCheckDefault">
                                        Centros de Salud
                                      </label>
                                        <asp:CheckBoxList 


                                        
                                            TextAlign="Right"
                                            CssClass="" ID="ch_centros" runat="server">  </asp:CheckBoxList>
                                      
                                    </div>
                                    
                                    
                                   

                                </div>
                                
                        
                                <asp:Button  CssClass="btn btn-info ml-4 mt-2 mb-3 col-10" ID="btnGuardar1"  Text="guardar" runat="server" />

                            </formview>
                        </div>
                    
                    
                </div>
            </div>
        </div>
                        
                       
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