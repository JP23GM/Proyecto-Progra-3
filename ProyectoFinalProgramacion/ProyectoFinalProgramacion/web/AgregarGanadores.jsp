<%-- 
    Document   : AgregarGanadores
    Created on : Dec 17, 2022, 11:23:36 AM
    Author     : Julian
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--divinectorweb.com-->
    <head>
        <meta charset="UTF-8" />
        <title>Pure CSS Dropdown Navigation Bar</title>
        <link href="css.css" rel="stylesheet" />
    </head>
    <body>



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
            <h1>AGREGAR GANADORES</h1>

            <form name="ingreso_usuario" action="GanadorDB" method="POST">
                <table>
                    <tr>
                        <td>
                            Cedula
                            <input type="number" name="cedula" value="" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Juego: 
                            <select name="juegoActivo" required>

                                <%
                            
                                Connection conexion = null;
                                Statement stm;
                                ResultSet result = null;
                            
                                try  {

                                Class.forName("org.apache.derby.client.ClientAutoloadedDriver");
                                conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/shopmedb;create=true");

                                stm = conexion.createStatement();
                                String data = "SELECT * FROM APP.JUEGOS WHERE ESTADO = 'activo'";
                                result = stm.executeQuery(data);
                                while(result.next()){
                                 
                                     out.println("<option value='"+ result.getString("nombre") +"'> " + result.getString("nombre") + "</option>");
                                }
                                stm.close();
                                }catch (ClassNotFoundException e1) {
                                out.println("Error: No se encontro el driver de la BD "
                                             + e1.getMessage());
                                } catch (SQLException e2) {
                                out.println("Error: Fallo el SQL " + e2.getMessage());
                                } 
                                finally{
                                try {
                                    if (conexion != null) {
                                         conexion.close();
                                        }
                                        } catch (SQLException e3) {
                                            out.println("ERROR:Fallo al desconectar de la BD: "
                                                    + e3.getMessage());
                                        }
                                }
                                %>


                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Monto
                            <input type="number" name="monto" value="" required />
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

