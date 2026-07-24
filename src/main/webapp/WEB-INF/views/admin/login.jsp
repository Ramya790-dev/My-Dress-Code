<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Login | My Dress Code</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/admin-login.css">

</head>

<body>

<div class="login-container">

    <div class="login-card">

        <div class="login-left">

            <img src="<%=request.getContextPath()%>/assets/images/logo.png"
                 class="logo">

            <h1>Admin Panel</h1>

            <p>
                Manage products, categories, orders,
                customers and reports.
            </p>

        </div>

        <div class="login-right">

            <h2>Admin Login</h2>

            <% if(request.getAttribute("error") != null){ %>

            <div class="error">

                <%=request.getAttribute("error")%>

            </div>

            <% } %>

            <form
            action="<%=request.getContextPath()%>/admin/login"
            method="post">

                <input
                type="email"
                name="email"
                placeholder="Admin Email"
                required>

                <input
                type="password"
                name="password"
                placeholder="Password"
                required>

                <button type="submit">

                    Login

                </button>

            </form>

        </div>

    </div>

</div>

</body>

</html>