<%-- 
    Document   : AgregarClientes
    Created on : Dec 16, 2022, 4:03:32 PM
    Author     : Julian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title>Agregar Clientes </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css.css" media="screen" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    </head>



    <body >
        <script type="text/javascript">
            function mostrarTarjeta() {
                document.getElementById("tipoTarjeta").style.display = "block";
                document.getElementById("numTarjeta").style.display = "block";
            }
            function ocultarTarjeta() {
                document.getElementById("tipoTarjeta").style.display = "none";
                document.getElementById("numTarjeta").style.display = "none";
            }
            
        </script>



        <nav class="nav-area">
            <ul >
                <li>
                    <a href="inicio.html">Inicio</a>
                </li>
                <li>
                    <a href="#">Juegos</a>
                    <ul>
                        <li>
                            <a href="AgregarJuegos.jsp">Agregar</a>
                        </li>
                        <li>
                            <a href="MostrarJuegos.jsp">Mostrar</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Personas</a>
                    <ul>


                        <li>
                            <a href="#">Clientes</a>
                            <ul>
                                <li>
                                    <a href="AgregarClientes.jsp">Agregar</a>
                                </li>
                                <li>
                                    <a href="MostrarClientes.jsp">Mostrar</a>
                                </li>


                            </ul>
                        </li>
                        <li>
                            <a href="#">Ganadores</a>
                            <ul>
                                <li>
                                    <a href="AgregarGanadores.jsp">Agregar</a>
                                </li>
                                <li>
                                    <a href="MostrarGanadores.jsp">Mostrar</a>
                                </li>


                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Usuarios</a>
                    <ul>
                        <li>
                            <a href="AgregarUsuarios.jsp">Agregar</a>
                        </li>
                        <li>
                            <a href="MostrarUsuarios.jsp">Mostrar</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="Auditoria.jsp">Auditoria</a>
                </li>
                <li>
                    <a href="AcercaDe.html">Acerca de</a>
                </li>
                <li>
                    <a href="Salir.jsp">Salir</a>
                </li>
            </ul>
        </nav>



        <div id="content"> 
            <h1>AGREGAR CLIENTES</h1>

            <form name="ingreso_usuario" action="ClienteDB" method="POST">
                <table>
                    <tr>
                        <td> Cedula 
                            <input type="number" name="cedula" value="" required min="0" />
                        </td>
                    </tr>
                    <tr>
                        <td> Nombre
                            <input type="text" name="nombre" value="" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tipo
                            <select name="tipo" required>
                                <option value="gold">Gold</option>
                                <option value="platinum">Platinum</option>
                                <option value="classic">Classic</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Modo de Pago 
                            <input type="radio" name="pago" value="efectivo" id="efectivo" onclick="ocultarTarjeta()"/>Efectivo
                            <input type="radio" name="pago" value="tarjeta" id="tarjeta" onclick="mostrarTarjeta()"/>Tarjeta
                        </td>
                    </tr>
                    <tr id="tipoTarjeta" style="display: none">
                        <td>
                            Tipo de tarjeta
                            <input type="radio" name="tipotarjeta" value="debito" id="debito" />Debito
                            <input type="radio" name="tipotarjeta" value="credito" id="credito" />Credito
                        </td>
                    </tr>
                    <tr id="numTarjeta" style="display: none" >
                        <td> Numero de tarjeta 
                            <input type="number" name="numTarjeta" id="numTarjeta" value=""  min="0" />
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Ingresar" name="ingresar"/></td>
                        <td><input type="reset" value="Cancelar" name="cancelar" /></td>
                    </tr>
                </table>        
            </form>
        </div>
    </body>
</html>
