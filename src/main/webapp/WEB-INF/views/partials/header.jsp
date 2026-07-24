<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.fashionstore.model.User" %>

<%
User user =
        (User) session.getAttribute("user");

int cartCount = 0;

Map<Integer,Integer> cart =
        (Map<Integer,Integer>) session.getAttribute("cart");

if(cart != null){

    for(Integer qty : cart.values()){

        cartCount += qty;
    }
}
%>

<header class="navbar">

    <!-- Logo -->

    <div class="logo-section">

        <a href="${pageContext.request.contextPath}/">
    <img src="assets/images/logo.png" alt="My Dress Code" class="logo-image">
</a>

        </a>

    </div>

    <!-- Search Bar -->

    <form
        action="<%= request.getContextPath() %>/search"
        method="get"
        class="search-bar">

        <input
            type="text"
            name="keyword"
            placeholder="Search products...">

        <button type="submit">

            Search

        </button>

    </form>

    <!-- Navigation -->

    <nav class="nav-links">

        <a href="<%= request.getContextPath() %>/home">
            Home
        </a>

        <a href="<%= request.getContextPath() %>/products">
            Products
        </a>

        <a href="<%= request.getContextPath() %>/wishlist">
            Wishlist ❤
        </a>

        <a href="<%= request.getContextPath() %>/cart"
           class="cart-link">

            Cart 🛒

            <span class="cart-badge">

                <%= cartCount %>

            </span>

        </a>
        
        <a href="<%=request.getContextPath()%>/my-orders">
             My Orders
         </a>

        <% if(user == null){ %>

            <a href="<%= request.getContextPath() %>/login">
                Login
            </a>

            <a href="<%= request.getContextPath() %>/register">
                Register
            </a>

        <% } else { %>

            <a href="<%= request.getContextPath() %>/logout">
                Logout
            </a>

        <% } %>

    </nav>

</header>