<%-- 
    Document   : distributor
    Created on : 25 Nov, 2018, 4:46:23 PM
    Author     : mythr
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>distributor</title>
        <link rel="icon" href="images/infinity.png" type="image/x-icon">
    </head>
    <style>
           body
{
    margin: 0;
    padding: 0;
    background: url("images/bg.png");
    background-size: cover;
    font-family: Arial, Helvetica, sans-serif;
}
 .distin input[type = "number"]
{
    position: absolute;
    top:20%;
    left:20%;
     border: 0;
   background: none;
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
}
.distin input[type="submit"]
{
     position: absolute;
    top:30%;
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
 .distin input[type = "number"]:focus
 {
      width: 250px;
    border-color: blue;
 }
.distin input[type="submit"]:hover
{
    background-color: #3F26BF;
}
.itemz{
    color:white;
     border: 0;
   background: none;
   display: block;
   margin: 10px auto;
   text-align: center;
   border: 2px solid aquamarine;
   padding: 10px 30px ;
   outline: none;
   color: white;
   border-radius: 30px;
   transition: 0.25s;
}

        
        .itemz{
            position: absolute;
    top: 25%;
    right: 25px;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 80px 40px;
    background: rgba(0,0,0,.5);
        }
        .yoman{
           column-gap: 30px;
           -webkit-column-gap: 30px;
           -moz-column-gap: 30px;
        }
        .distsub input[type="submit"]
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
 .distin input[type = "number"]:focus
 {
      width: 250px;
    border-color: blue;
 }
.distin input[type="submit"]:hover
{
    background-color: #3F26BF;
}
.itemz{
    color:white;
     border: 0;
   background: none;
   display: block;
   margin: 10px auto;
   text-align: center;
   border: 2px solid aquamarine;
   padding: 10px 30px ;
   outline: none;
   color: white;
   border-radius: 30px;
   transition: 0.25s;
        }
    </style>
    <body>
        <div class="distin">
        <form action="dist" method ="post">
            <input type="number" placeholder="Enter the itemid" name="itemid"/> 
            <input type="submit" value="enter"/> 
          
        </form>  
</div>
    
      <div class="itemz">
            <table  class="yoman">
                <center>
                <h3>distributors</h3>
                <thead>
                    <th>distributorID</th>
                    <th>distributorNAME</th>
                    <th>phone</th>
                    <th>itemid</th>
                    
                </thead>
                <c:forEach var="temp" items="${disid}">
          
               
                    <tr><td>${temp.disid}</td>  <td>${temp.disname}</td><td>"${temp.phone}"</td><td>"${temp.itemid}"</td></tr>
                       
                </c:forEach>
                </center>
            </table>
        </div>
         </table>
         <div  class="distsub">
        <form action="/enterprise/billing"  >
            <input type="submit" value ="New Bill" >
        </form>
         </div>
    </body>
</html>
