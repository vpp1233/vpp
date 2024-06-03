<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Footer</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <style>
      /* Định dạng phần footer */
      .footer {
        background-color: #f9ffdb;
        color: black;
        padding: 20px 0;
        text-align: center;
      }
      .infor {
        display: flex;
        gap: 10px;
      }
      .social {
        display: flex;
        gap: 10px;
      }
      .custom-row {
        display: flex;
        align-items: center;
      }
    </style>
  </head>
  <body>
    <div class="footer">
      <div class="row custom-row">
        <div class="col-md-4">
          <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Logo" />
        </div>
        <div class="col-md-4">
          <h3>Văn Phòng Phẩm Bizfly</h3>
          <div class="infor">
            <span><i class="bi bi-map-fill"></i></span><p>Địa chỉ: 125 Xuân Thủy, Cầu Giấy, Hà Nội.</p>
          </div>
          <div class="infor">
            <span><i class="bi bi-telephone-fill"></i></span><p>Điện thoại: 0123 456 789</p>
          </div>
          <div class="infor">
            <span><i class="bi bi-envelope-fill"></i></span><p>starfruit1st@gmail.com</p>
          </div>
        </div>
        <div class="col-md-4">
          <h3>Mạng xã hội</h3>
          <div class="socical">
            <div>
              <a href="https://www.youtube.com/"><i class="bi bi-youtube"></i></a>
            </div>
            <div>
              <a href="https://www.facebook.com/"><i class="bi bi-facebook"></i></a>
            </div>
            <div>
              <a href="https://tiktok.com/"><i class="bi bi-tiktok"></i></a>
            </div>
            <div>
              <a href="https://www.instagram.com/"><i class="bi bi-instagram"></i></a>
            </div>
          </div>
          
        </div>
      </div>
      <div style="margin-top: 15px">
        <p style="font-weight: 500">
          2024 © BizFly.vn Bản quyền thuộc công ty cổ phần BizFly
        </p>
      </div>
    </div>

    <!-- Bootstrap JavaScript and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
