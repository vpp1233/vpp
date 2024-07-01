package com.vanphongpham.repository;

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
	public List<Product> getLatestProductsByCategory(Integer categoryId, Integer limit) throws SQLException {
	    List<Product> products = new ArrayList<>();
	    String sql = "SELECT * FROM tbl_sanpham WHERE category_id = ? ORDER BY created_at DESC LIMIT ?";
	    try (Connection connection = DatabaseConnection.getConnection();
	        PreparedStatement statement = connection.prepareStatement(sql)){
	    	
	    	statement.setInt(1, categoryId);
	    	statement.setInt(2, limit);
	    	ResultSet resultSet = statement.executeQuery();
		        while (resultSet.next()) {
		            Product product = new Product(null, null, null, null);
		            product.setProductId(resultSet.getInt("product_id"));
		            product.setProductName(resultSet.getString("product_name"));
		            product.setImage(resultSet.getString("image"));
		            product.setPrice(resultSet.getFloat("price"));
		            product.setDescription(resultSet.getString("description"));
		            product.setCategoryId(resultSet.getInt("category_id"));
		            product.setCreatedAt(resultSet.getTimestamp("created_at"));
		            product.setCreateBy(resultSet.getString("create_by"));
		            product.setUpdateAt(resultSet.getTimestamp("update_at"));
		            product.setUpdateBy(resultSet.getString("update_by"));
		            products.add(product);
		        }
	    }catch (SQLException e) {
			printSQLException(e);
		}
	    return products;
	}
	
	public List<Product> getFavoriteProduct(Integer categoryId, Integer limit) throws SQLException {
	    List<Product> products = new ArrayList<>();
	    String sql = "SELECT * FROM tbl_sanpham WHERE category_id = ? AND isfavorite = 1 ORDER BY created_at DESC LIMIT ?";
	    try (Connection connection = DatabaseConnection.getConnection();
	        PreparedStatement statement = connection.prepareStatement(sql)){
	        
	        statement.setInt(1, categoryId);
	        statement.setInt(2, limit);
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            Product product = new Product(null, null, null, null);
	            product.setProductId(resultSet.getInt("product_id"));
	            product.setProductName(resultSet.getString("product_name"));
	            product.setImage(resultSet.getString("image"));
	            product.setPrice(resultSet.getFloat("price"));
	            product.setDescription(resultSet.getString("description"));
	            product.setCategoryId(resultSet.getInt("category_id"));
	            product.setCreatedAt(resultSet.getTimestamp("created_at"));
	            product.setCreateBy(resultSet.getString("create_by"));
	            product.setUpdateAt(resultSet.getTimestamp("update_at"));
	            product.setUpdateBy(resultSet.getString("update_by"));
	            products.add(product);
	        }
	    } catch (SQLException e) {
	        printSQLException(e);
	    }
	    return products;
	}
	
	public List<Product> getAllProductsByCategory(Integer categoryId) throws SQLException {
	    List<Product> products = new ArrayList<>();
	    String sql = "SELECT * FROM tbl_sanpham WHERE category_id = ? ORDER BY created_at DESC";
	    try (Connection connection = DatabaseConnection.getConnection();
	        PreparedStatement statement = connection.prepareStatement(sql)){
	    	
	    	statement.setInt(1, categoryId);
	    	ResultSet resultSet = statement.executeQuery();
		        while (resultSet.next()) {
		            Product product = new Product(null, null, null, null);
		            product.setProductId(resultSet.getInt("product_id"));
		            product.setProductName(resultSet.getString("product_name"));
		            product.setImage(resultSet.getString("image"));
		            product.setPrice(resultSet.getFloat("price"));
		            product.setDescription(resultSet.getString("description"));
		            product.setCategoryId(resultSet.getInt("category_id"));
		            product.setCreatedAt(resultSet.getTimestamp("created_at"));
		            product.setCreateBy(resultSet.getString("create_by"));
		            product.setUpdateAt(resultSet.getTimestamp("update_at"));
		            product.setUpdateBy(resultSet.getString("update_by"));
		            products.add(product);
		        }
	    }catch (SQLException e) {
			printSQLException(e);
		}
	    return products;
	}
	
	public Timestamp getLatestUpdatedAt() {
		Timestamp latestTimestamp = null;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT MAX(update_at) AS latest_update FROM tbl_sanpham";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
            	latestTimestamp = resultSet.getTimestamp("latest_update");
            }
            if (latestTimestamp == null) {
                latestTimestamp = Timestamp.valueOf("1970-01-01 00:00:00");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return latestTimestamp;
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
