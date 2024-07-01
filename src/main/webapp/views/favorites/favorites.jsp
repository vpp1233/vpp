<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sản phẩm yêu thích</title>
    <link
      href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css"
      rel="stylesheet"
    />

    <link
      href="${pageContext.request.contextPath}/views/favorites/favorites.css"
      rel="stylesheet"
    />
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <style>
      .product-card {
        min-height: 490px; /* Đặt chiều cao tối thiểu cho sản phẩm */
      }
    
    </style>
  </head>

  <body>
    <%@ include file="../header/header.jsp" %>

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
        <c:when test="${not empty favoriteProducts}">
          <c:forEach var="entry" items="${favoriteProducts}">
            <div class="row d-flex flex-column">
              <div class="d-flex justify-content-between ml-5 mr-5">
                <c:if test="${not empty entry.value}">
				    <h4>${entry.key}</h4>
				    
				</c:if>
              </div>
              <div class="d-flex justify-content-center">
                <c:forEach var="product" items="${entry.value}">
                  <div
                    class="col-md-2 mb-4"
                    role="button">
                    <div
                      class="card rounded-2 product-card d-flex align-items-stretch"
                    >
                      <img src="${pageContext.request.contextPath}${product.image}" alt="Product Image" class="img-fluid">
                      <div
                        class="card-body d-flex flex-column align-items-stretch"
                      >
                        <h6 class="card-title">${product.productName}</h6>
                        <p class="card-text">${product.description}.</p>
                        <p class="card-text">Giá: ${product.price} VND</p>
                        <c:choose>
                        	<c:when test="${empty role}">
                        		<button class="btn btn-warning btn-block" onclick="showLoginAlert()">Thêm vào giỏ hàng</button>
                    		</c:when>
                    		<c:otherwise>
                            <form method="post" action="${pageContext.request.contextPath}/cart">
	                            <input type="hidden" name="action" value="add">
	                            <input type="hidden" name="productId" value="${product.productId}">
	                            <div class="input-group mb-3 justify-content-center">
	                                <div class="input-group-prepend">
	                                    <button type="button" class="btn btn-outline-secondary" onclick="decreaseQuantity(this)">-</button>
	                                </div>
	                                <input type="number" name="quantity" class="text-center" value="1" min="1" max="99">
	                                <div class="input-group-append">
	                                    <button type="button" class="btn btn-outline-secondary" onclick="increaseQuantity(this)">+</button>
	                                </div>
	                            </div>
	                            <button type="submit" class="btn btn-warning btn-block">Thêm vào giỏ hàng</button>
                        	</form>
                        	</c:otherwise>
                        </c:choose>
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

    <%@ include file="../footer/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script>
	    function showLoginAlert() {
	        alert("Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng.");
	    }
	    
	    function decreaseQuantity(button) {
	        var input = button.parentElement.nextElementSibling;
	        var currentValue = parseInt(input.value);
	        if (currentValue > 1) {
	            input.value = currentValue - 1;
	        }
	    }
	    
	    function increaseQuantity(button) {
	        var input = button.parentElement.previousElementSibling;
	        var currentValue = parseInt(input.value);
	        if (currentValue < 99) {
	            input.value = currentValue + 1;
	        }
	    }
	</script>
  </body>
</html>
