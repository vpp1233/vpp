package com.vanphongpham.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Thay đổi thông tin kết nối tương ứng với cơ sở dữ liệu của bạn
    private static final String URL = "jdbc:mysql://localhost:81/phpmyadmin/";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
