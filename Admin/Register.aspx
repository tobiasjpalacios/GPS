<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register </title>

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

    <form id="form2" runat="server">

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
                                            <li class="list-group-item active">Registrar Usuario</li>
                                            <li class="list-group-item">Lista de Usuarios </li>
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
                    </div>
                </div>
            </div>
            <div class="col-9">
                <div class=" text-center">
                    <h1>Adminstracion</h1>
                    <h3>Registrar Usuarios </h3>

                    <div>
                        <div class="container mt-5" style="overflow-y: scroll; height: 500px;">
                            <div class="row">
                                <div class="col-md-4 from-group text-left ">
                                    <span>DNI</span>
                                    <div class="input-group">
                                        <asp:TextBox name="TB_DNI" maxlength="8" ID="TB_DNI" class="form-control  " type="tel" onclick="this.select();" onkeypress="return isNumberKey(event)" runat="server"/>
                                        <div class="input-group-append mr-4">
                                            <input type="submit" name="B_DNI" value="Buscar" id="B_DNI" class="btn btn-outline-secondary" runat="server" onserverclick="B_DNI_ServerClick" />
                                        </div >
                                                                   <asp:Label CssClass="" ID="nota" runat="server"> </asp:Label>

                                    </div>
                                     
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="form-group col-6 text-left">
                                    <asp:Label Text="Apellido " runat="server" />
                                    <asp:TextBox ID="txtApellido" CssClass="form-control " runat="server" />
                                </div>
                                <div class="form-group col-6 text-left">
                                    <asp:Label Text="Nombre" runat="server" />
                                    <asp:TextBox ID="txtNombre" CssClass="form-control " runat="server" />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="form-group col-6 text-left">
                                    <asp:Label Text="Usuario " runat="server" />
                                    <asp:TextBox ID="TxtUsuario" CssClass="form-control " runat="server" />
                                </div>
                                <div class="form-group col-6 text-left">
                                    <asp:Label Text="Contraseña" runat="server" />
                                    <asp:TextBox type="password" ID="txtContraseña" CssClass="form-control " runat="server" />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="form-group col-6 text-left">
                                    <asp:Label Text="Email " runat="server" />
                                    <asp:TextBox type="email" ID="txtEmail" CssClass="form-control " runat="server" />
                                </div>
                                <div class="form-group col-6 text-left">
                                    <asp:Label Text="Telefono" runat="server" />
                                    <asp:TextBox ID="txtTelefono" CssClass="form-control " runat="server" />
                                </div>
                            </div>
                            
                            

                        </div>
                        <asp:Button Style="position: sticky" CssClass="btn btn-success col-8 mt-5" Text="Enviar" OnClick="Unnamed_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div id="Centro" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Ingreso Erroneo </h5>  
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-exclamation-triangle ml-3 mt-1" viewBox="0 0 16 16">
                          <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
                          <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                        </svg>
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