<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Quản lý sản phẩm</title>

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
        <h2>Quản lý sản phẩm</h2>
        <button class="btn btn-success">Thêm mới</button>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Tên sản phẩm</th>
            <th>Password</th>
            <th>Email</th>
            <th>Status</th>
            <th>Type</th>
            <th>Created By</th>
            <th>Actions</th>
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
