<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionstore.model.Category"%>

<%
List<Category> categories =
(List<Category>)request.getAttribute("categories");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Categories</title>

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

<h1>Manage Categories</h1>

<a href="<%=request.getContextPath()%>/admin/add-category"
class="add-btn">

+ Add Category

</a>

<table>

<tr>

<th>ID</th>

<th>Category Name</th>

<th>Description</th>

<th>Actions</th>

</tr>

<%
for(Category c : categories){
%>

<tr>

<td><%=c.getCategoryId()%></td>

<td><%=c.getCategoryName()%></td>

<td><%=c.getDescription()%></td>

<td>

<a class="edit-btn"
href="<%=request.getContextPath()%>/admin/edit-category?id=<%=c.getCategoryId()%>">

Edit

</a>

<a class="delete-btn"
href="<%=request.getContextPath()%>/admin/delete-category?id=<%=c.getCategoryId()%>"
onclick="return confirm('Delete this category?')">

Delete

</a>

</td>

</tr>

<%
}
%>

</table>

</div>

</body>

</html>