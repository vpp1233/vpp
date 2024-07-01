<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giỏ hàng</title>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css" rel="stylesheet" />
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
		        <div class="col-12 mb-4">
		            <div class="card rounded-2 product-card">
		                <div class="card-body d-flex flex-row">
		                    <img src="${pageContext.request.contextPath}${item.image}" alt="Product Image"
		                        class="card-img-top img-fluid" style="max-width: 150px; margin-right: 20px;">
		                    <div>
		                        <p class="card-text">Tên sản phẩm: ${item.productName}</p>
		                        <p class="card-text quantity" data-quantity="${item.quantity}">Số lượng: ${item.quantity}</p>
		                        <p class="card-text price" data-price="${item.price}">Giá: <span id="formatted-price-${item.cartId}"></span></p>
		                        <p class="card-text totalPrice" data-price="${item.price * item.quantity}">Tổng giá: <span id="formatted-total-price-${item.cartId}"></span></p>
		                    </div>
		                    <div>
		                        <a href="${pageContext.request.contextPath}/cart?action=delete&cartId=${item.cartId}"
		                            class="btn btn-danger">Xóa</a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </c:forEach>
		</div>

        <div class="d-flex justify-content-between align-items-center mt-4 mb-4">
            <h4 id="totalPrice">Tổng tiền: 0</h4>
            <a href="${pageContext.request.contextPath}/cart?action=order" class="btn btn-primary">Đặt hàng</a>
        </div>

        <c:if test="${empty cartByUsers}">
            <div>Hiện chưa có sản phẩm nào trong giỏ hàng của bạn.</div>
        </c:if>
    </div>

    <%@ include file="../footer/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
    <script>
	    function calculateTotalPrice() {
	        let totalPrice = 0;
	        const priceElements = document.querySelectorAll('.price');
	        const quantityElements = document.querySelectorAll('.quantity');
	
	        priceElements.forEach((priceElement, index) => {
	            const price = parseFloat(priceElement.getAttribute('data-price'));
	            const quantity = parseFloat(quantityElements[index].getAttribute('data-quantity'));
	            totalPrice += price * quantity;
	        });
	
	        document.getElementById('totalPrice').innerText = 'Tổng tiền: ' + totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
	    }
		
	 // Định dạng giá tiền
	    document.addEventListener('DOMContentLoaded', function() {
	        let priceElements = document.querySelectorAll('.card-text.price');
	        priceElements.forEach((priceElement) => {
	            let rawPrice = priceElement.getAttribute('data-price');
	            let price = parseFloat(rawPrice);
	            let formattedPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
	            let formattedPriceId = priceElement.querySelector('span').id;
	            document.getElementById(formattedPriceId).innerText = formattedPrice;
	        });

	        // Định dạng tổng giá
	        let totalPriceElements = document.querySelectorAll('.card-text.totalPrice');
	        totalPriceElements.forEach((totalPriceElement) => {
	            let rawTotalPrice = totalPriceElement.getAttribute('data-price');
	            let totalPrice = parseFloat(rawTotalPrice);
	            let formattedTotalPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(totalPrice);
	            let formattedTotalPriceId = totalPriceElement.querySelector('span').id;
	            document.getElementById(formattedTotalPriceId).innerText = formattedTotalPrice;
	        });
	    });
        
        window.onload = function() {
            calculateTotalPrice();
            formatPrice();
            formatTotalPrice();
        };
    </script>
</body>

</html>
