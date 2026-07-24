<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Dress Code | Fashion Store</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css">
</head>
<body>

    <jsp:include page="partials/header.jsp" />

    <div class="container">

        <section class="hero-section">
            <div class="hero-content">
                <h1>Fashion That Defines You</h1>
                <p>Discover premium collections for Men, Women, Kids and Accessories.</p>
                <a href="${pageContext.request.contextPath}/products" class="shop-btn">Shop Now</a>
            </div>
        </section>

        <section>
            <h2 class="section-title">Categories</h2>
            <div class="categories-section">
                
                <c:forEach var="category" items="${categories}">
                    <div class="category-box">
                        <img src="${pageContext.request.contextPath}/assets/images/${category.categoryName.toLowerCase()}.jpg"
                             alt="${category.categoryName}"
                             class="category-image">
                        <h3>${category.categoryName}</h3>
                        <p>${category.description}</p>
                    </div>
                </c:forEach>

                <c:if test="${empty categories}">
                    <div class="category-box">
                        <img src="${pageContext.request.contextPath}/assets/images/men.jpg" alt="Men" class="category-image">
                        <h3>Men</h3>
                        <p>Premium fashion for men</p>
                    </div>
                    <div class="category-box">
                        <img src="${pageContext.request.contextPath}/assets/images/women.jpg" alt="Women" class="category-image">
                        <h3>Women</h3>
                        <p>Latest trends for women</p>
                    </div>
                    <div class="category-box">
                        <img src="${pageContext.request.contextPath}/assets/images/kids.jpg" alt="Kids" class="category-image">
                        <h3>Kids</h3>
                        <p>Comfortable fashion for kids</p>
                    </div>
                    <div class="category-box">
                        <img src="${pageContext.request.contextPath}/assets/images/accessories.jpg" alt="Accessories" class="category-image">
                        <h3>Accessories</h3>
                        <p>Stylish fashion accessories</p>
                    </div>
                </c:if>

            </div>
        </section>

        <c:if test="${not empty sessionScope.successMessage}">
            <div class="success-message">
                ${sessionScope.successMessage}
            </div>
            <c:remove var="successMessage" scope="session" />
        </c:if>
		
        <section>
    <h2 class="section-title">Latest Products</h2>
    <div class="products-grid">
        
        <c:forEach var="p" items="${latestProducts}">
            <div class="product-box">
                <div class="product-image-container">
                    <a href="${pageContext.request.contextPath}/product-details?id=${p.productId}">
                        <img src="${pageContext.request.contextPath}/${p.imageUrl}"
                             alt="${p.productName}"
                             class="product-image">
                    </a>

                    <c:if test="${p.discountPercent > 0}">
                        <div class="discount-badge">
                            <fmt:formatNumber value="${p.discountPercent}" type="number" maxFractionDigits="0"/>% OFF
                        </div>
                    </c:if>

                    <a href="${pageContext.request.contextPath}/wishlist?action=add&id=${p.productId}" 
                       class="floating-wishlist-btn" title="Add to Wishlist">
                        ❤
                    </a>
                </div>

                <div class="product-details-content">
                    <h3>
                        <a href="${pageContext.request.contextPath}/product-details?id=${p.productId}" class="product-title-link">
                            <c:out value="${p.productName}"/>
                        </a>
                    </h3>
                    
                    <p class="price">
                        ₹<fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/>
                    </p>
                    
                    <p class="product-rating">
                        <span class="star">★</span> <c:out value="${p.rating}"/>
                        <c:if test="${p.reviewCount > 0}">
                            <span class="review-count">(${p.reviewCount})</span>
                        </c:if>
                    </p>

                    <div class="product-buttons">
                        <a href="${pageContext.request.contextPath}/cart?action=add&id=${p.productId}" class="cart-btn">
                            Add To Cart
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty latestProducts}">
            <div class="empty-products">
                <h3>No Products Available</h3>
            </div>
        </c:if>

    </div>
</section>
    </div>

    <jsp:include page="partials/footer.jsp" />
    
</body>
</html>