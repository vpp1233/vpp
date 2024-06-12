<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form sản phẩm</title>
</head>
<body>
    <h2><c:choose>
        <c:when test="${not empty product}">
            Chỉnh sửa sản phẩm
        </c:when>
        <c:otherwise>
            Thêm sản phẩm mới
        </c:otherwise>
    </c:choose></h2>
    <form action="${pageContext.request.contextPath}/admin/product" method="post" onsubmit="return validateForm()">
        <c:if test="${not empty product.productId}">
            <input type="hidden" name="productId" value="${product.productId}" />
            <input type="hidden" name="action" value="update" />
        </c:if>
        <c:if test="${empty product.productId}">
            <input type="hidden" name="action" value="insert" />
        </c:if>
        <table>
            <tr>
                <td>Tên sản phẩm:</td>
                <td><input type="text" name=productName value="${product.productName}" required /></td>
            </tr>
            <tr>
                <td>Ảnh:</td>
                <td><input type="text" name="image" value="${product.image}" /></td>
            </tr>
            <tr>
                <td>Giá:</td>
                <td><input type="number" name="price" value="${product.price}"  required/></td>
            </tr>
            <tr>
                <td>Mô tả:</td>
                <td><input type="text" name="description" value="${product.description}" /></td>
            </tr>
            <tr>
                <td>Giá khuyến mại:</td>
                <td><input type="number" name="salePrice" value="${product.salePrice}" /></td>
            </tr>
            <tr>
                <td>Số lượng:</td>
                <td><input type="number" name="quantitySold" value="${product.quantitySold}"  required/></td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td><input type="number" name="status" value="${product.status}"  required/></td>
            </tr>
            <tr>
                <td>Sản phẩm yêu thích:</td>
                <td><input type="number" name="isFavorite" value="${product.isfavorite}"  required/></td>
            </tr>
            <tr>
                <td>Danh mục:</td>
                <td>
                	<select id="categoryDropdown">
				       <option value="">Chọn category</option>
				       <c:forEach items="${categories}" var="category">
				           <option value="${category.categoryId}">${category.categoryName}</option>
				       </c:forEach>
				   </select>
				</td>
				<td>
            		<input type="hidden" id="categoryId" name="categoryId" value="${product.categoryId}" />
            		<input type="hidden" id="categoryName" name="categoryName" value="${product.categoryName}" />
        		</td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="save" /></td>
            </tr>
        </table>
    </form>
    <a href="${pageContext.request.contextPath}/admin/product?action=list">Trở về danh sách</a>
</body>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	    $(document).ready(function() {
	        // AJAX để lấy danh sách categories khi trang tải
	        $.ajax({
	            url: '${pageContext.request.contextPath}/admin/category',
	            type: 'GET',
	            data: {
	                action: 'ajax' // Thêm tham số action để nhận biết yêu cầu từ AJAX
	            },
	            success: function(response) {
	                $('#categoryDropdown').empty();
	                $('#categoryDropdown').append('<option value="">Chọn category</option>');
	                $.each(response, function(index, category) { // Giả sử response là một mảng JSON của các category
	                    $('#categoryDropdown').append('<option value="' + category.categoryId + '" data-name="' + category.categoryName + '">' + category.categoryName + '</option>');
	                });
	
	                // Gán giá trị categoryId và categoryName từ product nếu có
	                var selectedCategoryId = '${product.categoryId}';
	                if (selectedCategoryId) {
	                    $('#categoryDropdown').val(selectedCategoryId);
	                    $('#categoryId').val(selectedCategoryId);
	
	                    var selectedCategoryName = $('#categoryDropdown option:selected').data('name');
	                    $('#categoryName').val(selectedCategoryName);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.log('Error:', error);
	            }
	        });
	
	        // Khi người dùng chọn một category
	        $('#categoryDropdown').change(function() {
	            var selectedCategoryId = $(this).val();
	            var selectedCategoryName = $('#categoryDropdown option:selected').data('name');
	            $('#categoryId').val(selectedCategoryId);
	            $('#categoryName').val(selectedCategoryName);
	        });
	    });
	    
	    function validateForm() {
	        var selectedCategoryId = $('#categoryDropdown').val();
	        if (!selectedCategoryId) {
	            alert('Vui lòng chọn một danh mục.');
	            $('#categoryDropdown').focus();
	            return false; // Ngăn không cho biểu mẫu được gửi
	        }
	        return true; // Cho phép gửi biểu mẫu nếu đã chọn danh mục
	    }
	</script>
</html>