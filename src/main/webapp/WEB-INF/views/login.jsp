<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | MY DRESS CODE</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/login.css">
</head>
<body>

    <div class="premium-login-page">
        <div class="premium-login-card">

            <div class="premium-left">
                <div class="overlay"></div>
                <div class="premium-content">
                    <h1>Welcome Back</h1>
                    <p>
                        Discover premium fashion collections and continue your shopping journey with My Dress Code.
                    </p>
                    
                    <div class="fashion-logo">
                        <a href="<%= request.getContextPath() %>/home" class="brand-link">MY DRESS CODE</a>
                    </div>
                </div>
            </div>

            <div class="premium-right">
                
                <a href="<%= request.getContextPath() %>/home" class="logo-link">
                    <img src="<%= request.getContextPath() %>/assets/images/logo.png" alt="Logo" class="login-logo">
                </a>

                <h2>Sign In</h2>
                <p class="login-subtitle">
                    Access your account and explore the latest fashion trends.
                </p>

                <form action="<%= request.getContextPath() %>/login" method="post">
                    <input type="email" name="email" placeholder="Email Address" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <button type="submit">Sign In</button>
                </form>

                <div class="register-link">
                    Don't have an account? 
                    <a href="<%= request.getContextPath() %>/register">Create Account</a>
                </div>
            </div>

        </div>
    </div>

</body>
</html>