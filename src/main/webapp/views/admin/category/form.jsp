<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Form danh mục</title>
    <link
      href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css"
      rel="stylesheet"
    />
</head>
<body>
    <div class="container mt-5">
        <h2>
            <c:choose>
                <c:when test="${not empty category}">Chỉnh sửa danh mục</c:when>
                <c:otherwise>Thêm danh mục mới</c:otherwise>
            </c:choose>
        </h2>
        <form action="${pageContext.request.contextPath}/admin/category" method="post" class="needs-validation" novalidate>
            <c:if test="${not empty category.categoryId}">
                <input type="hidden" name="categoryId" value="${category.categoryId}" />
                <input type="hidden" name="action" value="update" />
            </c:if>
            <c:if test="${empty category.categoryId}">
                <input type="hidden" name="action" value="insert" />
            </c:if>

            <div class="form-group">
                <label for="categoryName">Tên danh mục:</label>
                <input type="text" class="form-control" id="categoryName" name="categoryName" value="${category.categoryName}" required />
                <div class="invalid-feedback">Vui lòng nhập tên danh mục.</div>
            </div>

            <div class="form-group">
                <label for="status">Trạng thái:</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="">Chọn trạng thái</option>
                    <option value="0" ${category.status == 0 ? 'selected' : ''}>Ẩn danh mục</option>
                    <option value="1" ${category.status == 1 ? 'selected' : ''}>Hiện danh mục</option>
                </select>
                <div class="invalid-feedback">Vui lòng chọn trạng thái.</div>
            </div>

            <div class="form-row">
                <div class="col-6">
                    <button type="submit" class="btn btn-primary btn-block">Lưu danh mục</button>
                </div>
                <div class="col-6">
                    <a href="${pageContext.request.contextPath}/admin/category?action=list" class="btn btn-secondary btn-block">Trở về danh sách</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
