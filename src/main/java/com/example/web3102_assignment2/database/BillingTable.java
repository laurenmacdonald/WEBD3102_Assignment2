package com.example.web3102_assignment2.database;

import com.example.web3102_assignment2.dao.BillingDAO;
import com.example.web3102_assignment2.model.Billing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class BillingTable implements BillingDAO {
    private static final String SQL_INSERT = "INSERT INTO billing (cardNumber, expiryDate, securityCode, addressId) VALUES (?,?,?,?);";
    @Override
    public int create(Billing billing) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_INSERT);
            preparedStatement.setLong(1, billing.getCardNumber());
            preparedStatement.setString(2, billing.getExpiryDate());
            preparedStatement.setInt(3, billing.getSecurityCode());
            preparedStatement.setInt(4, billing.getAddressId());

            rs=preparedStatement.executeUpdate();
        } catch (SQLSyntaxErrorException ex){
            System.err.println("Error: " + ex.getMessage());
        }
        finally {
            preparedStatement.close();
            conn.close();
        }
        return rs;
    }

}
