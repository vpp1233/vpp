<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Footer</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
      rel="stylesheet" />

    <link href="${pageContext.request.contextPath}/views/footer/footer.css" rel="stylesheet">

  </head>

  <body>
    <div class="footer">
      <div class="row custom-row">
        <div class="col-md-4">
          <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Logo" />
        </div>
        <div class="col-md-4">
          <h3>Liên hệ</h3>
          <div class="container-contact">
            <div class="content-contact">
              <div>
                <i class="bi bi-geo-alt-fill" style="font-size: 20px"></i>
              </div>
              <div>Địa chỉ: 125 Xuân Thủy, Cầu Giấy, Hà Nội.</div>
            </div>
            <div class="content-contact">
              <div>
                <i class="bi bi-telephone-inbound-fill" style="font-size: 20px"></i>
              </div>
              <div>Điện thoại: 0123 456 789</div>
            </div>
            <div class="content-contact">
              <div>
                <i class="bi bi-envelope-check-fill" style="font-size: 20px"></i>
              </div>
              <div>starfruit1st@gmail.com</div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <h3>Mạng xã hội</h3>
          <div class="content-social">
            <a href="https://www.facebook.com/"><i class="bi bi-facebook fa-2xl"
                style="font-size: 24px; color: black"></i></a>
            <a href="https://www.youtube.com/"><i class="bi bi-youtube" style="font-size: 24px; color: black"></i></a>
            <a href="https://www.tiktok.com/"><i class="bi bi-tiktok" style="font-size: 24px; color: black"></i></a>
            <a href="https://www.instagram.com/"><i class="bi bi-instagram"
                style="font-size: 24px; color: black"></i></a>
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