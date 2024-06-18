<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header</title>
    
    <link
      href="${pageContext.request.contextPath}/views/header/header.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <% HttpSession currentSession = request.getSession(false); String userName =
    (currentSession != null) ? (String) currentSession.getAttribute("user") :
    null; Integer role = (currentSession != null) ? (Integer)
    currentSession.getAttribute("role") : null; %>

    <!-- Header với Bootstrap -->

    <nav class="navbar navbar-expand-lg navbar-custom">
      <div style="display: flex">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">
          <img
            src="${pageContext.request.contextPath}/views/images/logo.jpg"
            alt="Logo"
          />
        </a>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}"
                >Trang chủ</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/login"
                >Đăng nhập</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/register"
                >Đăng ký</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/favorites"
                >Sản phẩm ưa thích</a
              >
            </li>
          </ul>
        </div>
      </div>

      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div
        class="collapse navbar-collapse"
        id="navbarNav"
        style="margin-right: 100px; justify-content: end"
      >
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="accountDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              Tài khoản
              <span
                ><i
                  class="bi bi-person-circle"
                  style="font-size: 20px; margin-left: 10px"
                ></i
              ></span>
            </a>
            <div class="dropdown-menu" aria-labelledby="accountDropdown">
              <a
                class="dropdown-item"
                href="${pageContext.request.contextPath}/profile"
                >Hồ sơ</a
              >
              <a
                class="dropdown-item"
                href="${pageContext.request.contextPath}/logout"
                >Đăng xuất</a
              >
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/cart"
              >Giỏ hàng
              <span
                ><i
                  class="bi bi-cart-fill"
                  style="font-size: 20px; margin-left: 10px"
                ></i></span
            ></a>
          </li>
        </ul>
      </div>
    </nav>

    <!-- Nội dung của trang -->

    <!-- Bootstrap JavaScript and dependencies -->
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
