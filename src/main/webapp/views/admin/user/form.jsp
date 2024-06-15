<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <title>Form người dùng</title>
  </head>
  <body>
    <div class="container mt-5">
      <h2>
        <c:choose>
          <c:when test="${not empty user}"> Chỉnh sửa người dùng </c:when>
          <c:otherwise> Thêm người dùng mới </c:otherwise>
        </c:choose>
      </h2>
      <form
        action="${pageContext.request.contextPath}/admin/user"
        method="post"
        class="needs-validation"
        novalidate
      >
        <c:if test="${not empty user.userId}">
          <input type="hidden" name="userId" value="${user.userId}" />
          <input type="hidden" name="action" value="update" />
        </c:if>
        <c:if test="${empty user.userId}">
          <input type="hidden" name="action" value="insert" />
        </c:if>

        <div class="form-group">
          <label for="userName">Tên người dùng:</label>
          <input
            type="text"
            class="form-control"
            id="userName"
            name="userName"
            value="${user.userName}"
            required
          />
          <div class="invalid-feedback">Vui lòng nhập tên người dùng.</div>
        </div>

        <div class="form-group">
          <label for="password">Mật khẩu:</label>
          <input
            type="password"
            class="form-control"
            id="password"
            name="password"
            value="${user.password}"
            required
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
          />
          <div class="invalid-feedback">Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt.</div>
        </div>

        <div class="form-group">
          <label for="email">Email:</label>
          <input
            type="email"
            class="form-control"
            id="email"
            name="email"
            value="${user.email}"
            required
          />
          <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
        </div>

       
        <div class="form-group">
          <label for="status">Trạng thái:</label>
          <select class="form-control" id="status" name="status" required>
            <option value="">Chọn trạng thái</option>
            <option value="1" ${user.status == 1 ? 'selected' : ''}>Hoạt động</option>
            <option value="2" ${user.status == 2 ? 'selected' : ''}>Không hoạt động</option>
            <option value="3" ${user.status == 3 ? 'selected' : ''}>Đang chờ</option>
          </select>
          <div class="invalid-feedback">Vui lòng chọn trạng thái.</div>
        </div>

        <div class="form-group">
          <label for="type">Loại người dùng:</label>
          <select class="form-control" id="type" name="type" required>
            <option value="">Chọn loại người dùng</option>
            <option value="1" ${user.status == 1 ? 'selected' : ''}>Quản trị viên</option>
            <option value="2" ${user.status == 2 ? 'selected' : ''}>Người dùng thường</option>
          </select>
          <div class="invalid-feedback">Vui lòng chọn trạng thái.</div>
        </div>

        <div class="form-row">
            <div class="col-6">
              <button type="submit" class="btn btn-primary btn-block">Lưu người dùng</button>
            </div>
            <div class="col-6">
              <a href="${pageContext.request.contextPath}/admin/user?action=list" class="btn btn-secondary btn-block">Trở về danh sách</a>
            </div>
          </div>
    </div>

    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function () {
        "use strict";
        window.addEventListener(
          "load",
          function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName("needs-validation");
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(
              forms,
              function (form) {
                form.addEventListener(
                  "submit",
                  function (event) {
                    if (form.checkValidity() === false) {
                      event.preventDefault();
                      event.stopPropagation();
                    }
                    form.classList.add("was-validated");
                  },
                  false
                );
              }
            );
          },
          false
        );
      })();
    </script>
  </body>
</html>
