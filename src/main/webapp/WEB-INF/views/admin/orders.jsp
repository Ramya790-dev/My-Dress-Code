<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionstore.model.Order"%>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Orders</title>

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

    <h1>Manage Orders</h1>

    <table>

        <tr>

            <th>Order ID</th>
            <th>Customer</th>
            <th>Total</th>
            <th>Payment</th>
            <th>Status</th>
            <th>Date</th>
            <th>Action</th>

        </tr>

        <%
        if (orders != null && !orders.isEmpty()) {

            for (Order o : orders) {
        %>

        <tr>

            <form action="<%=request.getContextPath()%>/admin/orders"
                  method="post">

                <td>
                    #<%=o.getOrderId()%>

                    <input type="hidden"
                           name="orderId"
                           value="<%=o.getOrderId()%>">
                </td>

                <td><%=o.getCustomerName()%></td>

                <td>
                    ₹<%=String.format("%,.2f", o.getTotalAmount())%>
                </td>

                <td><%=o.getPaymentMethod()%></td>

                <td>

                    <select name="status">

                        <option value="PLACED"
                            <%= "PLACED".equals(o.getOrderStatus()) ? "selected" : "" %>>
                            PLACED
                        </option>

                        <option value="CONFIRMED"
                            <%= "CONFIRMED".equals(o.getOrderStatus()) ? "selected" : "" %>>
                            CONFIRMED
                        </option>

                        <option value="PACKED"
                            <%= "PACKED".equals(o.getOrderStatus()) ? "selected" : "" %>>
                            PACKED
                        </option>

                        <option value="SHIPPED"
                            <%= "SHIPPED".equals(o.getOrderStatus()) ? "selected" : "" %>>
                            SHIPPED
                        </option>

                        <option value="DELIVERED"
                            <%= "DELIVERED".equals(o.getOrderStatus()) ? "selected" : "" %>>
                            DELIVERED
                        </option>

                        <option value="CANCELLED"
                            <%= "CANCELLED".equals(o.getOrderStatus()) ? "selected" : "" %>>
                            CANCELLED
                        </option>

                    </select>

                </td>

                <td><%=o.getOrderDate()%></td>

                <td>

                    <button type="submit"
                            class="edit-btn">
                        Update
                    </button>

                    &nbsp;

                    <a class="edit-btn"
                       href="<%=request.getContextPath()%>/admin/order-details?id=<%=o.getOrderId()%>">
                        View
                    </a>

                </td>

            </form>

        </tr>

        <%
            }
        } else {
        %>

        <tr>

            <td colspan="7"
                style="text-align:center; padding:20px;">

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