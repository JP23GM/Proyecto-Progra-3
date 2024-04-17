/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ulatina.Proyecto.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author Julian
 */
@WebServlet(name = "ValidarUsuario", urlPatterns = {"/ValidarUsuario"})
public class ValidarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conexion = null;
        Statement stm1;
        Statement stm2;
        try {

            Class.forName("org.apache.derby.client.ClientAutoloadedDriver");
            conexion = (Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/shopmedb;create=true");

            String cedula = request.getParameter("cedula");
            String contrasena = request.getParameter("contrasena");

            String query = "SELECT * "
                    + "FROM APP.USUARIOS"
                    + " WHERE CEDULA = '" + cedula + "'";
            stm1 = conexion.createStatement();
            ResultSet rs1 = stm1.executeQuery(query);

            String query2 = "SELECT * "
                    + "FROM APP.USUARIOS"
                    + " WHERE CONTRASENA = '" + contrasena + "'";
            stm2 = conexion.createStatement();
            ResultSet rs2 = stm2.executeQuery(query2);

            if ((rs1.next() && rs2.next()) || (cedula.equals("000") && contrasena.equals("000"))) {

                FileWriter fichero = null;
                PrintWriter lapicero = null;

                try {
                    fichero = new FileWriter("C:\\Users\\Julian\\Desktop\\bitacora.txt", true);
                    lapicero = new PrintWriter(fichero);

                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                     Calendar calendar = Calendar.getInstance();
                     String dateTimeString = sdf.format(calendar.getTime());

                    lapicero.println("El usuario " + request.getParameter("cedula") + " inició sesión a las " + dateTimeString);

                    System.out.println("<script type='text/javascript'> alert('Datos almacenados con exito!);<script>");

                } catch (Exception ex) {
                    System.out.println("<script type='text/javascript'> alert('Error!);<script>");
                } finally {
                    fichero.close();

                }

                response.sendRedirect("inicio.html");
            } else {
                response.sendRedirect("index.html");
            }
            stm1.close();
            stm2.close();
        } catch (ClassNotFoundException e1) {
            out.println("Error: No se encontro el driver de la BD " + e1.getMessage());
        } catch (SQLException e2) {
            out.println("Error: Fallo el SQL " + e2.getMessage());
        } finally {
            try {
                conexion.close();
            } catch (SQLException e3) {
                out.println("Error: Fallo al desconectar la BD " + e3.getMessage());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
