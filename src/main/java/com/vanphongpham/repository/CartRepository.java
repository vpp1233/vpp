package com.vanphongpham.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.vanphongpham.model.Cart;
import com.vanphongpham.util.DatabaseConnection;

public class CartRepository {
	private static final String INSERT_CART_ITEM_SQL = "INSERT INTO tbl_giohang (product_id, user_id, quantity) VALUES (?, ?, ?);";
	private static final String UPDATE_CART_ITEM_SQL = "UPDATE tbl_giohang SET quantity = ? WHERE cart_id = ?;";
	private static final String SELECT_CART_ITEMS_BY_USER_SQL = "SELECT * FROM tbl_giohang WHERE user_id = ?;";
    private static final String DELETE_CART_ITEM_SQL = "DELETE FROM tbl_giohang WHERE cart_id = ?;";

    public void addToCart(int productId, int userId, int quantity) throws SQLException {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART_ITEM_SQL)) {
            preparedStatement.setInt(1, productId);
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, quantity);
            preparedStatement.executeUpdate();
        }
    }

    public List<Cart> getCartsByUser(int userId) {
        List<Cart> cartItems = new ArrayList<>();
        String SELECT_CART_ITEMS_BY_USER_SQL = 
            "SELECT c.cart_id, c.product_id, c.quantity, " +
                   "p.product_name, p.price, p.description, p.sale_price, p.category_name, p.image " +
		            "FROM tbl_giohang c " +
		            "INNER JOIN tbl_sanpham p ON c.product_id = p.product_id " +
		            "WHERE c.user_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_ITEMS_BY_USER_SQL)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int cartId = rs.getInt("cart_id");
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                String productName = rs.getString("product_name");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                float salePrice = rs.getFloat("sale_price");
                String categoryName = rs.getString("category_name");
                String image = rs.getString("image");
                
                Cart cartItem = new Cart(cartId, productId, userId, quantity, null, null, null, null);
                cartItem.setProductName(productName);
                cartItem.setPrice(price);
                cartItem.setDescription(description);
                cartItem.setSalePrice(salePrice);
                cartItem.setCategoryName(categoryName);
                cartItem.setImage(image);
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cartItems;
    }

    public boolean removeFromCart(int cartId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CART_ITEM_SQL)) {
            statement.setInt(1, cartId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public boolean updateCartItemQuantity(int cartItemId, int quantity) throws SQLException {
        boolean rowUpdated = false;
        try (
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_ITEM_SQL)
        ) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, cartItemId);

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public void clearCartByUser(int userId) throws SQLException {
        // Thực hiện xóa tất cả sản phẩm trong giỏ hàng của người dùng
        String sql = "DELETE FROM tbl_giohang WHERE user_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        }
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
