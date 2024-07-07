package com.vanphongpham.repository.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.vanphongpham.model.Bill;
import com.vanphongpham.util.DatabaseConnection;

public class BillRepository {
	private static final String INSERT_BILL_ITEM_SQL = "INSERT INTO tbl_hoadon (product_ids, bill_price, user_id, created_at) VALUES (?, ?, ?, ?);";
	private static final String UPDATE_BILL_ITEM_SQL = "UPDATE tbl_hoadon SET quantity = ? WHERE bill_id = ?;";
    private static final String DELETE_BILL_ITEM_SQL = "DELETE FROM tbl_hoadon WHERE bill_id = ?;";
    
    
    public void addToBill(Bill bill) throws SQLException {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BILL_ITEM_SQL)) {
            preparedStatement.setString(1, bill.getProductIds());
            preparedStatement.setFloat(2, bill.getbillPrice());
            preparedStatement.setInt(3, bill.getUserId());
            preparedStatement.setTimestamp(4, bill.getCreatedAt());
            preparedStatement.executeUpdate();
        }
    }

    public boolean removeFromBill(int billId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_BILL_ITEM_SQL)) {
            statement.setInt(1, billId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public List<Bill> getAllBills() throws SQLException {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT * FROM tbl_hoadon";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int billId = resultSet.getInt("bill_id");
                String productIds = resultSet.getString("product_ids");
                float billPrice = resultSet.getFloat("bill_price");
                int userId = resultSet.getInt("user_id");
                Timestamp createdAt = resultSet.getTimestamp("created_at");

                Bill bill = new Bill(null, null, null, null);
                bill.setBillId(billId);
                bill.setProductIds(productIds);
                bill.setbillPrice(billPrice);
                bill.setUserId(userId);
                bill.setCreatedAt(createdAt);

                bills.add(bill);
            }
        }
        return bills;
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
