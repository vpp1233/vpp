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
    <% HttpSession currentSession = request.getSession(false); String userName =
    (currentSession != null) ? (String) currentSession.getAttribute("user") :
    null; Integer role = (currentSession != null) ? (Integer)
    currentSession.getAttribute("role") : null; %>
    <!-- Header với Bootstrap -->
    <form action="logout" method="post">
      <nav class="navbar navbar-expand-lg navbar-custom">
        <div style="display: flex">
          <a class="navbar-brand" href="index">
            <img
              src="${pageContext.request.contextPath}/webapp/images/logo.jpg"
              alt="Logo"
            />
          </a>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/user"
                  >Quản lý người dùng</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/product"
                  >Quản lý sản phẩm</a
                >
              </li>

              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/category"
                  >Quản lý danh mục</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/report"
                  >Báo cáo doanh thu</a
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
                <span
                  ><i
                    class="bi bi-person-circle"
                    style="font-size: 20px; margin-left: 10px"
                  ></i
                ></span>
                Xin chào, Admin
              </a>
              <div class="dropdown-menu" aria-labelledby="accountDropdown">
                <a
                  class="dropdown-item"
                  href="${pageContext.request.contextPath}/logout"
                  >Đăng xuất</a
                >
              </div>
            </li>
          </ul>
        </div>
      </nav>
    </form>

    <!-- Nội dung của trang -->

    <!-- Bootstrap JavaScript and dependencies -->
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
