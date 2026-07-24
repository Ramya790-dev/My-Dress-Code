<%@ page contentType="text/html;charset=UTF-8"%>

<html>

<head>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

</head>

<body>

<script>

var options = {

    "key":"<%=request.getAttribute("keyId")%>",

    "amount":"99900",

    "currency":"INR",

    "name":"My Dress Code",

    "description":"Fashion Store Payment",

    "order_id":"<%=request.getAttribute("orderId")%>",

    handler: function (response) {

        window.location =
            "payment-success?"
            + "paymentId=" + response.razorpay_payment_id
            + "&orderId=" + response.razorpay_order_id
            + "&signature=" + response.razorpay_signature;
    }

};

var rzp = new Razorpay(options);

rzp.open();

</script>

</body>

</html>