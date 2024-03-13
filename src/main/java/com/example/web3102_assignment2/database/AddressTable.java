package com.example.web3102_assignment2.database;

import com.example.web3102_assignment2.dao.AddressDAO;
import com.example.web3102_assignment2.model.Address;
import com.example.web3102_assignment2.model.Customer;

import java.sql.*;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class AddressTable implements AddressDAO {
    private static final String SQL_INSERT = "INSERT INTO address (addressLine1, addressLine2, city,province,country, postalCode) VALUES(?,?,?,?,?,?);";
    private static final String SQL_UPDATE = "UPDATE address SET addressLine1 = ?, addressLine2 = ?, city=?,province=?,country=?, postalCode=? WHERE addressLine1 IS NULL;";
    private static final String SQL_SELECT_ID = "SELECT addressId FROM address WHERE addressLine1 IS NULL;";

    @Override
    public int create(Address address) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_INSERT);
            preparedStatement.setString(1, address.getAddressLine1());
            preparedStatement.setString(2, address.getAddressLine2());
            preparedStatement.setString(3, address.getCity());
            preparedStatement.setString(4, address.getProvince());
            preparedStatement.setString(5, address.getCountry());
            preparedStatement.setString(6, address.getPostalCode());

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

    @Override
    public Address select(String addressLine1, String addressLine2, String city, String province, String country, String postalCode) throws SQLException {
        return null;
    }

    @Override
    public int selectAddressId() throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        int addressId = 0;
        try {
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT_ID);
            rs = preparedStatement.executeQuery();
            while(rs.next()) {
                addressId = rs.getInt("addressId");
            }

        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            if (rs != null) { rs.close(); }
            if (preparedStatement != null) { preparedStatement.close(); }
            if (conn != null) { conn.close(); }
        }
        return addressId;
    }

    @Override
    public int update(Address address) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_UPDATE);
            preparedStatement.setString(1, address.getAddressLine1());
            preparedStatement.setString(2, address.getAddressLine2());
            preparedStatement.setString(3, address.getCity());
            preparedStatement.setString(4, address.getProvince());
            preparedStatement.setString(5, address.getCountry());
            preparedStatement.setString(6, address.getPostalCode());

            rs = preparedStatement.executeUpdate();
        } catch (SQLSyntaxErrorException ex){
            System.err.println("Error:" + ex.getMessage());
        } catch (Exception genericException){
            System.err.println("Exception:" + genericException.getMessage());
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return rs;
    }

    @Override
    public int delete(Address address) throws SQLException {
        return 0;
    }
}
