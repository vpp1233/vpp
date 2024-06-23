<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
        <h2>Tất cả sản phẩm</h2>
    </div>
    <c:if test="${not empty allProduct}">
        <div class="row">
            <c:forEach var="product" items="${allProduct}">
                <div class="col-md-4 mb-4">
                    <div class="card rounded-2 product-card">
                        <img src="${pageContext.request.contextPath}${product.image}" alt="Product Image" class="img-fluid">
                        <div class="card-body">
                            <h5 class="card-title">${product.productName}</h5>
                            <p class="card-text">${product.description}.</p>
                            <p class="card-text">Giá: ${product.price} VND</p>
                            
							<c:choose>
                                <c:when test="${empty role}">
                                    <button class="btn btn-warning btn-block" onclick="showLoginAlert()">Thêm vào giỏ hàng</button>
                                </c:when>
                                <c:otherwise>
                                    <form action="${pageContext.request.contextPath}/cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${product.productId}">
                                
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <button type="button" class="btn btn-outline-secondary" onclick="decreaseQuantity(this)">-</button>
                                    </div>
                                    <input type="number" name="quantity" class="form-control" value="1" min="1" max="99">
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
    </c:if>
</div>
<%@ include file="../footer/footer.jsp" %>

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
