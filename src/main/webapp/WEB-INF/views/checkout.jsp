<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.Map" %>
<%@ page import="com.fashionstore.model.Product" %>

<%

Map<Product,Integer> cart =
(Map<Product,Integer>)
request.getAttribute("checkoutItems");

Double grandTotal =
(Double) request.getAttribute("grandTotal");

if (grandTotal == null) {
grandTotal = 0.0;
}

%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Checkout</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/style.css">

</head>

<body>

<jsp:include page="partials/header.jsp" />

<div class="checkout-container">

    <!-- LEFT SIDE -->

<div class="checkout-form">

    <h2>Delivery Address</h2>

    <form action="place-order" method="post">

        <input type="text"
               name="fullName"
               placeholder="Full Name"
               required>

        <input type="text"
               name="phone"
               placeholder="Phone Number"
               required>

        <textarea
                name="address"
                placeholder="Delivery Address"
                required></textarea>

        <input type="text"
               name="city"
               placeholder="City"
               required>

        <input type="text"
               name="pincode"
               placeholder="Pincode"
               required>

        <h3>Payment Method</h3>

        <div class="payment-option">

            <label>
                <input type="radio"
                       name="paymentMethod"
                       value="COD"
                       checked>
                Cash On Delivery
            </label>

            <br><br>

            <label>
                <input type="radio"
                       name="paymentMethod"
                       value="RAZORPAY">
                Pay Online (Razorpay)
            </label>

        </div>

        <button type="submit"
                class="place-order-btn">

            Place Order

        </button>

    </form>

</div>
    <!-- RIGHT SIDE -->

    <div class="order-summary">

        <h2>

            Order Summary

        </h2>

        <%

            if(cart != null &&
               !cart.isEmpty()) {

                for(Map.Entry<Product,Integer> item
                        : cart.entrySet()) {

                    Product p =
                            item.getKey();

                    int quantity =
                            item.getValue();

                    double total =
                            p.getPrice() * quantity;


        %>

        <div class="summary-item">

            <h3>

                <%= p.getProductName() %>

            </h3>

            <p>

                Quantity :
                <%= quantity %>

            </p>

            <p>

                Total :
                ₹ <%= total %>

            </p>

            <hr>

        </div>

        <%

                }

            }

        %>

        <h2 style="margin-top:20px;">

            Grand Total :
            ₹ <%= grandTotal %>

        </h2>

    </div>

</div>
<jsp:include page="partials/footer.jsp" />
</body>

</html>