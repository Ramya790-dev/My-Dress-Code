<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Product</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/admin-dashboard.css">

<style>

.form-box{

width:700px;

background:white;

padding:35px;

border-radius:12px;

box-shadow:0 8px 20px rgba(0,0,0,.1);

}

.form-box h2{

margin-bottom:25px;

}

.form-group{

margin-bottom:18px;

}

.form-group label{

display:block;

margin-bottom:8px;

font-weight:600;

}

.form-group input,

.form-group textarea,

.form-group select{

width:100%;

padding:12px;

border:1px solid #ddd;

border-radius:8px;

font-size:15px;

}

.save-btn{

background:#111827;

color:white;

padding:12px 30px;

border:none;

border-radius:8px;

cursor:pointer;

font-size:16px;

}

.save-btn:hover{

background:#2563eb;

}

</style>

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

<div class="form-box">

<h2>Add Product</h2>

<form action="<%=request.getContextPath()%>/admin/add-product"
method="post">

<div class="form-group">

<label>Product Name</label>

<input type="text"
name="name"
required>

</div>

<div class="form-group">

<label>Brand</label>

<input type="text"
name="brand">

</div>

<div class="form-group">

<label>Category</label>

<select name="category">

<option value="1">Men</option>

<option value="2">Women</option>

<option value="3">Kids</option>

<option value="4">Accessories</option>

</select>

</div>

<div class="form-group">

<label>Price</label>

<input type="number"
step="0.01"
name="price">

</div>

<div class="form-group">

<label>Description</label>

<textarea
name="description"
rows="4"></textarea>

</div>

<div class="form-group">

<label>Image URL</label>

<input type="text"
name="image">

</div>

<button class="save-btn">

Save Product

</button>

</form>

</div>

</div>

</body>

</html>