<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.fashionstore.model.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionstore.model.Order"%>

<%
User customer = (User) request.getAttribute("customer");
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Customer Details</title>

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

    <a href="<%=request.getContextPath()%>/admin/customers"
       class="active">Customers</a>

    <a href="<%=request.getContextPath()%>/admin/logout">Logout</a>

</div>

<div class="main">

    <h1>Customer Details</h1>

    <div class="form-box">

        <p><strong>Name :</strong> <%=customer.getFullName()%></p>

        <p><strong>Email :</strong> <%=customer.getEmail()%></p>

        <p><strong>Phone :</strong> <%=customer.getPhone()%></p>

        <p><strong>Address Line 1 :</strong>
        <%=customer.getAddressLine1()%></p>

        <p><strong>Address Line 2 :</strong>
        <%=customer.getAddressLine2()%></p>

        <p><strong>City :</strong>
        <%=customer.getCity()%></p>

        <p><strong>State :</strong>
        <%=customer.getState()%></p>

        <p><strong>Pincode :</strong>
        <%=customer.getPincode()%></p>

        <p><strong>Country :</strong>
        <%=customer.getCountry()%></p>

        <p><strong>Registered On :</strong>
        <%=customer.getCreatedAt()%></p>

        <br>

        <a href="<%=request.getContextPath()%>/admin/customers"
           class="edit-btn">
            Back
        </a>

    </div>

    <br>

    <h2>Order History</h2>

    <table>

        <tr>

            <th>Order ID</th>
            <th>Order Date</th>
            <th>Total Amount</th>
            <th>Payment</th>
            <th>Status</th>

        </tr>

        <%
        if (orders != null && !orders.isEmpty()) {

            for (Order order : orders) {
        %>

        <tr>

            <td><%=order.getOrderId()%></td>

            <td><%=order.getOrderDate()%></td>

            <td>
                ₹<%=String.format("%.2f",
                order.getTotalAmount())%>
            </td>

            <td><%=order.getPaymentMethod()%></td>

            <td><%=order.getOrderStatus()%></td>

        </tr>

        <%
            }

        } else {
        %>

        <tr>

            <td colspan="5"
                style="text-align:center; padding:20px;">

                No orders found for this customer.

            </td>

        </tr>

        <%
        }
        %>

    </table>

</div>

</body>

</html>