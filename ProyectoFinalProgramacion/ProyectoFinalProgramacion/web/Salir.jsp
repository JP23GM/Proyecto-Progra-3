<%-- 
    Document   : Salir
    Created on : 19/12/2022, 02:32:45 PM
    Author     : campo
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css.css" rel="stylesheet">
    </head>
    <body>
        <div id="content">
            <form action="CerrarSesion" name="salir" method="POST">
                <table>
                    <tr>
                        <td>¿Desea salir?</td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Si" name="opcion" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Cancelar" name="opcion" /></td>
                    </tr>
                </table>
                
                
                
                

            </form>
        </div>
            
                
    </body>
</html>
