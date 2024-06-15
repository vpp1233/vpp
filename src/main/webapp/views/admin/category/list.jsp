<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Danh sách danh mục</title>

    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <%@ include file="../header/header.jsp" %>

    <div class="container mt-5">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Quản lý danh mục</h2>
        <button class="btn btn-success">
          <a
            href="${pageContext.request.contextPath}/admin/category?action=new"
            style="color: black; text-decoration: none"
            >Thêm mới</a
          >
        </button>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Tên danh mục</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${not empty categoryList}">
            <c:forEach var="category" items="${categoryList}">
              <tr>
                <td>${category.categoryId}</td>
                <td>${category.categoryName}</td>
                <td>${category.status}</td>
                <td style="display: flex; justify-content: space-around">
                  <a
                    href="category?action=edit&categoryId=${category.categoryId}"
                  >
                    <i class="bi bi-pencil-fill" style="color: yellow"></i>
                  </a>
                  <a
                    href="category?action=delete&categoryId=${category.categoryId}"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?');"
                  >
                    <i class="bi bi-trash3-fill" style="color: red"></i>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </c:if>
        </tbody>
      </table>
    </div>
    <%@ include file="../footer/footer.jsp" %>
  </body>
</html>
