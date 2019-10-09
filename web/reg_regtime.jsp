<%-- 
    Document   : reg_regtime
    Created on : 27 Nov, 2018, 8:47:48 AM
    Author     : mythr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Details Page</title>
        <link rel="icon" href="images/infinity.png" type="image/x-icon">
    </head>
    <body>
        <style>
            body{
      margin: 0;
    padding: 0;
    color: white;
    background: url("images/bg.png");
    background-size: cover;
    font-family: Arial, Helvetica, sans-serif;
}
            h1{ color:mediumaquamarine; }
            
            .newb input[type="submit"]
        {
             position: absolute;
    top:40%;
    left:22%;
     border: 0;
   background: aquamarine;
   display: block;
   margin: 10px auto;
   text-align: center;
   border: 2px solid aquamarine;
   padding: 10px 30px ;
   width : 200px;
   outline: none;
   color: white;
   border-radius: 30px;
   transition: 0.25s;
   opacity: 0.85;
    filter: alpha(opacity=10);
}
         </style>
        
          <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
    <center><h1>reg Details.</h1></center>
        
        <table border="2" class="table">
                   <tr>                   
                        <td>datetime</td>                       
                        <td>email</td>                      
                  </tr>
 
                <%
                    
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/enterprise?useSSL=false","root","root");
                    String query="select * from reg_rep";
                   Statement stmt=conn.createStatement();
                   //PreparedStatement stmt=conn.prepareStatement(query);
                    ResultSet rs=stmt.executeQuery(query);
                
                    while (rs.next())
                    {
           %>
           <tr><td><%=rs.getString("reg_time")%></td>
               <td><%=rs.getString("email")%></td>
                </tr>
         
       <%
                }
                   
                rs.close();
                 stmt.close();
                 conn.close();                
%>
        </table>
        <div class="newb">
        <form action="/enterprise/billing" >
            <input type="submit" value ="bill">
        </form>
        </div>
    </body>
</html>
