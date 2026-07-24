<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Order" %>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Orders</title>

<link rel="stylesheet"
      href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

body{
    font-family: Arial, sans-serif;
    background:#f5f5f5;
    margin:0;
    padding:0;
}

.container{
    width:90%;
    margin:40px auto;
}

h1{
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#fff;
}

th{
    background:#222;
    color:#fff;
    padding:12px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:hover{
    background:#f2f2f2;
}

.view-btn{
    background:#007bff;
    color:white;
    padding:8px 15px;
    text-decoration:none;
    border-radius:5px;
}

.view-btn:hover{
    background:#0056b3;
}

.no-orders{
    text-align:center;
    padding:30px;
    font-size:18px;
    color:gray;
}

.back-btn{
    display:inline-block;
    margin-bottom:20px;
    padding:10px 18px;
    background:#222;
    color:white;
    text-decoration:none;
    border-radius:5px;
}

.back-btn:hover{
    background:#444;
}

</style>

</head>

<body>

<div class="container">

<a href="<%=request.getContextPath()%>/home" class="back-btn">
← Continue Shopping
</a>

<h1>My Orders</h1>

<table>

<tr>

<th>Order ID</th>
<th>Order Date</th>
<th>Total Amount</th>
<th>Payment Method</th>
<th>Status</th>
<th>Action</th>

</tr>

<%
if(orders != null && !orders.isEmpty()){

    for(Order o : orders){
%>

<tr>

<td>#<%=o.getOrderId()%></td>

<td><%=o.getOrderDate()%></td>

<td>
₹<%=String.format("%,.2f",o.getTotalAmount())%>
</td>

<td>
<%=o.getPaymentMethod()%>
</td>

<td>
<%=o.getOrderStatus()%>
</td>

<td>

<a class="view-btn"
href="<%=request.getContextPath()%>/order-details?id=<%=o.getOrderId()%>">

View Details

</a>

</td>

</tr>

<%
    }

}else{
%>

<tr>

<td colspan="6" class="no-orders">

No Orders Found

</td>

</tr>

<%
}
%>

</table>

</div>

</body>

</html>