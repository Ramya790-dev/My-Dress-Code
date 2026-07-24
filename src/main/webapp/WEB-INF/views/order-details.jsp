<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionstore.model.Order"%>
<%@ page import="com.fashionstore.model.OrderItem"%>

<%
Order order = (Order) request.getAttribute("order");
List<OrderItem> items =
        (List<OrderItem>) request.getAttribute("items");

double grandTotal = 0;
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f5f5f5;
}

.container{
    width:90%;
    margin:40px auto;
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.back-btn{
    text-decoration:none;
    background:#1d2433;
    color:white;
    padding:10px 18px;
    border-radius:6px;
}

.card{
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
    margin-bottom:30px;
}

.info{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:15px;
}

.info p{
    font-size:16px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:white;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

th{
    background:#1d2433;
    color:white;
    padding:14px;
}

td{
    padding:14px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

.total-row{
    font-weight:bold;
    background:#f8f8f8;
}

</style>

</head>

<body>

<div class="container">

<div class="header">

<h1>Order Details</h1>

<a href="<%=request.getContextPath()%>/my-orders"
class="back-btn">

← Back to My Orders

</a>

</div>

<div class="card">

<div class="info">

<p>
<strong>Order ID :</strong>
#<%=order.getOrderId()%>
</p>

<p>
<strong>Order Date :</strong>
<%=order.getOrderDate()%>
</p>

<p>
<strong>Payment :</strong>
<%=order.getPaymentMethod()%>
</p>

<p>
<strong>Status :</strong>
<%=order.getOrderStatus()%>
</p>

</div>

</div>

<table>

<tr>

<th>Product</th>

<th>Quantity</th>

<th>Unit Price</th>

<th>Subtotal</th>

</tr>

<%
if(items != null){

for(OrderItem item : items){

grandTotal += item.getSubtotal();
%>

<tr>

<td>

<%=item.getProductName()%>

</td>

<td>

<%=item.getQuantity()%>

</td>

<td>

₹<%=String.format("%,.2f",
item.getUnitPrice())%>

</td>

<td>

₹<%=String.format("%,.2f",
item.getSubtotal())%>

</td>

</tr>

<%
}
}
%>

<tr class="total-row">

<td colspan="3">

Grand Total

</td>

<td>

₹<%=String.format("%,.2f",grandTotal)%>

</td>

</tr>

</table>

</div>

</body>

</html>