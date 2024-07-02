<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đặt hàng</title>
    <link
      href="${pageContext.request.contextPath}/assets/css/bootstrap452.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <%@ include file="../../views/header/header.jsp" %>
    <div class="text-center mt-3 mb-3">
      <h3>Chúc mừng bạn đã đặt hàng thành công</h3>
      <button class="btn btn-primary">
        <a href="${pageContext.request.contextPath}" class="text-white"
          >Tiếp tục mua hàng</a
        >
      </button>
    </div>

    <%@ include file="../footer/footer.jsp" %>
  </body>
</html>
