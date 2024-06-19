<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Văn Phòng Phẩm Bizfly</title>
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

    <h1>Product Categories</h1>

     <c:choose>
        <c:when test="${not empty categoryProducts}">
            <c:forEach var="entry" items="${categoryProducts}">
                <h2>${entry.key}</h2>
                <ul>
                    <c:forEach var="product" items="${entry.value}">
                        <li>
                            <strong>${product.productName}</strong><br>
                            Price: <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/><br>
                            Description: ${product.description}<br>
                        </li>
                    </c:forEach>
                </ul>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>No products available.</p>
        </c:otherwise>
    </c:choose>
     
    </div>
    <%@ include file="./views/footer/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  </body>
</html>
