<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Danh sách sản phẩm</title>

    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <%@ include file="../header/header.jsp" %>

    <div class="container mt-5">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Quản lý sản phẩm</h2>
        <button class="btn btn-success">
          <a
            href="${pageContext.request.contextPath}/admin/product?action=new"
            style="color: black; text-decoration: none"
            >Thêm mới</a
          >
        </button>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Ảnh</th>
            <th>Giá</th>
            <th>Mô tả</th>
            <th>Giá khuyến mại</th>
            <th>Số lượng</th>
            <th>Trạng thái</th>
            <th>Sản phẩm yêu thích</th>
            <th>Danh mục</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${not empty productList}">
            <c:forEach var="product" items="${productList}">
              <tr>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.image}</td>
                <td><fmt:formatNumber value="${product.price}" type="number" /></td>
                <td>${product.description}</td>
                <td><fmt:formatNumber value="${product.salePrice}" type="number" /></td>
                <td>${product.quantitySold}</td>
                <td>${product.status}</td>
                <td>${product.isfavorite}</td>
                <td>${product.categoryName}</td>

                <td style="display: flex; justify-content: space-around">
                  <a href="product?action=edit&productId=${product.productId}">
                    <i class="bi bi-pencil-fill" style="color: brown"></i>
                  </a>
                  &nbsp
                  &nbsp
                  &nbsp
                  <a
                    href="product?action=delete&productId=${product.productId}"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');"
                  >
                    <i class="bi bi-trash3-fill" style="color: red"></i>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </c:if>
        </tbody>
      </table>
    </div>
    <%@ include file="../footer/footer.jsp" %>
  </body>
</html>
