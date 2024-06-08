package com.vanphongpham.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.vanphongpham.model.User;
import com.vanphongpham.util.DatabaseConnection;

public class UserRepository {

    private static final String INSERT_USER_SQL = "INSERT INTO tbl_user (user_name, password, email, status, type, created_at, update_at, create_by, update_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM tbl_user WHERE user_id = ?;";
    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "SELECT * FROM tbl_user WHERE user_name = ? AND password = ?;";
    private static final String SELECT_ALL_USERS = "SELECT * FROM tbl_user;";
    private static final String DELETE_USER_SQL = "DELETE FROM tbl_user WHERE user_id = ?;";
    private static final String UPDATE_USER_SQL = "UPDATE tbl_user SET user_name = ?, password = ?, email = ?, status = ?, type = ?, update_at = ?, update_by = ? WHERE user_id = ?;";

    public void insertUser(User user) throws SQLException {
        try (
    		Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setInt(4, user.getStatus());
            preparedStatement.setInt(5, user.getType());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setTimestamp(6, user.getCreatedAt());
            preparedStatement.setTimestamp(7, user.getUpdateAt());
            preparedStatement.setString(8, user.getCreateBy());
            preparedStatement.setString(9, user.getUpdateBy());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User getById(Integer id) {
        User user = null;
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String user_name = rs.getString("user_name");
                String password = rs.getString("password");
                Integer status = rs.getInt("status");
                Integer type = rs.getInt("type");
                String email = rs.getString("email");
                Timestamp created_at = rs.getTimestamp("created_at");
                Timestamp update_at = rs.getTimestamp("update_at");
                String createBy = rs.getString("create_by");
                String updateBy = rs.getString("update_by");
                user = new User(id, user_name, password, status, type, email, created_at, update_at, createBy, updateBy);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }
    
    public User getUserbyUsernameAndPassword(String userName, String password) {
        User user = null;
        try (
    		Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME_AND_PASSWORD)) {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
            	Integer id = rs.getInt("user_id");
                String user_name = rs.getString("user_name");
                String password1 = rs.getString("password");
                Integer status = rs.getInt("status");
                Integer type = rs.getInt("type");
                String email = rs.getString("email");
                Timestamp created_at = rs.getTimestamp("created_at");
                Timestamp update_at = rs.getTimestamp("update_at");
                String createBy = rs.getString("create_by");
                String updateBy = rs.getString("update_by");
                user = new User(id, user_name, password1, status, type, email, created_at, update_at, createBy, updateBy);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<User> selectAllUsers() {
        List<User> tbl_user = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer user_id = rs.getInt("user_id");
                String user_name = rs.getString("user_name");
                String password = rs.getString("password");
                Integer status = rs.getInt("status");
                Integer type = rs.getInt("type");
                String email = rs.getString("email");
                Timestamp created_at = rs.getTimestamp("created_at");
                Timestamp update_at = rs.getTimestamp("update_at");
                String create_by = rs.getString("create_by");
                String update_by = rs.getString("update_by");
                tbl_user.add(new User(user_id, user_name, password, status, type, email, created_at, update_at, create_by,
                        update_by));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tbl_user;
    }

    public boolean deleteUser(Integer user_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_USER_SQL)) {
            statement.setInt(1, user_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_USER_SQL)) {
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPassword());
            statement.setInt(4, user.getStatus());
            statement.setInt(5, user.getType());
            statement.setString(3, user.getEmail());
            statement.setTimestamp(6, user.getUpdateAt());
            statement.setString(7, user.getUpdateBy());
            statement.setInt(8, user.getUserId());
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
