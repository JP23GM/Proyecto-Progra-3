<%-- 
    Document   : AgregarJuegos
    Created on : Dec 22, 2022, 2:22:09 PM
    Author     : Julian
--%>

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
            <h1>AGREGAR JUEGOS</h1>

            <form name="ingreso_usuario" action="JuegoBD" method="POST">
                <table>
                    <tr>
                        <td>
                            Codigo
                            <input type="number" name="codigo" value="<%= (int) ((Math.random() * (10000 - 1)) + 1) %>" required readonly=""/>
                        </td>
                       
                    </tr>

                    <tr>
                        <td>
                            Nombre
                            <input type="text" name="nombre" value="" required />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Estado
                            <select name="estado" required="">
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
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
    </body>
</html>
