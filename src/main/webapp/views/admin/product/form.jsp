<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
  
    <title>Form sản phẩm</title>
  </head>
  <body>
    <div class="container mt-5">
      <h2>
        <c:choose>
          <c:when test="${not empty product}"> Chỉnh sửa sản phẩm </c:when>
          <c:otherwise> Thêm sản phẩm mới </c:otherwise>
        </c:choose>
      </h2>
      <form
        action="${pageContext.request.contextPath}/admin/product"
        method="post"
        onsubmit="return validateForm()"
        class="needs-validation"
        novalidate
      >
        <c:if test="${not empty product.productId}">
          <input type="hidden" name="productId" value="${product.productId}" />
          <input type="hidden" name="action" value="update" />
        </c:if>
        <c:if test="${empty product.productId}">
          <input type="hidden" name="action" value="insert" />
        </c:if>

        <div class="form-group">
          <label for="productName">Tên sản phẩm:</label>
          <input
            type="text"
            class="form-control"
            id="productName"
            name="productName"
            value="${product.productName}"
            required
          />
          <div class="invalid-feedback">Vui lòng nhập tên sản phẩm.</div>
        </div>

        <div class="form-group">
          <label for="image">Ảnh:</label>
          <input
            type="text"
            class="form-control"
            id="image"
            name="image"
            value="${product.image}"
          />
        </div>

        <div class="form-group">
          <label for="price">Giá:</label>
          <input
            type="number"
            class="form-control"
            id="price"
            name="price"
            value="${product.price}"
            required
          />
          <div class="invalid-feedback">Vui lòng nhập giá.</div>
        </div>

        <div class="form-group">
          <label for="description">Mô tả:</label>
          <input
            type="text"
            class="form-control"
            id="description"
            name="description"
            value="${product.description}"
          />
        </div>

        <div class="form-group">
          <label for="salePrice">Giá khuyến mại:</label>
          <input
            type="number"
            class="form-control"
            id="salePrice"
            name="salePrice"
            value="${product.salePrice}"
          />
        </div>

        <div class="form-group">
          <label for="quantitySold">Số lượng:</label>
          <input
            type="number"
            class="form-control"
            id="quantitySold"
            name="quantitySold"
            value="${product.quantitySold}"
            required
          />
          <div class="invalid-feedback">Vui lòng nhập số lượng.</div>
        </div>

        <div class="form-group">
            <label for="status">Trạng thái:</label>
            <select class="form-control" id="status" name="status" required>
              <option value="">Chọn trạng thái</option>
              <option value="0" ${product.status == 0 ? 'selected' : ''}>Ẩn sản phẩm</option>
              <option value="1" ${product.status == 1 ? 'selected' : ''}>Hiện sản phẩm </option>
            </select>
            <div class="invalid-feedback">Vui lòng chọn trạng thái.</div>
          </div>

        <div class="form-group">
            <label for="isFavorite">Sản phẩm yêu thích:</label>
            <select class="form-control" id="isFavorite" name="isFavorite" required>
              <option value="0" ${product.isfavorite == 0 || product.isfavorite == null ? 'selected' : ''}>Thường</option>
              <option value="1" ${product.isfavorite == 1 ? 'selected' : ''}>Yêu thích</option>
            </select>
            <div class="invalid-feedback">Vui lòng chọn trạng thái yêu thích của sản phẩm.</div>
          </div>

       

        <div class="form-group">
          <label for="categoryDropdown">Danh mục:</label>
          <select class="form-control" id="categoryDropdown" required>
            <option value="">Chọn category</option>
            <c:forEach items="${categories}" var="category">
              <option
                value="${category.categoryId}"
                data-name="${category.categoryName}"
              >
                ${category.categoryName}
              </option>
            </c:forEach>
          </select>
          <div class="invalid-feedback">Vui lòng chọn một danh mục.</div>
        </div>
        <input
          type="hidden"
          id="categoryId"
          name="categoryId"
          value="${product.categoryId}"
        />
        <input
          type="hidden"
          id="categoryName"
          name="categoryName"
          value="${product.categoryName}"
        />

        <div class="form-row">
          <div class="col-6">
            <button type="submit" class="btn btn-primary btn-block">
              Lưu sản phẩm
            </button>
          </div>
          <div class="col-6">
            <a
              href="${pageContext.request.contextPath}/admin/product?action=list"
              class="btn btn-secondary btn-block"
              >Trở về danh sách</a
            >
          </div>
        </div>
      </form>
    </div>
  </body>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function () {
      // AJAX để lấy danh sách categories khi trang tải
      $.ajax({
        url: "${pageContext.request.contextPath}/admin/category",
        type: "GET",
        data: {
          action: "ajax", // Thêm tham số action để nhận biết yêu cầu từ AJAX
        },
        success: function (response) {
          $("#categoryDropdown").empty();
          $("#categoryDropdown").append(
            '<option value="">Chọn category</option>'
          );
          $.each(response, function (index, category) {
            // Giả sử response là một mảng JSON của các category
            $("#categoryDropdown").append(
              '<option value="' +
                category.categoryId +
                '" data-name="' +
                category.categoryName +
                '">' +
                category.categoryName +
                "</option>"
            );
          });

          // Gán giá trị categoryId và categoryName từ product nếu có
          var selectedCategoryId = "${product.categoryId}";
          if (selectedCategoryId) {
            $("#categoryDropdown").val(selectedCategoryId);
            $("#categoryId").val(selectedCategoryId);

            var selectedCategoryName = $(
              "#categoryDropdown option:selected"
            ).data("name");
            $("#categoryName").val(selectedCategoryName);
          }
        },
        error: function (xhr, status, error) {
          console.log("Error:", error);
        },
      });

      // Khi người dùng chọn một category
      $("#categoryDropdown").change(function () {
        var selectedCategoryId = $(this).val();
        var selectedCategoryName = $("#categoryDropdown option:selected").data(
          "name"
        );
        $("#categoryId").val(selectedCategoryId);
        $("#categoryName").val(selectedCategoryName);
      });
    });

    function validateForm() {
      var selectedCategoryId = $("#categoryDropdown").val();
      if (!selectedCategoryId) {
        alert("Vui lòng chọn một danh mục.");
        $("#categoryDropdown").focus();
        return false; // Ngăn không cho biểu mẫu được gửi
      }
      return true; // Cho phép gửi biểu mẫu nếu đã chọn danh mục
    }
  </script>
</html>
