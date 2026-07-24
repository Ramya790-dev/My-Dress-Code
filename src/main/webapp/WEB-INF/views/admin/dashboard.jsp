<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/admin-dashboard.css">

</head>

<body>

<div class="sidebar">

    <h2>MY DRESS CODE</h2>

    <a href="#">Dashboard</a>

	<a href="<%=request.getContextPath()%>/admin/products">
	    Products
	</a>
	
	<a href="<%=request.getContextPath()%>/admin/categories">Categories</a>
	
    <a href="<%=request.getContextPath()%>/admin/orders">Orders</a>

    <a href="<%=request.getContextPath()%>/admin/customers">Customers</a>

    
    <a href="<%=request.getContextPath()%>/admin/logout">
        Logout
    </a>

</div>

<div class="main">

    <h1>Admin Dashboard</h1>

    <div class="cards">

        <div class="card">

            <h3>Total Products</h3>

            <h2>17</h2>

        </div>

        <div class="card">

            <h3>Total Orders</h3>

            <h2>2</h2>

        </div>

        <div class="card">

            <h3>Total Users</h3>

            <h2>2</h2>

        </div>

        <div class="card">

            <h3>Revenue</h3>

            <h2>₹5,596</h2>

        </div>

    </div>

</div>

</body>

</html>