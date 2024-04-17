<%-- 
    Document   : ActualizarJuego
    Created on : Dec 21, 2022, 3:22:03 PM
    Author     : Julian
--%>
<%@page import="ulatina.Proyecto.clases.Juego"%>
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
            <h1>ACTUALIZAR JUEGO</h1>

            <p>

                <%
Connection conexion = null;
Statement stm;
ResultSet result = null;
Juego juego = null;
try {
String id = request.getParameter("id");
//Leemos el driver de Oracle
Class.forName("org.apache.derby.client.ClientAutoloadedDriver");

//Nos conectamos a la BD local
conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/shopmedb;create=true");
stm = conexion.createStatement();

String sql = "SELECT * FROM APP.JUEGOS WHERE CAST(codigo AS VARCHAR(128)) = '"+ id + "'";
result = stm.executeQuery(sql);
//Decimos que nos hemos conectado 
 while (result.next()) {
        juego = new Juego(result.getString("codigo"), 
        result.getString("nombre"), 
        result.getString("estado"));

        }
stm.close();
}
catch (ClassNotFoundException e1) {
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
            <form name="ingreso_usuario" action="ActualizarJuegoBD" method="POST">
                <table>
                    <tr>
                        <td>
                            Codigo
                            <input type="number" name="codigo" value="<%= juego.getCodigo() %>" readonly=""/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nombre
                            <input type="text" name="nombre" value="<%= juego.getNombre() %>" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Estado
                            <select name="estado" required>
                                <% if((juego.getEstado()).equals("activo")){
                                        out.print("<option value='activo' selected> Activo</option> "
                                                + " <option value='inactivo'> Inactivo</option> "
                                                );
                                    } %>

                                <% if((juego.getEstado()).equals("inactivo")){
                                            out.print("<option value='activo' > Activo</option> "
                                                    + " <option value='inactivo' selected> Inactivo</option> "
                                                    );
                                        } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Ingresar" name="ingresar" /></td>
                        <td><input type="reset" value="Cancelar" name="cancelar" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
