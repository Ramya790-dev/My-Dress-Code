<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.fashionstore.model.Product"%>

<%
Product p = (Product)request.getAttribute("product");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Product</title>

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
    
    <a href="<%=request.getContextPath()%>/admin/customers">Customers</a>


    <a href="<%=request.getContextPath()%>/admin/logout">
        Logout
    </a>

</div>

<div class="main">

    <div class="form-box">

        <h2>Edit Product</h2>

        <form action="<%=request.getContextPath()%>/admin/edit-product"
              method="post">

            <input type="hidden"
                   name="id"
                   value="<%=p.getProductId()%>">
		<div class="form-group">
		    <label>Product Name</label>
		    <input type="text"
		           name="name"
		           value="<%=p.getProductName()%>">
		</div>

            <div class="form-group">
                <label>Brand</label>
                <input type="text"
                       name="brand"
                       value="<%=p.getBrand()%>">
            </div>

            <div class="form-group">
                <label>Category</label>

                <select name="category">

                    <option value="1"
                    <%=p.getCategoryId()==1?"selected":""%>>
                    Men
                    </option>

                    <option value="2"
                    <%=p.getCategoryId()==2?"selected":""%>>
                    Women
                    </option>

                    <option value="3"
                    <%=p.getCategoryId()==3?"selected":""%>>
                    Kids
                    </option>

                    <option value="4"
                    <%=p.getCategoryId()==4?"selected":""%>>
                    Accessories
                    </option>

                </select>

            </div>

            <div class="form-group">
                <label>Price</label>
                <input type="number"
                       step="0.01"
                       name="price"
                       value="<%=p.getPrice()%>">
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea rows="4"
                          name="description"><%=p.getDescription()%></textarea>
            </div>

            <div class="form-group">
                <label>Image URL</label>
                <input type="text"
                       name="image"
                       value="<%=p.getImageUrl()%>">
            </div>

            <div class="form-group">
                <label>Rating</label>
                <input type="number"
                       step="0.1"
                       name="rating"
                       value="<%=p.getRating()%>">
            </div>

            <div class="form-group">
                <label>Review Count</label>
                <input type="number"
                       name="reviews"
                       value="<%=p.getReviewCount()%>">
            </div>

            <div class="form-group">
                <label>Discount %</label>
                <input type="number"
                       step="0.1"
                       name="discount"
                       value="<%=p.getDiscountPercent()%>">
            </div>

            <div class="form-group">
                <label>Active</label>

                <select name="active">

                    <option value="true"
                    <%=p.isActive()?"selected":""%>>
                    Yes
                    </option>

                    <option value="false"
                    <%=!p.isActive()?"selected":""%>>
                    No
                    </option>

                </select>

            </div>

            <button class="save-btn">
                Update Product
            </button>

        </form>

    </div>

</div>

</body>

</html>