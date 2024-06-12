package com.vanphongpham.repository.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.vanphongpham.model.Category;
import com.vanphongpham.util.DatabaseConnection;

public class CategoryRepository {

	private static final String INSERT_CATEGORY_SQL = "INSERT INTO tbl_danhmuc (category_name, status, created_at, update_at, create_by, update_by) VALUES (?, ?, ?, ?, ?, ?);";
	private static final String SELECT_CATEGORY_BY_ID = "SELECT * FROM tbl_danhmuc WHERE category_id = ?;";
	private static final String SELECT_ALL_CATEGORIES = "SELECT * FROM tbl_danhmuc;";
	private static final String DELETE_CATEGORY_SQL = "DELETE FROM tbl_danhmuc WHERE category_id = ?;";
	private static final String UPDATE_CATEGORY_SQL = "UPDATE tbl_danhmuc SET category_name = ?, status = ?, update_at = ?, update_by = ? WHERE category_id = ?;";
	private static final String DELETE_PRODUCTS_SQL = "DELETE FROM tbl_sanpham WHERE category_id = ?";
	public void insertCategory(Category category) throws SQLException {
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_SQL)) {

			preparedStatement.setString(1, category.getCategoryName());
			preparedStatement.setInt(2, category.getStatus());
			preparedStatement.setTimestamp(3, category.getCreatedAt());
			preparedStatement.setTimestamp(4, category.getUpdateAt());
			preparedStatement.setString(5, category.getCreateBy());
			preparedStatement.setString(6, category.getUpdateBy());

			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Category getCategoryById(Integer id) {
		Category category = null;
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_ID)) {
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String categoryName = rs.getString("category_name");
				int status = rs.getInt("status");
				Timestamp createdAt = rs.getTimestamp("created_at");
				Timestamp updatedAt = rs.getTimestamp("update_at");
				String createBy = rs.getString("create_by");
				String updateBy = rs.getString("update_by");
				category = new Category(id, categoryName, status, createdAt, updatedAt, createBy, updateBy);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return category;
	}

	public List<Category> selectAllCategories() {
		List<Category> categories = new ArrayList<>();
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES)) {
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int categoryId = rs.getInt("category_id");
				String categoryName = rs.getString("category_name");
				int status = rs.getInt("status");
				Timestamp createdAt = rs.getTimestamp("created_at");
				Timestamp updatedAt = rs.getTimestamp("update_at");
				String createBy = rs.getString("create_by");
				String updateBy = rs.getString("update_by");
				categories.add(new Category(categoryId, categoryName, status, createdAt, updatedAt, createBy, updateBy));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return categories;
	}

	public boolean deleteCategory(Integer categoryId) throws SQLException {
	    boolean rowDeleted = false;
	    Connection connection = null;
	    PreparedStatement deleteProductsStatement = null;
	    PreparedStatement deleteCategoryStatement = null;

	    String DELETE_PRODUCTS_SQL = "DELETE FROM tbl_sanpham WHERE category_id = ?";
	    String DELETE_CATEGORY_SQL = "DELETE FROM tbl_danhmuc WHERE category_id = ?";

	    try {
	        connection = DatabaseConnection.getConnection();

	        // Bắt đầu transaction
	        connection.setAutoCommit(false);

	        // Chuẩn bị và thực hiện câu lệnh xóa các sản phẩm liên quan
	        deleteProductsStatement = connection.prepareStatement(DELETE_PRODUCTS_SQL);
	        deleteProductsStatement.setInt(1, categoryId);
	        deleteProductsStatement.executeUpdate();

	        // Chuẩn bị và thực hiện câu lệnh xóa danh mục
	        deleteCategoryStatement = connection.prepareStatement(DELETE_CATEGORY_SQL);
	        deleteCategoryStatement.setInt(1, categoryId);
	        rowDeleted = deleteCategoryStatement.executeUpdate() > 0;

	        // Commit transaction
	        connection.commit();
	    } catch (SQLException e) {
	        if (connection != null) {
	            try {
	                // Rollback transaction in case of error
	                connection.rollback();
	            } catch (SQLException ex) {
	                ex.printStackTrace();
	            }
	        }
	        e.printStackTrace();
	    } finally {
	        if (deleteProductsStatement != null) {
	            deleteProductsStatement.close();
	        }
	        if (deleteCategoryStatement != null) {
	            deleteCategoryStatement.close();
	        }
	        if (connection != null) {
	            connection.setAutoCommit(true);
	            connection.close();
	        }
	    }
	    return rowDeleted;
	}

	public boolean updateCategory(Category category) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_CATEGORY_SQL)) {
			statement.setString(1, category.getCategoryName());
			statement.setInt(2, category.getStatus());
			statement.setTimestamp(3, category.getUpdateAt());
			statement.setString(4, category.getUpdateBy());
			statement.setInt(5, category.getCategoryId());
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
