<%-- 
    Document   : ActualizarCliente
    Created on : Dec 22, 2022, 12:37:51 AM
    Author     : Julian
--%>
<%@page import="ulatina.Proyecto.clases.Cliente"%>
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
    <body onload="mostrarNumero()">
        <script type="text/javascript">
            function mostrarTarjeta() {
                document.getElementById("tipoTarjeta").style.display = "block";
                document.getElementById("numTarjeta").style.display = "block";
            }
            function ocultarTarjeta() {
                document.getElementById("tipoTarjeta").style.display = "none";
                document.getElementById("numTarjeta").style.display = "none";
            }
            function mostrarNumero() {
                var tr = document.getElementById("numTarjeta");
                var radio = document.getElementById("tarjeta");
                if (radio.checked) {
                    tr.style.display = "block";
                } 
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

            <p>

                <%
Connection conexion = null;
Statement stm;
ResultSet result = null;
Cliente cliente = null;
try {
String id = request.getParameter("id");
//Leemos el driver de Oracle
Class.forName("org.apache.derby.client.ClientAutoloadedDriver");

//Nos conectamos a la BD local
conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/shopmedb;create=true");
stm = conexion.createStatement();

String sql = "SELECT * FROM APP.CLIENTES WHERE CAST(cedula AS VARCHAR(128)) = '"+ id + "'";
result = stm.executeQuery(sql);
//Decimos que nos hemos conectado 
 while (result.next()) {
        cliente = new Cliente(result.getString("cedula"), 
        result.getString("nombre"), 
        result.getString("tipo"),
        result.getString("pago"),
        result.getString("tarjeta"),
        result.getString("numero"));

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

            <form name="ingreso_usuario" action="ActualizarCliente" method="POST">
                <table>
                    <tr>
                        <td> Cedula 
                            <input type="number" name="cedula" value="<%= cliente.getCedula() %>" required min="0" readonly=""/>
                        </td>
                    </tr>
                    <tr>
                        <td> Nombre
                            <input type="text" name="nombre" value="<%= cliente.getNombre() %>" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tipo
                            <select name="tipo" required>
                                <% if(cliente.getTipo().equals("gold")){
                                        out.print("<option value='gold' selected> Gold</option> "
                                                + " <option value='platinum'> Platinum</option> "
                                                + " <option value='classic'> Classic</option> "
                                                );
                                    } else if(cliente.getTipo().equals("platinum")){
                                        out.print("<option value='gold' > Gold</option> "
                                                + " <option value='platinum' selected> Platinum</option> "
                                                + " <option value='classic'> Classic</option> "
                                                );
                                    } else{
                                        out.print("<option value='gold' > Gold</option> "
                                                + " <option value='platinum'> Platinum</option> "
                                                + " <option value='classic' selected> Classic</option> "
                                                );
                                    } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Modo de Pago 
                            <%
                              if(cliente.getPago().equals("efectivo")){
                              out.print("<input type='radio' name='pago' value='efectivo' id='efectivo' onclick='ocultarTarjeta()' checked=''/>Efectivo"
                              + "<input type='radio' name='pago' value='tarjeta' id='tarjeta' onclick='mostrarTarjeta()' />Tarjeta");
                                } else{
                                out.print("<input type='radio' name='pago' value='efectivo' id='efectivo' onclick='ocultarTarjeta()' />Efectivo"
                              + "<input type='radio' name='pago' value='tarjeta' id='tarjeta' onclick='mostrarTarjeta()' checked=''/>Tarjeta"
                              
                              );
                                }  
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%
                            if(cliente.getPago().equals("tarjeta") && cliente.getTarjeta().equals("debito")){
                            out.print("<tr id='tipoTarjeta' >"
                            + "<td>"
                            + "Tipo de tarjeta"
                            + "<input type='radio' name='tipotarjeta' value='debito' id='debito' checked=''/>Debito"
                            + "<input type='radio' name='tipotarjeta' value='credito' id='credito' />Credito"
                            + "</td>"
                            + "</tr>");
                                }else if(cliente.getPago().equals("tarjeta") && cliente.getTarjeta().equals("credito")){
                                out.print("<tr id='tipoTarjeta' >"
                            + "<td>"
                            + "Tipo de tarjeta"
                            + "<input type='radio' name='tipotarjeta' value='debito' id='debito' />Debito"
                            + "<input type='radio' name='tipotarjeta' value='credito' id='credito' checked=''/>Credito"
                            + "</td>"
                            + "</tr>");
                                }else{
                                out.print("<tr id='tipoTarjeta' style='display: none'>"
                            + "<td>"
                            + "Tipo de tarjeta"
                            + "<input type='radio' name='tipotarjeta' value='debito' id='debito' />Debito"
                            + "<input type='radio' name='tipotarjeta' value='credito' id='credito' />Credito"
                            + "</td>"
                            + "</tr>");
                                }
                            %>
                        </td>
                    </tr>

                    <tr id="numTarjeta" style="display: none">
                        <td> Numero de tarjeta 
                            <input type="number" name="numTarjeta" id="numTarjeta" value="<%= cliente.getNumero() %>"/>
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
