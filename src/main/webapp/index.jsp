<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Văn Phòng Phẩm Bizfly</title>
    <link
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet"
  />
  <link
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
    rel="stylesheet"
  />
    <style>
        .card {
            border-radius: 10px;
        }
        .card-img-top {
            border-radius: 10px 10px 0 0;
        }
        .card-body {
            text-align: center;
        }
        .carousel-control-prev,
        .carousel-control-next {
            width: 5%;
        }
    </style>
    </style>
  </head>

  <body>
    <%@ include file="./views/header/header.jsp" %>

    <div class="mt-5 pl-5 pr-5">
      <div>
        <h2>Danh sách bút</h2>
        <div id="carouselPen" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="row">
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 1"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Bút 1</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm bút 1.</p>
                      <p class="card-text">123,456 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 2"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Bút 2</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm bút 2.</p>
                      <p class="card-text">234,567 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 3"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Bút 3</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm bút 3.</p>
                      <p class="card-text">345,678 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 4"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Bút 4</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm bút 4.</p>
                      <p class="card-text">456,789 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
  
            <div class="carousel-item">
              <div class="row">
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 5"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Bút 5</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm bút 5.</p>
                      <p class="card-text">567,890 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 1"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 1</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm cặp sách 1.
                      </p>
                      <p class="card-text">678,901 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 2"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 2</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm cặp sách 2.
                      </p>
                      <p class="card-text">789,012 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 3"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 3</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm cặp sách 3.
                      </p>
                      <p class="card-text">890,123 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <a
            class="carousel-control-prev"
            href="#carouselPen"
            role="button"
            data-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a
            class="carousel-control-next"
            href="#carouselPen"
            role="button"
            data-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
      <div>
        <h2>Danh sách cặp sách</h2>
        <div id="carouselBag" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="row">
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 1"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 1</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm cặp sách 1.</p>
                      <p class="card-text">123,456 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 2"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 2</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm cặp sách 2.</p>
                      <p class="card-text">234,567 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 3"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 3</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm cặp sách 3.</p>
                      <p class="card-text">345,678 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 4"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 4</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm cặp sách 4.</p>
                      <p class="card-text">456,789 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
  
            <div class="carousel-item">
              <div class="row">
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 5"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 5</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm cặp sách 5.</p>
                      <p class="card-text">567,890 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 1"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 1</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm cặp sách 1.
                      </p>
                      <p class="card-text">678,901 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 2"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 2</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm cặp sách 2.
                      </p>
                      <p class="card-text">789,012 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 3"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Cặp sách 3</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm cặp sách 3.
                      </p>
                      <p class="card-text">890,123 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <a
            class="carousel-control-prev"
            href="#carouselBag"
            role="button"
            data-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a
            class="carousel-control-next"
            href="#carouselBag"
            role="button"
            data-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
      <div>
        <h2>Sách giáo khoa</h2>
        <div id="carouselBag" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="row">
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 1"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa 1</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm sách giáo khoa 1.</p>
                      <p class="card-text">123,456 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 2"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa 2</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm sách giáo khoa 2.</p>
                      <p class="card-text">234,567 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 3"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa 3</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm sách giáo khoa 3.</p>
                      <p class="card-text">345,678 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 4"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa  4</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm sách giáo khoa 4.</p>
                      <p class="card-text">456,789 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
  
            <div class="carousel-item">
              <div class="row">
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Bút 5"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa 5</h5>
                      <p class="card-text">Mô tả ngắn gọn về sản phẩm sách giáo khoa 5.</p>
                      <p class="card-text">567,890 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 1"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa 1</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm sách giáo khoa 1.
                      </p>
                      <p class="card-text">678,901 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 2"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa 2</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm sách giáo khoa 2.
                      </p>
                      <p class="card-text">789,012 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-4">
                  <div class="card">
                    <img
                      src="https://via.placeholder.com/150"
                      class="card-img-top"
                      alt="Cặp sách 3"
                    />
                    <div class="card-body">
                      <h5 class="card-title">Sách giáo khoa 3</h5>
                      <p class="card-text">
                        Mô tả ngắn gọn về sản phẩm sách giáo khoa 3.
                      </p>
                      <p class="card-text">890,123 VND</p>
                      <a href="#" class="btn btn-warning">Mua ngay</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <a
            class="carousel-control-prev"
            href="#carouselBag"
            role="button"
            data-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a
            class="carousel-control-next"
            href="#carouselBag"
            role="button"
            data-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
     
    </div>
    <%@ include file="./views/footer/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  </body>
</html>
