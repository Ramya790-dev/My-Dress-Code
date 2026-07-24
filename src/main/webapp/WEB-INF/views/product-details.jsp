<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.fashionstore.model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= product != null ? product.getProductName() : "Product Details" %> | My Dress Code</title>
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/header.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/products.css">
</head>
<body>

    <jsp:include page="partials/header.jsp" />

    <div class="container">
        <div class="back-nav">
            <a href="javascript:history.back()">&larr; Back to Products</a>
        </div>

        <% if (product != null) { %>
        <div class="details-container">
            
            <div class="details-image-section">
                <img src="<%= request.getContextPath() %>/<%= product.getImageUrl() %>"
                     alt="<%= product.getProductName() %>"
                     class="details-image">
            </div>

            <div class="details-content">
                <span class="brand-tag">My Dress Code Selection</span>
                
                <h1 class="details-title">
                    <%= product.getProductName() %>
                </h1>

                <div class="details-rating">
                    <span class="star">★</span> <%= String.format("%.1f", (double)product.getRating()) %>
                    <span class="review-count">| <%= product.getReviewCount() %> Verified Reviews</span>
                </div>

                <div class="price-wrapper">
                    <h2 class="details-price">
                        ₹<%= String.format("%,.0f", (double)product.getPrice()) %>
                    </h2>
                    <span class="tax-tag">Inclusive of all taxes</span>
                </div>

                <hr class="divider">

                <div class="description-section">
                    <h3>Product Description</h3>
                    <p class="details-description">
                        <%= product.getDescription() != null && !product.getDescription().isEmpty() 
                            ? product.getDescription() 
                            : "No description available for this premium piece." %>
                    </p>
                </div>

                <div class="action-section">
                    <a href="<%= request.getContextPath() %>/cart?action=add&id=<%= product.getProductId() %>"
                       class="details-cart-btn">
                        Add To Cart
                    </a>
                </div>
            </div>

        </div>
        <% } else { %>
        <div class="empty-products">
            <h3>Product details could not be retrieved.</h3>
            <a href="<%= request.getContextPath() %>/products">Return to Shop</a>
        </div>
        <% } %>
    </div>

    <jsp:include page="partials/footer.jsp" />

</body>
</html>