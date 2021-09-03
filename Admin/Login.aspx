<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inicio de Sesión </title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous" />
</head>
<body>

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
        <div class="container">
            <div class="row justify-content-center">
                <div class="card col-6  text-center mt-5">
                    <div class="form-group-input">
                        <div class="row justify-content-center">
                            <div class="card ">
                                <div style="position: absolute; z-index: 3;">
                                    <img class="ml-2 mt-2  " src="https://www.cordoba.gob.ar/wp-content/uploads/2020/08/logo-blanco-txt.svg" alt="" />
                                </div>
                                <img class="card-img-top" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Arco_de_C%C3%B3rdoba.tif/lossy-page1-624px-Arco_de_C%C3%B3rdoba.tif.jpg" alt="Card image cap" />
                                <div class="card-body justify-content-center">
                                    <h5 class="card-title ">Iniciar Sesión</h5>
                                    <div class="row">

                                        <asp:Label for="inputPassword5" Text="Usuario" runat="server" />
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">@</span>
                                            </div>
                                            <asp:TextBox ID="txtuser" type="text" class="form-control" placeholder="Username" runat="server" />
                                        </div>
                                        <asp:Label for="txtcontra" Text="Contraseña" runat="server" />
                                        <asp:TextBox ID="txtcontra" type="password" class="form-control" aria-describedby="passwordHelpBlock" runat="server" />
                                    </div>
                                    <div class="row justify-content-center  ">
                                        <asp:Label ID="texto" Text="" runat="server" />
                                        <asp:Button ID="btnLogin" Text="Ingresar a la cuenta" CssClass="btn btn-success mt-3 col-12" runat="server" OnClick="btnLogin_Click" />

                                        <div class="row justify-content-center">
                                            <asp:Button Style="border: none; background: none" class="negrita text-muted ml-2 mt-2 col" Text=" no tengo cuenta " runat="server" />
                                            <asp:Button Style="border: none; background: none" class="negrita text-muted ml-2 mt-2 col" Text=" Olvide mi Conntraseña" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="mdlError" class="modal" tabindex="-1" role="dialog">
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
                    <h5 class="ml-2"> Por Favor Ingrese nuevamente Usuario y Contraseña</h5>
                    <div class="spinner-grow text-warning" role="status">
                      <span class="sr-only">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    
    </form>
</body>
</html>