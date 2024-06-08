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
    <title>Đăng ký</title>
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />

    <link
      href="${pageContext.request.contextPath}/views/register/register.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <%@ include file="../header/header.jsp" %>
    <div class="body-login">
      <div class="login-container">
        <h2 class="text-center">Đăng ký</h2>
        <form action="login" method="post">
          <input
            type="hidden"
            name="action"
            value="<%=ActionConstants.REGISTER%>"
          />
          <div class="form-group">
            <label for="username" class="userNamePassword">Tài khoản:</label>
            <input
              type="username"
              class="form-control"
              id="username"
              placeholder="Nhập tài khoản"
              name="username"
            />
            <div id="usernameError" class="text-danger error-message"></div>
          </div>
          <div class="form-group">
            <label for="password" class="emailPasword">Mật khẩu:</label>
            <div class="input-group">
              <input
                type="password"
                class="form-control"
                id="password"
                placeholder="Nhập mật khẩu"
                name="password"
              />
              <div class="input-group-append">
                <span class="input-group-text bg-white" id="togglePassword">
                  <i class="bi bi-eye-slash"></i>
                </span>
              </div>
            </div>
            <div id="passwordError" class="text-danger error-message"></div>
          </div>

          <button type="submit" class="btn btn-primary">Đăng ký</button>

          <div class="text-center mt-2">
            <span>Bạn đã có tài khoản?</span>
            <a href="login"> Đăng nhập ngay</a>
          </div>
        </form>
      </div>
    </div>
    <%@ include file="../footer/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
      const togglePassword = document.querySelector("#togglePassword");
      const togglePasswordRetype = document.querySelector(
        "#togglePasswordRetype"
      );
      const password = document.querySelector("#password");
      const passwordRetype = document.querySelector("#passwordRetype");

      function togglePasswordVisibility(input, icon) {
        const type =
          input.getAttribute("type") === "password" ? "text" : "password";
        input.setAttribute("type", type);
        icon.classList.toggle("bi-eye");
        icon.classList.toggle("bi-eye-slash");
      }

      togglePasswordRetype.addEventListener("click", function (e) {
        togglePasswordVisibility(passwordRetype, this.querySelector("i"));
      });

      togglePassword.addEventListener("click", function (e) {
        togglePasswordVisibility(password, this.querySelector("i"));
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");

        form.addEventListener("submit", function (event) {
          event.preventDefault(); // Prevent form submission

          const username = document.querySelector("#username").value;
          const password = document.querySelector("#password").value;

          let isValid = true;

          // Kiểm tra username và password theo các điều kiện và cập nhật thông báo lỗi
          if (username.trim() === "") {
            usernameError.innerText = "Tài khoản không được để trống.";
            isValid = false;
          } else {
            usernameError.innerText = ""; // Xóa thông báo lỗi nếu có
          }
          if (password.trim() === "") {
            passwordError.innerText = "Mật khẩu không được để trống.";
            isValid = false;
          } else if (!validatePassword(password)) {
            passwordError.innerText =
              "Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường và ký tự đặc biệt.";
            isValid = false;
          } else {
            passwordError.innerText = ""; // Xóa thông báo lỗi nếu có
          }

          // Nếu tất cả điều kiện đều được thỏa mãn, submit form
          if (!isValid) {
            event.preventDefault(); // Ngăn form gửi đi nếu có lỗi
            return;
          }
          form.submit();
        });

        // Hàm kiểm tra password
        function validatePassword(password) {
          // Ít nhất 8 ký tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 ký tự đặc biệt
          const passwordRegex =
            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
          return passwordRegex.test(password);
        }
      });
    </script>
  </body>
</html>
