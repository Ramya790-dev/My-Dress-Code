<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Register | Fashion Store</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/style.css">

</head>

<body>

    <div class="auth-container">

        <!-- LEFT SIDE -->

        <div class="auth-left">

            <h1>

                Create
                <span>Account</span>

            </h1>

            <p>
                Join Fashion Store and start shopping
            </p>

            <img
                src="<%= request.getContextPath() %>/assets/images/register-model.jpg"
                alt="Fashion Model"
                class="auth-image">

        </div>

        <!-- RIGHT SIDE -->

        <div class="auth-right">

            <h2>
                Register Account
            </h2>

            <form
                action="<%= request.getContextPath() %>/register"
                method="post"
                class="auth-form">

                <input type="text"
                       name="fullName"
                       placeholder="Full Name"
                       required>

                <input type="email"
                       name="email"
                       placeholder="Email Address"
                       required>

                <input type="text"
                       name="phone"
                       placeholder="Phone Number"
                       required>

                <input type="password"
                       name="password"
                       placeholder="Password"
                       required>

                <input type="text"
                       name="addressLine1"
                       placeholder="Address Line 1">

                <input type="text"
                       name="addressLine2"
                       placeholder="Address Line 2">

                <input type="text"
                       name="city"
                       placeholder="City">

                <input type="text"
                       name="state"
                       placeholder="State">

                <input type="text"
                       name="pincode"
                       placeholder="Pincode">

                <input type="text"
                       name="country"
                       placeholder="Country">

                <button type="submit"
                        class="auth-btn">

                    Register

                </button>

            </form>

            <p class="auth-link">

                Already have an account?

                <a href="<%= request.getContextPath() %>/login">
                    Login
                </a>

            </p>

        </div>

    </div>

</body>

</html>