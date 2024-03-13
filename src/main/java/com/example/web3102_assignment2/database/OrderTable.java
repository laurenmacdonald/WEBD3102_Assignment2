package com.example.web3102_assignment2.database;

import com.example.web3102_assignment2.dao.OrdersDAO;
import com.example.web3102_assignment2.model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class OrderTable implements OrdersDAO {
    private static final String SQL_SELECT = "SELECT o.orderId, o.customerId, od.prodId, od.prodId, p.prodName, od.prodQuantity " +
            "FROM orders o " +
            "JOIN orderdetails od ON o.orderId = od.orderId " +
            "JOIN products p ON od.prodId = p.prodId WHERE o.customerId = ?;";
    private static final String SQL_CREATE_ORDER = "INSERT INTO orders ('customerID') VALUES (?);";
    private static final String SQL_CREATE_ORDER_DETAILS = "INSERT INTO orderdetails('orderId', 'prodId', 'prodQuantity', 'totalAmount') VALUES (?,?,?,?);";
    private static final String SQL_SELECT_ALL = "SELECT * FROM orders WHERE customerId = ?;";
    private static final String SQL_DELETE = "DELETE FROM orders WHERE customerId = ?;";

    @Override
    public int create(Order order) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_CREATE_ORDER);
            preparedStatement.setInt(1, order.getCustomerId());
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
    public int createDetails(Order order) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_CREATE_ORDER_DETAILS);
            preparedStatement.setInt(1, order.getOrderId());
            preparedStatement.setInt(2, order.getProdId());
            preparedStatement.setInt(3, order.getProdQuantity());
            preparedStatement.setDouble(4, order.getTotalAmount());
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
    public List<Order> selectAllOrders(int customerId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        List<Order> listAllOrders = new ArrayList<>();
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                listAllOrders.add(new Order(rs.getInt("orderId"),
                        rs.getInt("customerId"),
                        rs.getInt("orderDetailsId"),
                        rs.getInt("prodId"),
                        rs.getString("prodName"),
                        rs.getInt("prodQuantity"),
                        rs.getDouble("totalAmount")));
            }
        } catch (Exception ex){
            System.out.println("Error:" + ex.getMessage());
        } finally {
            if(rs != null) {rs.close();}
            if(preparedStatement != null) {preparedStatement.close();}
            if(conn != null) {conn.close();}
        }
        return listAllOrders;
    }

    @Override
    public Order select(int order) throws SQLException {
        return null;
    }

    @Override
    public int delete(Order order) throws SQLException {
        return 0;
    }
}
