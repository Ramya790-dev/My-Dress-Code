<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionstore.model.Product"%>

<%

List<Product> products =
(List<Product>)request.getAttribute("products");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Products</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/admin-dashboard.css">

</head>

<body>

<div class="sidebar">

<h2>MY DRESS CODE</h2>

<a href="<%=request.getContextPath()%>/admin/dashboard">
Dashboard
</a>

<a href="<%=request.getContextPath()%>/admin/products">
Products
</a>

<a href="<%=request.getContextPath()%>/admin/categories">
Categories
</a>

<a href="<%=request.getContextPath()%>/admin/orders">
Orders
</a>

<a href="<%=request.getContextPath()%>/admin/customers">
   Customers
</a>

<a href="<%=request.getContextPath()%>/admin/logout">
Logout
</a>

</div>

<div class="main">

<h1>Manage Products</h1>

<a href="<%=request.getContextPath()%>/admin/add-product" class="add-btn">

+ Add Product

</a>

<table>

<tr>

<th>ID</th>

<th>Image</th>

<th>Name</th>

<th>Price</th>

<th>Brand</th>

<th>Actions</th>

</tr>

<%

for(Product p:products){

%>

<tr>

    <td><%=p.getProductId()%></td>

    <td>
        <img src="<%=request.getContextPath()%><%=p.getImageUrl()%>" width="70">
    </td>

    <td><%=p.getProductName()%></td>

    <td>
        ₹<%=String.format("%,.0f", p.getPrice())%>
    </td>

    <td><%=p.getBrand()%></td>

    <td>

        <a class="edit-btn"
           href="<%=request.getContextPath()%>/admin/edit-product?id=<%=p.getProductId()%>">
            Edit
        </a>

        <a class="delete-btn"
           href="<%=request.getContextPath()%>/admin/delete-product?id=<%=p.getProductId()%>"
           onclick="return confirm('Delete this product?')">
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