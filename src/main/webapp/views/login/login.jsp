<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ page
import="com.vanphongpham.util.ActionConstants"%> <%-- Kiểm tra nếu có thông báo
lỗi trong session thì hiển thị popup --%> <%String error = (String)
session.getAttribute("error"); if (error != null) { %>
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
    <title>Đăng nhập</title>
    <link
      href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css"
      rel="stylesheet"
    />

    <link
      href="${pageContext.request.contextPath}/views/login/login.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <%@ include file="../header/header.jsp" %>

    <div class="body-login">
      <div class="login-container">
        <h2 class="text-center">Đăng nhập</h2>

        <form action="login" method="post">
          <input
            type="hidden"
            name="action"
            value="<%=ActionConstants.LOGIN%>"
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
                  <img
                    src="${pageContext.request.contextPath}/views/images/bi-bi-eye-slash.svg"
                    width="20"
                    height="20"
                    id="toggleIcon"
                  />
                </span>
              </div>
            </div>
            <div id="passwordError" class="text-danger error-message"></div>
          </div>
          <button type="submit" class="btn btn-primary">Đăng nhập</button>
          <div class="text-center mt-3">
            <a href="forgot">Quên mật khẩu?</a>
          </div>
          <div class="text-center mt-2">
            <span>Chưa có tài khoản?</span> <a href="register"> Đăng ký</a>
          </div>
        </form>
      </div>
    </div>

    <%@ include file="../footer/footer.jsp" %>

    <script>
      const togglePassword = document.querySelector("#togglePassword");
      const password = document.querySelector("#password");
      const toggleIcon = document.querySelector("#toggleIcon");

      const eyeSlashIcon =
        "${pageContext.request.contextPath}/views/images/bi-bi-eye-slash.svg";
      const eyeIcon =
        "${pageContext.request.contextPath}/views/images/bi-bi-eye.svg";

      togglePassword.addEventListener("click", function (e) {
        // Chuyển đổi thuộc tính type
        const type =
          password.getAttribute("type") === "password" ? "text" : "password";
        password.setAttribute("type", type);

        // Chuyển đổi icon
        if (password.getAttribute("type") === "password") {
          toggleIcon.src = eyeSlashIcon;
        } else {
          toggleIcon.src = eyeIcon;
        }
      });
    </script>
  </body>
</html>
