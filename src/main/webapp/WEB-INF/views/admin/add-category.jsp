<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Category</title>

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

<div class="form-box">

<h2>Add Category</h2>

<form action="<%=request.getContextPath()%>/admin/add-category"
method="post">

<div class="form-group">

<label>Category Name</label>

<input type="text"
name="name"
required>

</div>

<div class="form-group">

<label>Description</label>

<textarea
name="description"
rows="5"
required></textarea>

</div>

<button class="save-btn">

Save Category

</button>

</form>

</div>

</div>

</body>

</html>