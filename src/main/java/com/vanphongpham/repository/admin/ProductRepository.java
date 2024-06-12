package com.vanphongpham.repository.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.vanphongpham.model.Product;
import com.vanphongpham.util.DatabaseConnection;

public class ProductRepository {

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO tbl_sanpham (product_name, image, price, description, sale_price, quantity_sold, status, isfavorite, category_id, category_name, created_at, update_at, create_by, update_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM tbl_sanpham WHERE product_id = ?;";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM tbl_sanpham;";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM tbl_sanpham WHERE product_id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE tbl_sanpham SET product_name = ?, image = ?, price = ?, description = ?, sale_price = ?, quantity_sold = ?, status = ?, isfavorite = ?, category_id = ?, category_name = ?, update_at = ?, update_by = ? WHERE product_id = ?;";

    public void insertProduct(Product product) throws SQLException {
        try (
        	Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
        	
	            preparedStatement.setString(1, product.getProductName());
	            preparedStatement.setString(2, product.getImage());
	            preparedStatement.setFloat(3, product.getPrice());
	            preparedStatement.setString(4, product.getDescription());
	            preparedStatement.setFloat(5, product.getSalePrice());
	            preparedStatement.setInt(6, product.getQuantitySold());
	            preparedStatement.setInt(7, product.getStatus());
	            preparedStatement.setInt(8, product.getIsfavorite());
	            preparedStatement.setInt(9, product.getCategoryId());
	            preparedStatement.setString(10, product.getCategoryName());
	            preparedStatement.setTimestamp(11, product.getCreatedAt());
	            preparedStatement.setTimestamp(12, product.getUpdateAt());
	            preparedStatement.setString(13, product.getCreateBy());
	            preparedStatement.setString(14, product.getUpdateBy());
	            
	            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Product getProductById(Integer id) {
        Product product = null;
        try (
        	Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String productName = rs.getString("product_name");
                String image = rs.getString("image");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                float salePrice = rs.getFloat("sale_price");
                int quantitySold = rs.getInt("quantity_sold");
                int status = rs.getInt("status");
                int isfavorite = rs.getInt("isfavorite");
                int categoryId = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");
                Timestamp createdAt = rs.getTimestamp("created_at");
                Timestamp updatedAt = rs.getTimestamp("update_at");
                String createBy = rs.getString("create_by");
                String updateBy = rs.getString("update_by");
                product = new Product(id, productName, image, price, description, salePrice, quantitySold, status, isfavorite, categoryId, categoryName, createdAt, updatedAt, createBy, updateBy);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (
        	Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String image = rs.getString("image");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                float salePrice = rs.getFloat("sale_price");
                int quantitySold = rs.getInt("quantity_sold");
                int status = rs.getInt("status");
                int isfavorite = rs.getInt("isfavorite");
                int categoryId = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");
                Timestamp createdAt = rs.getTimestamp("created_at");
                Timestamp updatedAt = rs.getTimestamp("update_at");
                String createBy = rs.getString("create_by");
                String updateBy = rs.getString("update_by");
                products.add(new Product(productId, productName, image, price, description, salePrice, quantitySold, status, isfavorite, categoryId, categoryName, createdAt, updatedAt, createBy, updateBy));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public boolean deleteProduct(Integer productId) throws SQLException {
        boolean rowDeleted;
        try (
        	Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            statement.setInt(1, productId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (
        	Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getImage());
            statement.setFloat(3, product.getPrice());
            statement.setString(4, product.getDescription());
            statement.setFloat(5, product.getSalePrice());
            statement.setInt(6, product.getQuantitySold());
            statement.setInt(7, product.getStatus());
            statement.setInt(8, product.getIsfavorite());
            statement.setInt(9, product.getCategoryId());
            statement.setString(10, product.getCategoryName());
            statement.setTimestamp(11, product.getUpdateAt());
            statement.setString(12, product.getUpdateBy());
            statement.setInt(13, product.getProductId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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