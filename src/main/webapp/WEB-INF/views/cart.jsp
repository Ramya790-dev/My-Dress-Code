<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Dress Code | Shopping Cart</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
</head>
<body>

    <jsp:include page="partials/header.jsp" />

    <div class="container">
        <h2 class="section-title">
            Shopping Cart (${cartItems.size()} Item${cartItems.size() > 1 ? 's' : ''})
        </h2>
        
        <div class="cart-container">

            <c:if test="${not empty cartItems}">
                <c:set var="grandTotal" value="0" />

                <c:forEach var="entry" items="${cartItems}">
                    <c:set var="p" value="${entry.key}" />
                    <c:set var="quantity" value="${entry.value}" />
                    <c:set var="itemTotal" value="${p.price * quantity}" />
                    <c:set var="grandTotal" value="${grandTotal + itemTotal}" />

                    <div class="cart-item">
                        <div class="cart-left">
                            <img src="${pageContext.request.contextPath}/${p.imageUrl}"
                                 alt="<c:out value='${p.productName}'/>"
                                 class="cart-image">

                            <div class="cart-details">
                                <h3><c:out value="${p.productName}"/></h3>
                                
                                <p class="cart-price">
                                    ₹<fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/>
                                </p>

                                <div class="quantity-box">
                                    <a href="${pageContext.request.contextPath}/cart?action=decrease&id=${p.productId}" class="qty-btn">-</a>
                                    <span class="quantity-number">${quantity}</span>
                                    <a href="${pageContext.request.contextPath}/cart?action=increase&id=${p.productId}" class="qty-btn">+</a>
                                </div>

                                <p class="cart-total">
                                    Total: ₹<fmt:formatNumber value="${itemTotal}" type="number" maxFractionDigits="0"/>
                                </p>
                            </div>
                        </div>

                        <div class="cart-actions">
                            <a href="${pageContext.request.contextPath}/cart?action=remove&id=${p.productId}" class="remove-btn">Remove</a>
                            <a href="${pageContext.request.contextPath}/products" class="add-more-btn">Add More</a>
                        </div>
                    </div>
                </c:forEach>

                <div class="grand-total-box">
                    <h2 class="grand-total">Order Summary</h2>

                    <div class="summary-row">
                        <span>Items</span>
                        <span>${cartItems.size()}</span>
                    </div>

                    <div class="summary-row">
                        <span>Delivery</span>
                        <span>FREE</span>
                    </div>

                    <hr>

                    <div class="summary-row total-row">
                        <span>Total</span>
                        <span>
                            ₹<fmt:formatNumber value="${grandTotal}" type="number" maxFractionDigits="0"/>
                        </span>
                    </div>

                    <a href="${pageContext.request.contextPath}/checkout" class="checkout-btn">
                        Proceed To Checkout
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/products" class="continue-shopping-btn" style="display: block; margin-top: 15px; text-align: center; color: var(--text-secondary); text-decoration: none; font-weight: 500;">
                        Continue Shopping
                    </a>
                </div>
            </c:if>

            <c:if test="${empty cartItems}">
                <div class="empty-cart">
                    <div class="empty-cart-card">
                        <div class="empty-cart-icon">🛍️</div>
                        <h2>Your Cart Is Empty</h2>
                        <p>Discover our latest collections and add your favorite products to begin shopping.</p>
                        <a href="${pageContext.request.contextPath}/products" class="continue-btn">
                            Explore Products
                        </a>
                    </div>
                </div>
            </c:if>

        </div>
    </div>

    <jsp:include page="partials/footer.jsp" />
    
</body>
</html>