<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
</head>
<body>
    <h1>Quản lý người dùng</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/user?action=list">Danh sách người dùng</a></li>
            <li><a href="${pageContext.request.contextPath}/user?action=new">Thêm người dùng mới</a></li>
        </ul>
    </nav>
    <div id="content">
        <!-- Nội dung sẽ được load ở đây -->
    </div>
</body>
</html>