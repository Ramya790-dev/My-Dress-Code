<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>

<%
List<Product> products =
        (List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>All Products</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/style.css">

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/header.css">

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/products.css">

<style>

.floating-wishlist-btn{
    position:absolute;
    top:12px;
    right:12px;

    width:45px;
    height:45px;

    border:none;
    border-radius:50%;

    background:#ffffff;

    font-size:20px;

    cursor:pointer;

    display:flex;
    align-items:center;
    justify-content:center;

    box-shadow:0 4px 12px rgba(0,0,0,0.12);

    transition:all .3s ease;
}

.floating-wishlist-btn:hover{
    transform:scale(1.1);
}

.floating-wishlist-btn.active{
    color:#ef4444;
    background:#fff0f0;
}

.product-image-container{
    position:relative;
}

.product-title-link{
    text-decoration:none;
    color:#111827;
}

.product-title-link:hover{
    color:#C8A97E;
}

.discount-badge{
    position:absolute;

    top:12px;
    left:12px;

    background:#ef4444;
    color:white;

    padding:6px 10px;

    border-radius:8px;

    font-size:12px;
    font-weight:600;
}

.product-rating{
    margin-top:10px;
    color:#f59e0b;
    font-weight:600;
}

.review-count{
    color:#6b7280;
    font-size:14px;
}

</style>

</head>

<body>

<jsp:include page="partials/header.jsp" />

<div class="container">

    <h2 class="section-title">
        All Products
    </h2>

    <%
    String successMessage =
            (String) session.getAttribute("successMessage");

    if(successMessage != null){
    %>

    <div class="success-message">
        <%= successMessage %>
    </div>

    <%
        session.removeAttribute("successMessage");
    }
    %>

    <div class="products-grid">

        <%
        if(products != null && !products.isEmpty()){

            for(Product p : products){
        %>

        <div class="product-box">

            <div class="product-image-container">

                <a href="<%= request.getContextPath() %>/product-details?id=<%= p.getProductId() %>">

                    <img
                        src="<%= request.getContextPath() %>/<%= p.getImageUrl() %>"
                        alt="<%= p.getProductName() %>"
                        class="product-image">

                </a>

                <% if(p.getDiscountPercent() > 0){ %>

                <div class="discount-badge">

                    <%= (int)p.getDiscountPercent() %>% OFF

                </div>

                <% } %>

                <button
                    type="button"
                    class="floating-wishlist-btn ajax-wishlist-btn"
                    data-id="<%= p.getProductId() %>"
                    title="Add To Wishlist">

                    ♡

                </button>

            </div>

            <div class="product-details-content">

                <h3>

                    <a href="<%= request.getContextPath() %>/product-details?id=<%= p.getProductId() %>"
                       class="product-title-link">

                        <%= p.getProductName() %>

                    </a>

                </h3>

                <p class="price">

                    ₹<%= String.format("%,.0f", p.getPrice()) %>

                </p>

                <% if(p.getRating() > 0){ %>

                <p class="product-rating">

                    ★ <%= String.format("%.1f", p.getRating()) %>

                    <% if(p.getReviewCount() > 0){ %>

                    <span class="review-count">

                        (<%= p.getReviewCount() %> Reviews)

                    </span>

                    <% } %>

                </p>

                <% } %>

                <div class="product-buttons">

                    <button
                        type="button"
                        class="cart-btn"

                        onclick="window.location.href='<%= request.getContextPath() %>/cart?action=add&id=<%= p.getProductId() %>'">

                        Add To Cart

                    </button>

                </div>

            </div>

        </div>

        <%
            }
        }
        else{
        %>

        <div class="empty-products">

            <h3>
                No Products Available
            </h3>

        </div>

        <%
        }
        %>

    </div>

</div>

<jsp:include page="partials/footer.jsp" />

<script>

document.addEventListener("DOMContentLoaded", function(){

    const wishlistButtons =
            document.querySelectorAll(".ajax-wishlist-btn");

    wishlistButtons.forEach(button => {

        button.addEventListener("click", function(e){

            e.preventDefault();

            const productId =
                    this.getAttribute("data-id");

            const contextPath =
                    "<%= request.getContextPath() %>";

            fetch(
                contextPath +
                "/wishlist?action=add&id=" +
                productId
            )
            .then(response => {

                if(response.ok){

                    this.classList.add("active");

                    this.innerHTML = "♥";
                }
            })
            .catch(error => {

                console.error(error);
            });

        });

    });
 
});

</script>

</body>
</html>