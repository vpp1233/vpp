<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Quản lý người dùng</title>

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
          <tr>
            <td>JohnDoe</td>
            <td>••••••••</td>
            <td>john.doe@example.com</td>
            <td>Active</td>
            <td>Admin</td>
            <td>AdminUser</td>
            <td>
              <i class="fas fa-pencil-alt"></i>
              <i class="fas fa-trash"></i>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>
