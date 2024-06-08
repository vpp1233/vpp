<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />

    <link
      href="${pageContext.request.contextPath}/views/admin/header/header.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <!-- Header với Bootstrap -->
    <nav class="navbar navbar-expand-lg navbar-custom">
      <div style="display: flex">
        <a class="navbar-brand" href="index">
          <img
            src="${pageContext.request.contextPath}/images/logo.jpg"
            alt="Logo"
          />
        </a>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="index">Danh sách user</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="login">Danh sách sản phẩm</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register">Báo cáo doanh thu</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="favorites"
                >Danh sách sản phẩm ưa thích</a
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
          <li class="nav-item">
            <div>
              <span
                ><i
                  class="bi bi-person-circle"
                  style="font-size: 20px; margin-left: 10px"
                ></i
              ></span>
              Xin chào admin: duc
            </div>
          </li>
        </ul>
      </div>
    </nav>

    <!-- Nội dung của trang -->

    <!-- Bootstrap JavaScript and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
