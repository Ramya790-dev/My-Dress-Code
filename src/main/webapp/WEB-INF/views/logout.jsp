<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Dress Code | Logged Out</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/logout.css">
</head>
<body>

<div class="logout-container">

    <div class="logout-card">

        <div class="logout-icon">
            ✓
        </div>

        <h1>
            Logged Out Successfully
        </h1>

        <p>
            Thank you for visiting My Dress Code.
            We hope to see you again soon.
        </p>

        <div class="logout-buttons">

            <a href="<%= request.getContextPath() %>/login"
               class="login-again-btn">
                Login Again
            </a>

            <a href="<%= request.getContextPath() %>/home"
               class="continue-btn">
                Continue Shopping
            </a>
            
            </div>
            
            <p>
			    You have been securely logged out from your account.
			    Thank you for shopping with My Dress Code.
             </p>

        

    </div>

</div>

</body>
</html>