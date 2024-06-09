<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Danh sách người dùng</title>

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
        <h2>Quản lý người dùng</h2>
        <button class="btn btn-success">
          <a
            href="${pageContext.request.contextPath}/admin/user?action=new"
            style="color: black; text-decoration: none"
            >Thêm mới</a
          >
        </button>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Password</th>
            <th>Email</th>
            <th>Trạng thái</th>
            <th>Loại người dùng</th>
            <th>Ngày tạo</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${not empty listUser}">
            <c:forEach var="user" items="${listUser}">
              <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>${user.email}</td>
                <td>${user.status}</td>
                <td>${user.type}</td>
                <td>01/01/2024</td>
                <td style="display: flex; justify-content: space-around">
                  <a href="user?action=edit&userId=${user.userId}">
                    <i class="bi bi-pencil-fill" style="color: yellow"></i>
                  </a>
                  <a
                    href="user?action=delete&userId=${user.userId}"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa user này?');"
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
