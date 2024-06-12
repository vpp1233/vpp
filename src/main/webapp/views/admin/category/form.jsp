<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form danh mục</title>
</head>
<body>
    <h2><c:choose>
        <c:when test="${not empty category}">
            Chỉnh sửa danh mục
        </c:when>
        <c:otherwise>
            Thêm danh mục mới
        </c:otherwise>
    </c:choose></h2>
    <form action="${pageContext.request.contextPath}/admin/category" method="post">
        <c:if test="${not empty category.categoryId}">
            <input type="hidden" name="categoryId" value="${category.categoryId}" />
            <input type="hidden" name="action" value="update" />
        </c:if>
        <c:if test="${empty category.categoryId}">
            <input type="hidden" name="action" value="insert" />
        </c:if>
        <table>
            <tr>
                <td>Tên danh mục:</td>
                <td><input type="text" name="categoryName" value="${category.categoryName}" required /></td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td><input type="number" name="status" value="${category.status}" required /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="save" /></td>
            </tr>
        </table>
    </form>
    <a href="${pageContext.request.contextPath}/admin/category?action=list">Trở về danh sách</a>
</body>
</html>