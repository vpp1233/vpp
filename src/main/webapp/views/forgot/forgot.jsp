<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ page import="com.vanphongpham.util.ActionConstants"
%> <%-- Kiểm tra nếu có thông báo lỗi trong session thì hiển thị popup --%> <%
String error = (String) session.getAttribute("error"); if (error != null) { %>
<script>
  // Hiển thị thông báo lỗi bằng SweetAlert
  Swal.fire({
    icon: "error",
    title: "Lỗi",
    text: "<%= error %>",
  });
</script>
<% // Xóa thông báo lỗi khỏi session sau khi đã sử dụng
session.removeAttribute("error"); } %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quên mật khẩu</title>
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/views/forgot/forgot.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <%@ include file="../header/header.jsp" %>

    <div class="body-login">
      <div class="login-container">
        <h2 class="text-center">Quên mật khẩu</h2>
        <form action="forgot" method="post">
          <input type="hidden" name="action" />
          <div class="form-group">
            <label for="email" class="emailPasword">Email:</label>
            <input
              type="email"
              class="form-control"
              id="email"
              placeholder="Nhập email"
              name="email"
            />
            <div id="emailError" class="text-danger"></div>
          </div>

          <button
            type="submit"
            class="btn btn-primary"
            id="toggleForgot"
            type="submit"
          >
            Lấy lại mật khẩu
          </button>

          <div class="text-center mt-2">
            <span>Bạn có đăng ký tài khoản mới?</span>
            <a href="register"> Đăng ký</a>
          </div>
        </form>
      </div>
    </div>

    <%@ include file="../footer/footer.jsp" %>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");

        form.addEventListener("submit", function (event) {
          event.preventDefault(); // Prevent form submission

          const email = document.querySelector("#email").value;

          // Kiểm tra username, password và email theo các điều kiện và cập nhật thông báo lỗi

          document.querySelector("#emailError").textContent = validateEmail(
            email
          )
            ? ""
            : "Email không hợp lệ. Vui lòng nhập đúng định dạng email.";

          // Nếu có lỗi, không submit form
          if (!validateEmail(email)) {
            return;
          }

          // Nếu tất cả điều kiện đều được thỏa mãn, submit form
          form.submit(alert("Coming soon!"), (window.location.href = "/"));
        });

        // Hàm kiểm tra email
        function validateEmail(email) {
          const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
          return emailRegex.test(email);
        }
      });
    </script>
  </body>
</html>
