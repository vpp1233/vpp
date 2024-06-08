<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form người dùng</title>
</head>
<body>
    <h2><c:choose>
        <c:when test="${not empty user}">
            Chỉnh sửa người dùng
        </c:when>
        <c:otherwise>
            Thêm người dùng mới
        </c:otherwise>
    </c:choose></h2>
    <form action="user" method="post">
        <input type="hidden" name="userId" value="${user.userId}" />
        <input type="hidden" name="action" value="insert" />
        <table>
            <tr>
                <td>Tên người dùng:</td>
                <td><input type="text" name="userName" value="${user.userName}" required /></td>
            </tr>
            <tr>
                <td>Mật khẩu:</td>
                <td><input type="password" name="password" value="${user.password}" required /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" value="${user.email}" required /></td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td><input type="number" name="status" value="${user.status}" required /></td>
            </tr>
            <tr>
                <td>Loại:</td>
                <td><input type="number" name="type" value="${user.type}" required /></td>
            </tr>
            <tr>
                <td>Người tạo:</td>
                <td><input type="text" name="createdBy" value="${user.createdBy}" required /></td>
            </tr>
            <tr>
                <td>Người cập nhật:</td>
                <td><input type="text" name="updatedBy" value="${user.updatedBy}" required /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="save" /></td>
            </tr>
        </table>
    </form>
    <a href="user?action=list">Trở về danh sách</a>
</body>
</html>