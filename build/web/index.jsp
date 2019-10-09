<%-- 
    Document   : index
    Created on : 19 Nov, 2018, 6:44:09 PM
    Author     : mythr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head> 
       <body>
        <%@page import ="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%
            //Start
           String email=request.getParameter("email");
            String password=request.getParameter("password");
            try
            {
           Class.forName("com.mysql.jdbc.Driver").newInstance();
          java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enterprise?useSSL=false", "root", "root");
               String Query="select * from reg where email=? and password=?";
               PreparedStatement psm=con.prepareStatement(Query);
               psm.setString(1, email);
               psm.setString(2, password);
               ResultSet rs=psm.executeQuery();
               if(rs.next())
               {
                   response.sendRedirect("billing");
               }
               else
            {
                 out.println("Login failed! TRY again");
            }
            }
        catch(Exception e)
        {
            out.println(e);
        }
%>
    </body>
</html>
