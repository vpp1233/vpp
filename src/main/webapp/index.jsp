<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

    <h2>Danh sách sản phẩm</h2>
    
    <div id="category-products"></div>
     
    </div>
    <%@ include file="./views/footer/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            fetch('${pageContext.request.contextPath}/web/home')
                .then(response => response.json())
                .then(data => {
                    const container = document.getElementById('category-products');
                    for (const [category, products] of Object.entries(data)) {
                        const categoryElement = document.createElement('h2');
                        categoryElement.textContent = category;
                        container.appendChild(categoryElement);

                        const productList = document.createElement('ul');
                        products.forEach(product => {
                            const productItem = document.createElement('li');
                            productItem.innerHTML = `
                                <strong>${product.productName}</strong><br>
                                <img src="${product.image}" alt="${product.productName}" style="width:100px;height:100px;"><br>
                                Price: ${product.price}<br>
                                Description: ${product.description}<br>
                            `;
                            productList.appendChild(productItem);
                        });
                        container.appendChild(productList);
                    }
                })
                .catch(error => console.error('Error:', error));
        });
    </script>
  </body>
</html>
