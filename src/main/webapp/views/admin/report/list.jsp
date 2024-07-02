<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Báo cáo doanh thu</title>

    <link
      href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <%@ include file="../header/header.jsp" %>

    <div class="container mt-5">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Báo cáo doanh thu</h2>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Ảnh</th>
            <th>Giá</th>
            <th>Mô tả</th>
            <th>Số lượng</th>
            <th>Trạng thái</th>
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
                <td>
                  <fmt:formatNumber value="${product.price}" type="number" />
                </td>
                <td>${product.description}</td>
                <td>
                  <fmt:formatNumber
                    value="${product.salePrice}"
                    type="number"
                  />
                </td>
                <td>${product.quantitySold}</td>
                <td>${product.status}</td>
                <td>${product.categoryName}</td>
              </tr>
            </c:forEach>
          </c:if>
        </tbody>
      </table>
    </div>
    <%@ include file="../footer/footer.jsp" %>
  </body>
</html>
