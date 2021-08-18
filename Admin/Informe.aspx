<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Informe.aspx.cs" Inherits="Informe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous" />
    <link rel="stylesheet" href="StyleSheet.css" />
</head>
<body>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <div class="container">
        <div class="row justify-content-center text-center">
            <div class=" col align-content-center ">
                <h1>Gestor de Programas del sistema de salud </h1>
            </div>
        </div>
    </div>

    <form id="form1" runat="server">
        <div class=" row mt-5">
            <div class="ml-4 col-2">
                <div class=" lista ">
                    <div>
                        <h3>Programas </h3>
                    </div>

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
                </div>
            </div>

            <div class="col-9">
                <div class="text-center">
                    <h2>Salud reproductiva Informe</h2>
                </div>
                <div class="row">
                    <div class="col-4">
                        <div class="table-responsive mt-5">
                            <table class="table table-bordered">
                                <caption>List of users</caption>

                                <tbody>
                                    <tr>
                                        <td rowspan="2" class="justify-content-center text-center "><span>Edad</span></td>
                                        <td colspan="2" class="text-center">Fichados</td>
                                    </tr>

                                    <tr>

                                        <td>Mujeres</td>
                                        <td>Varones</td>
                                    </tr>
                                    <tr>
                                        <td>Mayor de 20</td>
                                        <td>20</td>
                                        <td>5</td>
                                    </tr>
                                    <tr>
                                        <td>Menores de 20 </td>
                                        <td>26</td>
                                        <td>7</td>
                                    </tr>
                                    <tr>
                                        <td class="alert-danger">Total </td>
                                        <td>46 </td>
                                        <td>12</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="table-responsive mt-5">
                            <table class="table table-bordered">
                                <caption>List of users</caption>

                                <tbody>
                                    <tr>
                                        <td>Dadas de Baja </td>
                                        <td>25</td>
                                    </tr>

                                    <tr>

                                        <td>Violencia</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <td>Consumo Problematico</td>
                                        <td>25</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-5">
                        <table class="table table-bordered mt-5">
                            <caption>Anticonceptivos</caption>
                            <thead>
                                <tr>
                                    <th scope="col">Metodo</th>
                                    <th scope="col">Fichados</th>
                                    <th scope="col">Concurren por mes </th>
                                    <th scope="col">Stock</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Aco 1</td>
                                    <td>10</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>

                                <tr>

                                    <td>ACI-M</td>
                                    <td>3</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>ACI-T</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td>SIU</td>
                                    <td>25</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-3" style="position: sticky">
                        <div class="row">
                            <div class="form-group col-6 mt-5 text-left">
                                <asp:Label Text="Mes " runat="server" />
                                <select class="form-control" id="exampleFormControlSelect1">
                                    <option>Enero</option>
                                    <option>Febrero</option>
                                    <option>Marzo</option>
                                    <option>Abril</option>
                                </select>
                            </div>
                            <div class="form-group col-5 mt-5 text-left">
                                <asp:Label Text="año" runat="server" />
                                <asp:TextBox ID="TextBox2" CssClass="form-control " runat="server" />
                            </div>
                        </div>
                        <asp:Button CssClass="btn btn-success col-12 mt-2" Text="Cargar" runat="server" />
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