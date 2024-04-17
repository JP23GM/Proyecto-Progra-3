<%-- 
    Document   : MostrarUsuarios
    Created on : Dec 16, 2022, 3:43:45 PM
    Author     : Julian
--%>
<%@page import="ulatina.Proyecto.clases.Usuario"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <h1>MOSTRAR USUARIOS</h1>
            <p>

                <%
                    Connection conexion = null;
                    Statement stm;
                    ResultSet result = null;
                    Usuario usuario = null;

                     try {
                         Class.forName("org.apache.derby.client.ClientAutoloadedDriver");
                                    conexion = (Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/shopmedb;create=true", "app", "app");

                                    stm = conexion.createStatement();
                                    String sql = "SELECT * FROM  APP.USUARIOS";
                                    result = stm.executeQuery(sql);

                                    out.println("<table border='1'>"
                                            + "<tr>"
                                                + "<td> Cedula </td>"
                                                + "<td> Nombre </td>"
                                                + "<td> Genero </td>"
                                                + "<td> Antiguedad </td>"
                                                + "<td> Perfil </td>"
                                                + "<td> Contraseña </td>"
                                                + "<td> Salario </td>"
                                            + "</tr>");
                                while (result.next()) {
                                            usuario = new Usuario(result.getString("cedula"), 
                                            result.getString("nombre"), 
                                            result.getString("genero"), 
                                            result.getString("antiguedad"), 
                                            result.getString("perfil"), 
                                            result.getString("contrasena"), 
                                            result.getString("salario"));
                                                 out.println("<tr>"
                                                        + "<td> "+ usuario.getCedula() +" </td>"
                                                        + "<td> "+ usuario.getNombre()+" </td>"
                                                        + "<td> "+ usuario.getGenero()+" </td>"
                                                        + "<td> "+ usuario.getAntiguedad()+" </td>"
                                                        + "<td> "+ usuario.getPerfil()+" </td>"
                                                        + "<td> "+ usuario.getContrasena()+" </td>"
                                                        + "<td> "+ usuario.getSalario()+" </td>"
                                                        + "<td> <a href='ActualizarUsuario.jsp?id=" + usuario.getCedula() +"'> Actualizar </a> </td>"
                                                        + "<td> <a href='BorrarUsuario?id=" + usuario.getCedula() +"'> Borrar </a> </td>"
                                                        + "</tr>");
                                            }
                                      out.println( "</table >");
                                      stm.close();
                                      } catch (ClassNotFoundException e1) {
                                    //Error si no puedo leer el driver de Oracle 
                                    out.println("ERROR:No encuentro el driver de la BD: "
                                            + e1.getMessage());
                                } catch (SQLException e2) {
                                    //Error SQL: login/passwd mal
                                    out.println("ERROR:Fallo en SQL: " + e2.getMessage());
                                } finally {

                                    //Finalmente desconecto de la BD
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
            </p>

        </div>
    </body>
</html>
