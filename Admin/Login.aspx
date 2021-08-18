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
    </form>
</body>
</html>