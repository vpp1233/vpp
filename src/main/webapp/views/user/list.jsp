<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách người dùng</title>
</head>
<body>
    <h2>Danh sách người dùng</h2>
    <a href="user?action=new">Thêm người dùng mới</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên người dùng</th>
            <th>Email</th>
            <th>Trạng thái</th>
            <th>Loại</th>
            <th>Hành động</th>
        </tr>
        <c:if test="${not empty listUser}">
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.email}</td>
                <td>${user.status}</td>
                <td>${user.type}</td>
                <td>
                    <a href="user?action=edit&userId=${user.userId}">Chỉnh sửa</a>
                    <a href="user?action=delete&userId=${user.userId}" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </c:if>
    </table>
</body>
</html>