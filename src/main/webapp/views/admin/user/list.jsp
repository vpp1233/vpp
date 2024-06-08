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
    <div class="container mt-5">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Quản lý người dùng</h2>
        <button class="btn btn-success">
          <a href="${pageContext.request.contextPath}/user?action=new"
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
            <th></th>
          </tr>
        </thead>
        <tbody>
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
                  <a
                    href="user?action=delete&userId=${user.userId}"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa?');"
                    >Xóa</a
                  >
                </td>
              </tr>
            </c:forEach>
          </c:if>
        </tbody>
      </table>
    </div>
  </body>
</html>
