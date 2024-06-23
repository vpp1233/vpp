<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giỏ hàng</title>
    <link
      href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css"
      rel="stylesheet"
    />
    <link href="${pageContext.request.contextPath}/views/cart/cart.css" rel="stylesheet"> 
</head>
<body>
    <%@ include file="../header/header.jsp" %>

    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Giỏ hàng của bạn</h2>
        </div>
        <div class="row">
            <c:forEach var="item" items="${cartByUsers}">
                <div class="col-md-4 mb-4">
                    <div class="card rounded-2 product-card">
                        <div class="card-body">
                        	<img src="${pageContext.request.contextPath}${item.image}" alt="Product Image" class="card-img-top img-fluid">
                        	<p class="card-text">Tên sản phẩm: ${item.productName}</p>
                            <p class="card-text">Số lượng: ${item.quantity}</p>
                            <a href="${pageContext.request.contextPath}/cart?action=delete&cartId=${item.cartId}" class="btn btn-danger">Xóa</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <c:if test="${empty cartByUsers}">
            <div>Hiện chưa có sản phẩm nào trong giỏ hàng của bạn.</div>
        </c:if>
    </div>

    <%@ include file="../footer/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
</body>
</html>