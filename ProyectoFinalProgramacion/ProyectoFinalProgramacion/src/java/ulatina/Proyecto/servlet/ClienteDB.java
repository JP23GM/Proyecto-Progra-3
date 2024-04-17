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
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import ulatina.Proyecto.clases.Cliente;
/**
 *
 * @author Julian
 */
@WebServlet(name = "ClienteDB", urlPatterns = {"/ClienteDB"})
public class ClienteDB extends HttpServlet {

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
        Statement stm;

        try {
            Class.forName("org.apache.derby.client.ClientAutoloadedDriver");
            conexion = (Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/shopmedb;create=true", "app", "app");

            String cedula =  request.getParameter("cedula");
            String nombre = request.getParameter("nombre");
            String tipo = request.getParameter("tipo");
            String pago = request.getParameter("pago");
            String tarjeta = request.getParameter("tipotarjeta");
            String numero = request.getParameter("numTarjeta");

            Cliente cliente = new Cliente(cedula, nombre, tipo, pago, tarjeta, numero);
            
            String query= "";
            if (pago.equals("efectivo")) {
                query = "insert into APP.CLIENTES values('"
                    + cliente.getCedula() + "', '"
                    + cliente.getNombre() + "', '"
                    + cliente.getTipo() + "', '"
                    + cliente.getPago() + "', '"
                    + "---" + "', '"
                    + "---" +  "')";
            } else {
                query = "insert into APP.CLIENTES values('"
                    + cliente.getCedula() + "', '"
                    + cliente.getNombre() + "', '"
                    + cliente.getTipo() + "', '"
                    + cliente.getPago() + "', '"
                    + cliente.getTarjeta() + "', '"
                    + cliente.getNumero() +  "')";
            }
            
            

            

            stm = conexion.createStatement();
            stm.execute(query);
            stm.close();
            
            
        } catch (ClassNotFoundException e1) {
            out.println("Error: No se encontro el driver de la BD " + e1.getMessage());
        } catch (SQLException e2) {
            out.println("Error: Fallo el SQL " + e2.getMessage());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                    response.sendRedirect("MostrarClientes.jsp");
                }

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
