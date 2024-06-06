<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import="com.vanphongpham.util.ActionConstants" %>

<%-- Kiểm tra nếu có thông báo lỗi trong session thì hiển thị popup --%>
<%
String error = (String) session.getAttribute("error");
if (error != null) {
%>
    <script>
        // Hiển thị thông báo lỗi bằng SweetAlert
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: '<%= error %>',
        });
    </script>
<%
    // Xóa thông báo lỗi khỏi session sau khi đã sử dụng
    session.removeAttribute("error");
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng nhập</title>
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />

    <style>
      .body-login {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f8f9fa;
        padding-top: 20px;
        padding-bottom: 20px;
      }

      .login-container {
        max-width: 500px;
        width: 100%;
        padding: 40px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
      }

      .login-container h2 {
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: 700;
      }

      .login-container .form-group {
        margin-bottom: 15px;
        position: relative;
      }

      .login-container .form-control {
        border-radius: 12px;
        height: 50px;
      }

      .login-container .btn {
        border-radius: 12px;
        width: 100%;
      }

      .input-group {
        border-radius: 12px;
      }
      .input-group .form-control {
        border-radius: 12px;
      }
      .input-group-append .input-group-text {
        border-radius: 0 12px 12px 0;
      }
      .bi {
        cursor: pointer;
      }
      .userNamePassword {
        font-weight: 600;
      }
      .btn-link {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: black;
        text-decoration: none !important;
        border-radius: 12px;
        text-align: center;
        width: 100%;
      }
    </style>
  </head>

  <body>
    <%@ include file="../header/header.jsp" %>

    <div class="body-login">
      <div class="login-container">
        <h2 class="text-center">Đăng nhập</h2>
        
	        <form action="login" method="post">
	        	<input type="hidden" name="action" value="<%=ActionConstants.LOGIN%>" />
	        	
				<div class="form-group">
				  <label for="username" class="userNamePassword">Tài khoản:</label>
				  <input
				    type="username"
				    class="form-control"
				    id="username"
				    placeholder="Nhập tài khoản"
				    name="username"
				  />
				</div>
				<div class="form-group">
				  <label for="password" class="userNamePassword">Mật khẩu:</label>
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
				</div>
				<button type="submit" class="btn btn-primary">
				  Đăng nhập
				</button>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
      const togglePassword = document.querySelector("#togglePassword");
      const password = document.querySelector("#password");

      togglePassword.addEventListener("click", function (e) {
        // toggle the type attribute
        const type =
          password.getAttribute("type") === "password" ? "text" : "password";
        password.setAttribute("type", type);
        // toggle the eye slash icon
        this.querySelector("i").classList.toggle("bi-eye");
        this.querySelector("i").classList.toggle("bi-eye-slash");
      });
    </script>
  </body>
</html>
