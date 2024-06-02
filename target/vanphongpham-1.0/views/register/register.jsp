<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Đăng Kí</title>
</head>

<body>
    <h2>Đăng Kí</h2>
    <form method="post" action="register">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>
        <input type="submit" value="Register">
    </form>
    <% String error=(String) request.getAttribute("error"); if (error !=null) { out.println("<p style='color:red;'>" +
        error + "</p>");
        }
        %>
</body>

</html>