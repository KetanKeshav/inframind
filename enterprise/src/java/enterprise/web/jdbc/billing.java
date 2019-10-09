/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enterprise.web.jdbc;

import com.mysql.cj.jdbc.CallableStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mythr
 */
@WebServlet(name = "billing", urlPatterns = {"/billing"})
public class billing extends HttpServlet {
static String month="dec";
static int cid=0;
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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           list(request,response);
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
    try {
        processRequest(request, response);
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(billing.class.getName()).log(Level.SEVERE, null, ex);
    }
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
        try {
            
            cid = Integer.parseInt(request.getParameter("cid"));
            int itemid = Integer.parseInt(request.getParameter("itemid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            month=request.getParameter("month");
           
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enterprise?useSSL=false", "root", "root");
            
            
            CallableStatement calstat=(CallableStatement) con.prepareCall("{call customer1(?,?,?,? )}");
            
            calstat.setInt(1,cid);
            calstat.setInt(2,itemid);
            calstat.setInt(3,quantity);
            calstat.setString(4,month);
            
            ResultSet rs=calstat.executeQuery();
            calstat.close();
            String qr="update items set quantity=(quantity-?) where itemid=?";
            PreparedStatement pst=con.prepareStatement(qr);
             pst.setInt(1,quantity);
            pst.setInt(2,itemid);
            pst.executeUpdate();
            
            con.close();
            pst.close();
            request.setAttribute("mon", month);
            request.setAttribute("cid",cid);
            request.setAttribute("item_list",itemdb.getitems("F"));
            request.setAttribute("item_list1",itemdb.getitems("NF"));
            RequestDispatcher dis=request.getRequestDispatcher("/billing.jsp");
            dis.forward(request,response);
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException ex) {
            Logger.getLogger(billing.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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

    public static void list(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
      request.setAttribute("mon", month);
            request.setAttribute("cid",cid);
        request.setAttribute("item_list",itemdb.getitems("F"));
            request.setAttribute("item_list1",itemdb.getitems("NF"));
            RequestDispatcher dis=request.getRequestDispatcher("/billing.jsp");
            dis.forward(request,response);   
    }

}