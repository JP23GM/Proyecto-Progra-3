<%-- 
    Document   : AgregarUsuarios
    Created on : Dec 17, 2022, 11:35:32 AM
    Author     : Julian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--divinectorweb.com-->
    <head>
        <meta charset="UTF-8">
        <title>Pure CSS Dropdown Navigation Bar</title>
        <link href="css.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    </head>
    <body>
        <script type="text/javascript">
            function calcularSalario() {
                let salario = 0;
                let perfil = $("#perfil").val();
                let antiguedad = $("#antiguedad").val();

                switch (perfil) {
                    case "supervisor":
                        salario = 3500 + 20 * antiguedad;
                        break;
                    case "coordinador":
                        salario = 2000 + 15 * antiguedad;
                        break;
                    default:
                        salario = 750 + 10 * antiguedad;
                        break;
                }
                $("#salario").val("$" + salario);
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
            <h1>AGREGAR USUARIOS</h1>

            <form name="ingreso_usuario" action="UsuarioDB" method="POST">
                <table>
                    <tr>
                        <td> Nombre
                            <input type="text" name="nombre" value="" required />
                        </td>
                    </tr>
                    <tr>
                        <td> Cedula 
                            <input type="number" name="cedula" value="" required min="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Genero
                            <select name="genero" required>
                                <option value="femenino">Femenino</option>
                                <option value="masculino">Masculino</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Años de antigüedad 
                            <input type="number" name="antiguedad" id="antiguedad" value="" required min="0" onkeyup="calcularSalario()"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Perfil
                            <select name="perfil" id="perfil" onclick="calcularSalario()" required="">
                                <option value="supervisor">Supervisor</option>
                                <option value="coordinador">Coordinador</option>
                                <option value="plataforma">Plataforma</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Contraseña
                            <input type="password" name="contrasena" value="" required />
                        </td>
                    </tr>
                    <tr>
                        <td> Salario
                            <input type="text" name="salario" id="salario" value="" readonly="" required=""/>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Ingresar" name="ingresar" /></td>
                        <td><input type="reset" value="Cancelar" name="cancelar" /></td>
                    </tr>
                </table>        
            </form>
        </div>
    </body>
</html>

