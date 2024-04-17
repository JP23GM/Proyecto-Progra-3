<%-- 
    Document   : AgregarClientes
    Created on : Dec 16, 2022, 4:03:32 PM
    Author     : Julian
--%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title>La comida </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css.css" media="screen" />
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
            <h1>AUDITORIA</h1>
            <table>
                <tr>
                    <td>
                        <%
  // Step 1: Create a File object for the text file
  File file = new File("C:\\Users\\Julian\\Desktop\\bitacora.txt");
  
  // Step 2: Create a BufferedReader to read the file
  BufferedReader reader = new BufferedReader(new FileReader(file));
  
  // Step 3: Read the file line by line and store the contents in a string
  StringBuilder sb = new StringBuilder();
  String line;
  while ((line = reader.readLine()) != null) {
    sb.append(line).append("<br>");
  }
  
  // Step 4: Write the contents of the string to the HTML page
  out.println(sb.toString());
%>
                    </td>
                </tr>
            </table>
           
 

        </div>

    </body>
</html>
