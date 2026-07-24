<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Order Success</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/style.css">

</head>

<body>

    <jsp:include page="partials/header.jsp" />

    <div class="success-container">

        <h1>
            Order Placed Successfully 🎉
        </h1>

        <p>
            Thank you for shopping with us.
        </p>

        <a href="<%= request.getContextPath() %>/home"
           class="shop-btn">

            Continue Shopping

        </a>

    </div>

</body>

</html>