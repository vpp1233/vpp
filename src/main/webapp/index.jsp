<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Văn Phòng Phẩm Bizfly</title>
    <style>
      .product-card {
        min-height: 490px; /* Đặt chiều cao tối thiểu cho sản phẩm */
      }
      .custom-control {
        background-color: rgba(255, 255, 255, 0.6); /* Màu nền trắng nhạt */
        border-radius: 50%;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .custom-control:hover {
        background-color: rgba(
          255,
          255,
          255,
          0.9
        ); /* Màu nền trắng đậm khi hover */
      }

      .custom-icon {
        background-image: none;
        border: 1px solid black;
        border-radius: 50%;
        width: 25px;
        height: 25px;
        display: inline-block;
        background-color: black;
      }

      .custom-control-prev .custom-icon:after {
        content: "";
        border: solid white;
        border-width: 0 3px 3px 0;
        display: inline-block;
        padding: 3px;
        transform: rotate(135deg);
        margin-left: 3px;
      }

      .custom-control-next .custom-icon:after {
        content: "";
        border: solid white;
        border-width: 0 3px 3px 0;
        display: inline-block;
        padding: 3px;
        transform: rotate(-45deg);
        margin-right: 3px;
      }
    </style>
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <%@ include file="./views/header/header.jsp" %>

    <div class="mt-5 pl-5 pr-5">
      <div id="bannerCarousel" class="carousel slide mb-3" data-ride="carousel">
        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li
            data-target="#bannerCarousel"
            data-slide-to="0"
            class="active"
          ></li>
          <li data-target="#bannerCarousel" data-slide-to="1"></li>
          <li data-target="#bannerCarousel" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
          <div class="carousel-item active" data-interval="2000">
            <img
              src="${pageContext.request.contextPath}/views/images/banner1.jpg"
              alt="Banner1"
              class="d-block w-100 img-fluid"
            />
          </div>
          <div class="carousel-item" data-interval="2000">
            <img
              src="${pageContext.request.contextPath}/views/images/banner2.jpg"
              alt="Banner2"
              class="d-block w-100 img-fluid"
            />
          </div>
          <div class="carousel-item" data-interval="2000">
            <img
              src="${pageContext.request.contextPath}/views/images/banner3.jpg"
              alt="Banner3"
              class="d-block w-100 img-fluid"
            />
          </div>
        </div>

        <a
          class="carousel-control-prev"
          href="#bannerCarousel"
          data-slide="prev"
        >
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a
          class="carousel-control-next"
          href="#bannerCarousel"
          data-slide="next"
        >
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>

      <c:choose>
        <c:when test="${not empty categoryProducts}">
          <c:forEach var="entry" items="${categoryProducts}">
            <div class="row d-flex flex-column">
              <div class="d-flex justify-content-between ml-5 mr-5">
                <h4>${entry.key}</h4>
                <div role="button" class="fs-4">
                  <a href="#">Xem tất cả</a>
                </div>
              </div>
              <div class="d-flex justify-content-center">
                <c:forEach var="product" items="${entry.value}">
                  <div class="col-md-2 mb-4" role="button">
                    <div
                      class="card rounded-2 product-card d-flex align-items-stretch"
                    >
                      <c:choose>
                        <c:when test="${entry.key == 'Bảng'}">
                          <img
                            src="${pageContext.request.contextPath}/views/images/bang.jpg"
                            alt="Bảng"
                            class="img-fluid"
                          />
                        </c:when>
                        <c:when test="${entry.key == 'Balo'}">
                          <img
                            src="${pageContext.request.contextPath}/views/images/balo.jpg"
                            alt="Balo"
                            class="img-fluid"
                          />
                        </c:when>
                        <c:when test="${entry.key == 'Sách'}">
                          <img
                            src="${pageContext.request.contextPath}/views/images/sach.jpg"
                            alt="Sách"
                            class="img-fluid"
                          />
                        </c:when>
                        <c:when test="${entry.key == 'Bút'}">
                          <img
                            src="${pageContext.request.contextPath}/views/images/but.jpg"
                            alt="Bút"
                            class="img-fluid"
                          />
                        </c:when>
                        <c:otherwise>
                          <img
                            src="${pageContext.request.contextPath}/views/images/logo.jpg"
                            alt="Default"
                            class="img-fluid"
                          />
                        </c:otherwise>
                      </c:choose>
                      <div
                        class="card-body d-flex flex-column align-items-stretch"
                      >
                        <h6 class="card-title">${product.productName}</h6>
                        <p class="card-text">${product.description}.</p>
                        <p class="card-text">Giá: ${product.price} VND</p>
                        <a
                          href="${pageContext.request.contextPath}/cart"
                          class="btn btn-warning"
                          style="width: -webkit-fill-available"
                          >Thêm vào giỏ hàng</a
                        >
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <p>Không có sản phẩm nào.</p>
        </c:otherwise>
      </c:choose>
    </div>
    <%@ include file="./views/footer/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  </body>
</html>
