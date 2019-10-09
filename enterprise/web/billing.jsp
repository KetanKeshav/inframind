<%-- 
    Document   : billing
    Created on : 20 Nov, 2018, 12:19:04 AM
    Author     : mythr
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>billing</title>
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
.itemidz
{
    position: relative;
    top:90px;
    right: 250px;
}
.itemz1
{
    color: white;
    position: absolute;
    top:20px;
    right: 370px;
    box-sizing: border-box;
    background: rgba(0,0,0,.5);
}
.itemz2
{
    color: white;
    position: absolute;
    top:20px;
    right: 35px;
    box-sizing: border-box;
    background: rgba(0,0,0,.5);
}
.itemz1 input[type="text"],.itemz2 input[type="text"]
{
     border: 0;
   background: none;
   text-align: center;
   border: 2px solid aquamarine;
   outline: none;
   color: white;
   border-radius: 40px;
   transition: 0.25s;
}
.itemz1 input[type="submit"],.itemz2 input[type="submit"]
{
     border: 0;
   background: #44D7A8;
   display: block;
   margin: .5px auto auto .5px;
   text-align: center;
   border: 2px solid aquamarine;
   padding: 5px 5px ;
   outline: none;
   color: white;
   border-radius: 15px;
   transition: 0.25s;
}
.itemz1 input[type="submit"]:hover,.itemz2 input[type="submit"]:hover
{
    background: aquamarine;
}
.enter {
    display: block;
    padding: 50px 600px  25px 150px;
}
.enter input[type = "text"],.enter input[type="number"],.enter input[type="submit"]
{
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
.enter input[type="submit"]:hover
{
    background: aquamarine;
}
.enter input[type="submit"]
{
    background-color: #44D7A8;
}


::placeholder
{
    color: rgba(0, 139, 139,.9);
    opacity: 0.75;
    filter: alpha(opacity=10);
}
.enter input[type = "text"]:focus,.enter input[type="number"]:focus,.enter input[type="submit"]:focus
{
    width: 250px;
    border-color: blue;
}
.subz input[type="submit"]
{
    position: absolute;
    top:80%;
    left:30%;
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
   
   
}
.subz1 input[type="submit"]
{
    position: absolute;
    top:91%;
    left:30%;
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
  
}
.subz2 input[type="submit"]
{
    position: absolute;
    top:91%;
    left:15%;
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
  
}

</style>

<body>
    <div class="dis">
     <div class="enter">
    <form action="billing" method="post">
   
        <table>
            <tr>   <input type="number" name="cid" id="cid" value="${cid}" placeholder="enter customer ID here" required=""></tr></br>
            <tr><input type="text" name="month" id="month" value="${mon}" placeholder="enter month here" required></tr></br>
            <tr>     <input type="number" name="itemid" id="itemid"  placeholder="enter itemID" required=""></tr></br>
            <tr>    <input type="number" name="quantity" id="quantity"  placeholder="enter quantity" required=""></tr></br>
            <tr>   <input type="submit" value="Enter ⏎" id="submit" name="submit"></tr></br>
               
            
        </table>
    </form>
         <form action="viewbill.jsp" method="post">
               <input type="submit" value="End ORDER" id="orderz" name="order">
         </form>
   </div>

        <div class="itemz1">
           
            <table>
                <center>
                <h3>food zone</h3>
                <thead>
                    <th>item ID</th>
                    <th> item </th>
                    <th>Quantity</th>
                </thead>
               
          
                <c:forEach var="temp" items="${item_list}">
                    <form action="update" method="post">
                    <input type="hidden" name="cmd" value="${temp.itemid}"/>
                    <tr><td>${temp.itemid}</td>  <td>${temp.items}</td><td class="quan"><input type="text" name="quan" style="width: 40px;" value="${temp.quantity}"/></td><td><input type="submit" value="Update"/></td></tr>
                        </form>
                </c:forEach>
                </center>
            </table>
             
        </div>
        <div class="itemz2">
            <table>
                <center>
                <h3>non- food zone</h3>
                <thead>
                    <th>ItemID</th>
                    <th>item</th>
                    <th>Quantity</th>
                </thead>
                <c:forEach var="temp1" items="${item_list1}">
                    <form action="update" method="post">
                    <input type="hidden" name="cmd" value="${temp1.itemid}"/>
                    <tr><td>${temp1.itemid}</td>  <td>${temp1.items}</td><td class="quan"><input type="text" name="quan" style="width: 40px;" value="${temp1.quantity}"/></td><td><input type="submit" value="Update"/></td></tr>
                        </form>
                </c:forEach>
                </center>
            </table>
        </div>
            <div class="subz">
            <form action="/enterprise/distributor.jsp" method="post">
                <input type="submit" value="Distributor ">
            </form>
            </div> 
            <div class="subz1">
                <form action="/enterprise/reg_regtime.jsp" method="post">
                    <input type="submit" value="Regtime">
                </form>
            </div>
              <div class="subz2">
                <form action="/enterprise/index.html" method="post">
                    <input type="submit" value="Signout">
                </form>
            </div>
            
</body>
</html>


