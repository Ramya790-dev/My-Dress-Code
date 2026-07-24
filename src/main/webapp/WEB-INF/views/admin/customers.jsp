<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionstore.model.User"%>

<%
List<User> customers = (List<User>) request.getAttribute("customers");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Customers</title>

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

<h1>Customers</h1>

<table>

<tr>

    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>City</th>
    <th>Actions</th>

</tr>

<%
if(customers != null){

    for(User user : customers){
%>

<tr>

    <td><%=user.getUserId()%></td>

    <td><%=user.getFullName()%></td>

    <td><%=user.getEmail()%></td>

    <td><%=user.getPhone()%></td>

    <td><%=user.getCity()%></td>

    <td>

        <a class="edit-btn"
        href="<%=request.getContextPath()%>/admin/customer-details?id=<%=user.getUserId()%>">

        View

        </a>

    </td>

</tr>

<%
    }
}
%>

</table>

</div>

</body>

</html>