package com.example.web3102_assignment2.dao;

import com.example.web3102_assignment2.model.Order;


import java.sql.SQLException;
import java.util.List;

public interface OrdersDAO {
    int create(Order order) throws SQLException;
    int createDetails(Order order) throws SQLException;
    List<Order> selectAllOrders(int orderId) throws SQLException;
    Order select(int order) throws SQLException;
    int selectOrderId(int customerId) throws SQLException;
    int updateTotalAmount(int orderId) throws SQLException;
}
