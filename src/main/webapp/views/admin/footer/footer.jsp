<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Footer</title>
    <!-- Bootstrap CSS -->
    <link
      href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/views/footer/footer.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <div class="footer">
      <div class="row custom-row">
        <div class="col-md-4">
          <img
            src="${pageContext.request.contextPath}/views/images/logo.jpg"
            alt="Logo"
          />
        </div>
        <div class="col-md-4">
          <h3>Liên hệ</h3>
          <div class="container-contact">
            <div class="content-contact">
              <div>
                <image
                  src="${pageContext.request.contextPath}/views/images/geo-alt-fill.svg"
                  width="20"
                  height="20"
                />
              </div>
              <div>Địa chỉ: 125 Xuân Thủy, Cầu Giấy, Hà Nội.</div>
            </div>
            <div class="content-contact">
              <div>
                <image
                  src="${pageContext.request.contextPath}/views/images/telephone-inbound-fill.svg"
                  width="20"
                  height="20"
                />
              </div>
              <div>Điện thoại: 0123 456 789</div>
            </div>
            <div class="content-contact">
              <div>
                <image
                  src="${pageContext.request.contextPath}/views/images/envelope-arrow-down-fill.svg"
                  width="20"
                  height="20"
                />
              </div>
              <div>starfruit1st@gmail.com</div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <h3>Mạng xã hội</h3>
          <div class="content-social">
            <a href="https://www.facebook.com/" role="button">
              <image
                src="${pageContext.request.contextPath}/views/images/facebook.svg"
                width="20"
                height="20"
              />
            </a>
            <a href="https://www.youtube.com/" role="button">
              <image
                src="${pageContext.request.contextPath}/views/images/youtube.svg"
                width="20"
                height="20"
            /></a>
            <a href="https://www.tiktok.com/" role="button"
              ><image
                src="${pageContext.request.contextPath}/views/images/tiktok.svg"
                width="20"
                height="20"
            /></a>
            <a href="https://www.instagram.com/" role="button"
              ><image
                src="${pageContext.request.contextPath}/views/images/instagram.svg"
                width="20"
                height="20"
            /></a>
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
  </body>
</html>
