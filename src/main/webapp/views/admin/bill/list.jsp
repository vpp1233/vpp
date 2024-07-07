<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Bills</title>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
    </style>
</head>
<body>
    <%@ include file="../header/header.jsp" %>

    <div class="container mt-5">
        <h2>Danh sách hóa đơn</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Mã hóa đơn</th>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Ngày tạo</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bill" items="${listBill}">
                    <tr>
                        <td>${bill.billId}</td>
                        <td>
                            <c:forEach var="productName" items="${bill.productName}">
                                ${productName}<br/>
                            </c:forEach>
                        </td>
                        <td>
                            <fmt:formatNumber value="${bill.billPrice}" type="currency" currencyCode="VND" />
                        </td>
                        <td>${bill.createdAt}</td>
                        <td style="display: flex; justify-content: space-around">
			                 <a
			                   href="bill?action=delete&billId=${bill.billId}"
			                   onclick="return confirm('Bạn có chắc chắn muốn xóa hóa đơn này?');"
			                 >
			                   <image
			                     src="${pageContext.request.contextPath}/views/images/trash3-fill.svg"
			                     width="20"
			                     height="20"
			                     style="color: red"
			                   />
			                 </a>
		               </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%@ include file="../footer/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>