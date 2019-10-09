<%-- 
    Document   : viewbill
    Created on : 24 Nov, 2018, 1:35:30 PM
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
            yo{
                
                position:absolute;
                top:30%;
                left: 25%;
            }
            
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
    <center><h1>All Orders</h1></center>
    <div class="yo"> 
        <table border="2" class="table">
                   <tr>                   
                        <td>CustomerID</td>                       
                        <td>ItemiID</td>                      
                        <td>Quantity</td>
                        <td>Month</td>
                  </tr>
 
                <%
                    
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/enterprise?useSSL=false","root","root");
                    String query="select * from customer";
                   Statement stmt=conn.createStatement();
                   //PreparedStatement stmt=conn.prepareStatement(query);
                    ResultSet rs=stmt.executeQuery(query);
                
                    while (rs.next())
                    {
           %>
           <tr><td><%=rs.getInt("cid")%></td>
               <td><%=rs.getInt("itemid")%></td>
               <td><%=rs.getString("quantity")%></td>
               <td><%=rs.getString("month")%></td> </tr>
         
       <%
                }
                   
                rs.close();
                 stmt.close();
                 conn.close();                
%>
        </table>
    </div>
        <div class="newb">
        <form action="/enterprise/billing" >
            <input type="submit" value ="New Bill">
        </form>
        </div>
    </body>
</html>
