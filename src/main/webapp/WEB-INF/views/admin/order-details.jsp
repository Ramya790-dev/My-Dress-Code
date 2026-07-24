<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionstore.model.Order"%>
<%@ page import="com.fashionstore.model.OrderItem"%>

<%
Order order = (Order)request.getAttribute("order");
List<OrderItem> items =
(List<OrderItem>)request.getAttribute("items");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/admin-dashboard.css">

</head>

<body>

<div class="sidebar">

<h2>MY DRESS CODE</h2>

<a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a>

<a href="<%=request.getContextPath()%>/admin/products">Products</a>

<a href="<%=request.getContextPath()%>/admin/categories">Categories</a>

<a href="<%=request.getContextPath()%>/admin/orders">Orders</a>

<a href="<%=request.getContextPath()%>/admin/customers">Customers</a>

<a href="<%=request.getContextPath()%>/admin/logout">Logout</a>

</div>

<div class="main">

<h1>Order Details</h1>

<div class="form-box">

<h2>Order #<%=order.getOrderId()%></h2>

<p><strong>Status :</strong>
<%=order.getOrderStatus()%></p>

<p><strong>Payment :</strong>
<%=order.getPaymentMethod()%></p>

<p><strong>Total :</strong>
₹<%=String.format("%.2f",order.getTotalAmount())%></p>

<p><strong>Date :</strong>
<%=order.getOrderDate()%></p>

</div>

<br>

<table>

<tr>

<th>Product</th>

<th>Size</th>

<th>Quantity</th>

<th>Price</th>

<th>Subtotal</th>

</tr>

<%
for(OrderItem item : items){
%>

<tr>

<td><%=item.getProductName()%></td>

<td><%=item.getSize()%></td>

<td><%=item.getQuantity()%></td>

<td>₹<%=item.getUnitPrice()%></td>

<td>₹<%=item.getSubtotal()%></td>

</tr>

<%
}
%>
<%

%>

</table>

<br>

<form action="<%=request.getContextPath()%>/admin/update-order-status"
      method="post">

    <input type="hidden"
           name="orderId"
           value="<%=order.getOrderId()%>">

    <select name="status">

        <option value="PLACED"
        <%= "PLACED".equals(order.getOrderStatus()) ? "selected" : "" %>>
        PLACED
        </option>

        <option value="CONFIRMED"
        <%= "CONFIRMED".equals(order.getOrderStatus()) ? "selected" : "" %>>
        CONFIRMED
        </option>

        <option value="PACKED"
        <%= "PACKED".equals(order.getOrderStatus()) ? "selected" : "" %>>
        PACKED
        </option>

        <option value="SHIPPED"
        <%= "SHIPPED".equals(order.getOrderStatus()) ? "selected" : "" %>>
        SHIPPED
        </option>

        <option value="OUT_FOR_DELIVERY"
        <%= "OUT_FOR_DELIVERY".equals(order.getOrderStatus()) ? "selected" : "" %>>
        OUT FOR DELIVERY
        </option>

        <option value="DELIVERED"
        <%="DELIVERED".equals(order.getOrderStatus()) ? "selected" : "" %>>
        DELIVERED
        </option>

    </select>

    <button type="submit" class="save-btn">
    Update Status
    </button>

</form>

    


</div>

</body>

</html>