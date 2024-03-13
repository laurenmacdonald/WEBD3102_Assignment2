package com.example.web3102_assignment2.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/order_management_system";
        String uname = "root";
        String pass = "";
        return DriverManager.getConnection(url, uname, pass);
    }
}
