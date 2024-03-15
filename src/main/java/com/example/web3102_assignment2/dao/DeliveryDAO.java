package com.example.web3102_assignment2.dao;

import com.example.web3102_assignment2.model.Delivery;

import java.sql.SQLException;

public interface DeliveryDAO {

    int create(Delivery delivery) throws SQLException;
    Delivery select(int orderId) throws SQLException;
}
