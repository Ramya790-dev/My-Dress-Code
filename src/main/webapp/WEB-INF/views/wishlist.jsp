<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Wishlist | My Dress Code</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/wishlist.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
</head>
<body>

    <jsp:include page="partials/header.jsp" />

    <div class="container">
        <h2 class="section-title">My Wishlist ❤</h2>

        <c:choose>
            <c:when test="${not empty wishlistProducts}">
                <div class="wishlist-container">
                    
                    <c:forEach var="p" items="${wishlistProducts}">
                        <div class="wishlist-card">
                            
                            <img src="${pageContext.request.contextPath}${p.imageUrl}"
                                 alt="${p.productName}"
                                 class="wishlist-image">

                            <h3>${p.productName}</h3>
                            <p class="wishlist-price">₹ ${p.price}</p>

                            <div class="wishlist-buttons">
                                <a href="${pageContext.request.contextPath}/cart?action=add&id=${p.productId}" class="add-cart-btn">
                                    Add to Cart
                                </a>
                                
                                <div class="wishlist-secondary-actions">
                                    <a href="${pageContext.request.contextPath}/product-details?id=${p.productId}" class="details-btn">
                                        Details
                                    </a>
                                    <a href="${pageContext.request.contextPath}/wishlist?action=remove&id=${p.productId}" class="remove-wishlist-btn">
                                        Remove
                                    </a>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                    
                </div>
            </c:when>
            
            <c:otherwise>
                <div class="empty-wishlist">
                    <div class="empty-icon">❤</div>
                    <h2>Your Wishlist Is Empty</h2>
                    <p>Save your favorite products here.</p>
                    <a href="${pageContext.request.contextPath}/products" class="browse-btn">
                        Browse Products
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="partials/footer.jsp" />

</body>
</html>