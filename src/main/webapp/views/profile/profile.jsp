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
    <title>Hồ sơ tài khoản</title>
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
        /* max-width: 500px; */
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

      .emailPasword {
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
        <h2 class="text-center">Thông tin tài khoản</h2>
        <form action="profile" method="post">
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
            <div id="emailError" class="text-danger error-message"></div>
          </div>
          <div class="form-group">
            <label for="fullName" class="emailPasword">Họ và tên:</label>
            <input
              type="text"
              class="form-control"
              id="fullName"
              placeholder="Nhập họ và tên"
              name="fullName"
            />
            <div id="fullNameError" class="text-danger error-message"></div>
          </div>
          <div class="form-group">
            <label for="phone" class="emailPasword">Số điện thoại:</label>
            <input
              type="number"
              class="form-control"
              id="phone"
              placeholder="Nhập số điện thoại"
              name="phone"
            />
            <div id="phoneError" class="text-danger error-message"></div>
          </div>

          <div class="form-group">
            <label for="address" class="emailPasword">Địa chỉ:</label>
            <input
              type="address"
              class="form-control"
              id="address"
              placeholder="Nhập địa chỉ của bạn"
              name="address"
            />
            <div id="addressError" class="text-danger error-message"></div>
          </div>
          <div style="display: flex; gap: 10px">
            <button type="submit" class="btn btn-secondary">
              <a href="home" style="color: black">Thoát</a>
            </button>

            <button type="submit" class="btn btn-primary" id="toggleProfile">
              Lưu thông tin
            </button>
          </div>
        </form>
      </div>
    </div>

    <%@ include file="../footer/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");

        form.addEventListener("submit", function (event) {
          const email = document.querySelector("#email").value;
          const fullName = document.querySelector("#fullName").value;
          const phone = document.querySelector("#phone").value;
          const address = document.querySelector("#address").value;

          const emailError = document.querySelector("#emailError");
          const fullNameError = document.querySelector("#fullNameError");
          const phoneError = document.querySelector("#phoneError");
          const addressError = document.querySelector("#addressError");

          let isValid = true;

          // Kiểm tra email không được rỗng và phải đúng định dạng
          if (email.trim() === "") {
            emailError.innerText = "Email không được để trống.";
            isValid = false;
          } else if (!isValidEmail(email)) {
            emailError.innerText = "Email không hợp lệ.";
            isValid = false;
          } else {
            emailError.innerText = ""; // Xóa thông báo lỗi nếu có
          }

          // Kiểm tra họ và tên không được rỗng
          if (fullName.trim() === "") {
            fullNameError.innerText = "Họ và tên không được để trống.";
            isValid = false;
          } else {
            fullNameError.innerText = ""; // Xóa thông báo lỗi nếu có
          }

          // Kiểm tra số điện thoại không được rỗng
          if (phone.trim() === "") {
            phoneError.innerText = "Số điện thoại không được để trống.";
            isValid = false;
          } else {
            phoneError.innerText = ""; // Xóa thông báo lỗi nếu có
          }

          // Kiểm tra địa chỉ không được rỗng
          if (address.trim() === "") {
            addressError.innerText = "Địa chỉ không được để trống.";
            isValid = false;
          } else {
            addressError.innerText = ""; // Xóa thông báo lỗi nếu có
          }

          if (!isValid) {
            event.preventDefault(); // Ngăn form gửi đi nếu có lỗi
          }
          form.submit(alert("Coming soon!"), (window.location.href = "/"));
        });
      });

      function isValidEmail(email) {
        // Kiểm tra định dạng email bằng regular expression
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
      }
    </script>
  </body>
</html>
