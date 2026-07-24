<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty sessionScope.successMessage}">
    <div style="position: fixed; top: 80px; right: 20px; z-index: 1050; min-width: 250px; background-color: #d4edda; color: #155724; padding: 15px 20px; border-radius: 8px; border: 1px solid #c3e6cb; box-shadow: 0 4px 6px rgba(0,0,0,0.1); font-family: sans-serif;">
        <strong>Success!</strong> ${sessionScope.successMessage}
        <button type="button" onclick="this.parentElement.style.display='none';" aria-label="Close" style="float: right; background: none; border: none; font-size: 1.2rem; cursor: pointer; color: #155724; margin-top: -2px;">&times;</button>
    </div>
    <% session.removeAttribute("successMessage"); %>
</c:if>

<nav class="navbar">

    <div class="nav-container">

        <div class="logo">
            <a href="${pageContext.request.contextPath}/home">
                <img src="${pageContext.request.contextPath}/assets/images/logo.png"
                     alt="My Dress Code"
                     class="logo-image">
            </a>
        </div>

        <ul class="nav-links">
            <li>
                <a href="${pageContext.request.contextPath}/home">Home</a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/products">
                    Products
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/products?category=Men">
                    Men
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/products?category=Women">
                    Women
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/products?category=Kids">
                    Kids
                </a>
            </li>
        </ul>

        <div class="nav-actions">

            <a href="${pageContext.request.contextPath}/login"
               class="login-btn">
                Login
            </a>

            <a href="${pageContext.request.contextPath}/cart" 
               class="cart-btn-nav" 
               style="position: relative; text-decoration: none;">
                Cart 🛒
                
                <span style="position: absolute; top: -8px; right: -15px; background-color: #e74c3c; color: white; border-radius: 50%; padding: 2px 7px; font-size: 12px; font-weight: bold; box-shadow: 0 2px 4px rgba(0,0,0,0.2);">
                    ${sessionScope.cart != null ? sessionScope.cart.size() : 0}
                </span>
            </a>

        </div>

    </div>

</nav>