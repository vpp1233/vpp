<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Quản lý danh mục sản phẩm</title>

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
        <h2>Quản lý danh mục sản phẩm</h2>
        <button class="btn btn-success">Thêm mới</button>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID/th></th>
            <th>Tên danh mục</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Cặp sách</td>
            <td style="display: flex; justify-content: space-around">
              <a href="user?action=edit&userId=${user.userId}">
                <i class="bi bi-pencil-fill" style="color: yellow"></i>
              </a>
              <a
                href="user?action=delete&userId=${user.userId}"
                onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?');"
              >
                <i class="bi bi-trash3-fill" style="color: red"></i>
              </a>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <%@ include file="../footer/footer.jsp" %>
  </body>
</html>
