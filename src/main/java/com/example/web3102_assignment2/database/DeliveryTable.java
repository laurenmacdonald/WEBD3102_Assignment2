package com.example.web3102_assignment2.database;

import com.example.web3102_assignment2.dao.DeliveryDAO;
import com.example.web3102_assignment2.model.Delivery;

import java.sql.*;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class DeliveryTable implements DeliveryDAO {
    public static final String SQL_SELECT_JOIN_AGENT = "SELECT d.orderId, d.deliveryStatus, d.deliveryDate, da.firstName, da.lastName, da.phoneNumber FROM delivery d JOIN deliveryagent da ON d.deliveryAgentId = da.deliveryAgentId WHERE d.orderId = ?;";
    public static final String SQL_INSERT = "INSERT INTO delivery(orderId, deliveryAgentId, deliveryStatus, deliveryDate) VALUES (?, ?, 'Delivered', NOW())";

    @Override
    public int create(Delivery delivery) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try {
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_INSERT);
            preparedStatement.setInt(1, delivery.getOrderId());
            preparedStatement.setInt(2, delivery.getDeliveryAgentId());

            // rs will return 0 if unsuccessful, 1 if successful
            rs = preparedStatement.executeUpdate();
        } catch (SQLSyntaxErrorException ex) {
            System.err.println("Error:" + ex.getMessage());
        } catch (Exception genericException) {
            System.err.println("Exception:" + genericException.getMessage());
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return rs;
    }

    @Override
    public Delivery select(int orderId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Delivery delivery = null;
        try {
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT_JOIN_AGENT);
            preparedStatement.setInt(1, orderId);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {

                delivery = new Delivery(
                        rs.getInt("orderId"),
                        rs.getString("deliveryStatus"),
                        rs.getDate("deliveryDate"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("phoneNumber")
                );
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return delivery;
    }
}
