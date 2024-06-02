<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>

<body>
    <h2>Login</h2>
    <form method="post" action="login">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
    <% String error=(String) request.getAttribute("error"); if (error !=null) { out.println("<p style='color:red;'>" +
        error + "</p>");
        }
        %>
</body>

</html>