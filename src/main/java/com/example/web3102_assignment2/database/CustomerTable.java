package com.example.web3102_assignment2.database;

import com.example.web3102_assignment2.dao.CustomersDAO;
import com.example.web3102_assignment2.model.Customer;

import java.sql.*;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class CustomerTable implements CustomersDAO {
    private static final String SQL_SELECT_JOIN_ADDRESS = "SELECT c.customerId, c.firstName, c.lastName, c.email, c.phoneNumber, a.addressLine1, a.addressLine2, a.city, a.province, a.country, a.postalCode FROM customers AS c JOIN address AS a ON c.addressId = a.addressId WHERE email = ? && password = ?;";
    private static final String SQL_SELECT_CUSTOMER = "SELECT * FROM customers WHERE email = ? && password = ?;";
    private static final String SQL_INSERT = "INSERT INTO customers (email, password, firstName, lastName, phoneNumber) VALUES (?,?, ?, ?, ?);";
    private static final String SQL_UPDATE = "UPDATE customers SET addressId = ? WHERE email = ?";
    @Override
    public int create(Customer customer) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_INSERT);
            preparedStatement.setString(1, customer.getEmail());
            preparedStatement.setString(2, customer.getPassword());
            preparedStatement.setString(3, customer.getFirstName());
            preparedStatement.setString(4, customer.getLastName());
            preparedStatement.setString(5, customer.getPhoneNumber());

            // rs will return 0 if unsuccessful, 1 if successful
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
    public Customer select(String email, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Customer customer = null;
        try {
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT_JOIN_ADDRESS);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                customer = new Customer(
                        rs.getInt("customerId"),
                        rs.getString("email"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("addressLine1"),
                        rs.getString("addressLine2"),
                        rs.getString("city"),
                        rs.getString("province"),
                        rs.getString("country"),
                        rs.getString("postalCode"),
                        rs.getString("phoneNumber")
                );
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            if (rs != null) { rs.close(); }
            if (preparedStatement != null) { preparedStatement.close(); }
            if (conn != null) { conn.close(); }
        }
        return customer;
    }

    @Override
    public int update(Customer customer) throws SQLException {
        return 0;
    }
    @Override
    public int updateAddressId(String email, int addressId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_UPDATE);
            preparedStatement.setInt(1, addressId);
            preparedStatement.setString(2, email);

            // rs will return 0 if unsuccessful, 1 if successful
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
    public int delete(Customer customer) throws SQLException {
        return 0;
    }

}
