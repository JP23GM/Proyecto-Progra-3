<%-- 
    Document   : ActualizarUsuario
    Created on : Dec 21, 2022, 7:48:46 PM
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
        <link href="css.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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

        <div id="content"> 
            <h1>ACTUALIZAR USUARIO</h1>

            <p>

                <%
Connection conexion = null;
Statement stm;
ResultSet result = null;
Usuario usuario = null;
try {
String id = request.getParameter("id");
//Leemos el driver de Oracle
Class.forName("org.apache.derby.client.ClientAutoloadedDriver");

//Nos conectamos a la BD local
conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/shopmedb;create=true");
stm = conexion.createStatement();

String sql = "SELECT * FROM APP.USUARIOS WHERE CAST(cedula AS VARCHAR(128)) = '"+ id + "'";
result = stm.executeQuery(sql);
//Decimos que nos hemos conectado 
 while (result.next()) {
        usuario = new Usuario(result.getString("cedula"), 
        result.getString("nombre"), 
        result.getString("genero"),
        result.getString("antiguedad"),
        result.getString("perfil"),
        result.getString("contrasena"),
        result.getString("salario"));

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

            <form name="ingreso_usuario" action="ActualizarUsuarioBD" method="POST">
                <table>
                    <tr>
                        <td> Nombre
                            <input type="text" name="nombre" value="<%= usuario.getNombre() %>" required />
                        </td>
                    </tr>
                    <tr>
                        <td> Cedula 
                            <input type="number" name="cedula" value="<%= usuario.getCedula() %>" required min="0" readonly=""/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Genero
                            <select name="genero" required onchange="calcularSalario()">
                                <% if((usuario.getGenero()).equals("femenino")){
                                        out.print("<option value='femenino' selected> Femenino</option> "
                                                + " <option value='masculino'> Masculino</option> "
                                                );
                                    } %>

                                <% if((usuario.getGenero()).equals("masculino")){
                                            out.print("<option value='femenino' > Femenino</option> "
                                                    + " <option value='masculino' selected> Masculino</option> "
                                                    );
                                        } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Años de antigüedad 
                            <input type="number" name="antiguedad" id="antiguedad" value="<%= usuario.getAntiguedad() %>" required min="0" onkeyup="calcularSalario()"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Perfil
                            <select name="perfil" id="perfil" onclick="calcularSalario()">
                                <% if((usuario.getPerfil()).equals("supervisor")){
                                        out.print("<option value='supervisor' selected> Supervisor</option> "
                                                + " <option value='coordinador'> Coordinador</option> "
                                                + " <option value='plataforma'> Plataforma</option> "
                                                );
                                    } %>

                                <% if((usuario.getPerfil()).equals("coordinador")){
                                           out.print("<option value='supervisor' > Supervisor</option> "
                                                   + " <option value='coordinador' selected> Coordinador</option> "
                                                   + " <option value='plataforma'> Plataforma</option> "
                                                   );
                                       } %>

                                <% if((usuario.getPerfil()).equals("plataforma")){
                                   out.print("<option value='supervisor' > Supervisor</option> "
                                           + " <option value='coordinador'> Coordinador</option> "
                                           + " <option value='plataforma' selected> Plataforma</option> "
                                           );
                               } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Contraseña
                            <input type="password" name="contrasena" value="<%= usuario.getContrasena() %>" required />
                        </td>
                    </tr>
                    <tr>
                        <td> Salario
                            <input type="text" name="salario" id="salario" value="<%= usuario.getSalario() %>" readonly="" />
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
