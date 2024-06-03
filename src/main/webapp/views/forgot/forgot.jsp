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
        <h2 class="text-center">Quên mật khẩu</h2>
        <form>
          <div class="form-group">
            <label for="email" class="emailPasword">Email:</label>
            <input
              type="email"
              class="form-control"
              id="email"
              placeholder="Nhập email"
              name="email"
            />
          </div>

          <button type="submit" class="btn btn-primary" id="toggleForgot">
            Lấy lại mật khẩu
          </button>

          <div class="text-center mt-2">
            <span>Bạn có đăng ký tài khoản mới?</span>
            <a href="dangki"> Đăng ký</a>
          </div>
        </form>
      </div>
    </div>

    <%@ include file="../header/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
      const toggleForgot = document.querySelector("#toggleForgot");

      toggleForgot.addEventListener(
        "click",
        alert("Coming soon!"),
        setTimeout(() => {
          window.location.href = "home";
        }, 5000)
      );
    </script>
  </body>
</html>
