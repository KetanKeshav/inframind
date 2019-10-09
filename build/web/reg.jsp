<%-- 
    Document   : reg
    Created on : 17 Nov, 2018, 7:05:04 PM
    Author     : mythr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@  page import ="java.sql.*"%> 
        <%@ page import="javax.sql.*"%>
        <% 
            String ename=request.getParameter("ename");
            String eoname=request.getParameter("eoname");
             String pnum=request.getParameter("pnum");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
             String cpassword=request.getParameter("cpassword");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enterprise?useSSL=false", "root", "root");
                CallableStatement calstat=con.prepareCall("{call reg(?,?,?,?,?,?,? )}");
                
                calstat.setString(1,ename);
                calstat.setString(2,eoname);
                calstat.setString(3,pnum);
                calstat.setString(4,address);
                calstat.setString(5,email);
                calstat.setString(6,password);
                calstat.setString(7,cpassword);
                   
                ResultSet rs=calstat.executeQuery();
            
                 con.close();
                 calstat.close();
                 //out.println("you data has inserted into the table.");
                 response.sendRedirect("index.html");
                 
                   
                
                
                
           
            %>
    </body>
</html>
