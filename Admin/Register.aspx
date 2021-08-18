<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Register </title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
          crossorigin="anonymous"/>

</head>
<body>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

     <form id="form1" runat="server">
        <div class=" row mt-5">
            <div class="ml-4 col-2"> 
                <div class=" lista ">
                    <div>
                        <h3> Programas </h3>
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
                   <h1> Adminstracion</h1>
                    <h3> Registrar Usuarios </h3>
                    
                     <div>
                        <div class="container mt-5"  style="overflow-y: scroll; height: 500px;">
                           <div class="row">
                                <div class="col-md-4 from-group text-left ">
                                    <span>DNI</span>
                                    <div class="input-group">
                                        <input name="TB_DNI"  maxlength="8" id="TB_DNI" class="form-control" type="tel" onclick="this.select();" onkeypress="return isNumberKey(event)" autocomplete="chrome-off">
                                        <div class="input-group-append">
                                            <input type="submit" name="B_DNI" value="Buscar" id="B_DNI" class="btn btn-outline-secondary">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="form-group col-6 text-left">
                                <asp:Label Text="Apellido " runat="server" />
                                <asp:TextBox ID="TextBox2" CssClass="form-control "  runat="server" />
                                </div>
                                <div class="form-group col-6 text-left">
                                <asp:Label Text="Nombre" runat="server" />
                                <asp:TextBox ID="TextBox3" CssClass="form-control "  runat="server" />
                                </div>
                                </div>
                             <div class="row mt-3">
                                <div class="form-group col-6 text-left">
                                <asp:Label Text="Usuario " runat="server" />
                                <asp:TextBox ID="TextBox5" CssClass="form-control "  runat="server" />
                                </div>
                                <div class="form-group col-6 text-left">
                                <asp:Label Text="Contraseña" runat="server" />
                                <asp:TextBox  type="password" ID="TextBox6" CssClass="form-control "  runat="server" />
                                </div>
                                </div>
                            <div class="row mt-3">
                                <div class="form-group col-6 text-left">
                                <asp:Label Text="Email " runat="server" />
                                <asp:TextBox type="email" ID="TextBox1" CssClass="form-control "  runat="server" />
                                </div>
                                <div class="form-group col-6 text-left">
                                <asp:Label Text="Telefono" runat="server" />
                                <asp:TextBox   ID="TextBox4" CssClass="form-control "  runat="server" />
                                </div>
                                </div>
                            <div class="row justify-content-center">
                                <table class="table table-bordered">
                                      <thead>
                                        <tr>
                                          <th >Numero</th>
                                          <th scope="col">Nombre</th>
                                          <th scope="col">Opciones</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <th >1</th>
                                          <td>Villa Libertador Anexo</td>
                                          <td>

                                              <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                          <button type="button" class="btn btn-danger">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                                                  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                                                </svg>
                                          </button>
                                          
                                          <button type="button" class="btn btn-warning">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle-fill" viewBox="0 0 16 16">
                                                 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"/>
                                                </svg>
                                          </button>
                                        </div>

                                          </td>
                                          
                                        </tr>
                                       
                                       
                                      </tbody>
                                    </table>
                                  <asp:Button  CssClass="btn btn-info col-5" Text="Agregar Centro de Salud" runat="server" />
                            </div>
                           
                            <div class="row justify-content-center mt-5">
                                <table class="table table-bordered">
                                      <thead>
                                        <tr>
                                          <th >Centro</th>
                                          <th scope="col">Nombre</th>
                                          <th scope="col">Opciones</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <th >Villa Libertador Anexo</th>
                                          <td>Administracion</td>
                                          <td>

                                              <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                          <button type="button" class="btn btn-danger">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                                                  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                                                </svg>
                                          </button>
                                          
                                          <button type="button" class="btn btn-warning">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle-fill" viewBox="0 0 16 16">
                                                 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"/>
                                                </svg>
                                          </button>
                                        </div>

                                          </td>
                                          
                                        </tr>
                                       <tr>
                                          <th >Villa Libertador Anexo</th>
                                          <td>Salud Reproductiva</td>
                                          <td>

                                              <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                          <button type="button" class="btn btn-danger">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                                                  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                                                </svg>
                                          </button>
                                          
                                          <button type="button" class="btn btn-warning">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle-fill" viewBox="0 0 16 16">
                                                 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"/>
                                                </svg>
                                          </button>
                                        </div>

                                          </td>
                                          
                                        </tr>
                                       
                                      </tbody>
                                    </table>
                                  <asp:Button  CssClass="btn btn-info col-5" Text="Agregar Programas" runat="server" />
                            </div>
                           
                           
                       
                        
                    </div>
                          <asp:Button  style="position:sticky" CssClass="btn btn-success col-8 mt-5" Text="Enviar" runat="server" />
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