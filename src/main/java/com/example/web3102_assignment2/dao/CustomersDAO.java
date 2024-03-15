package com.example.web3102_assignment2.dao;

import com.example.web3102_assignment2.model.Customer;

import java.sql.SQLException;

public interface CustomersDAO {
    // CRUD operations for Customers
    int create(Customer customer) throws SQLException;
    Customer select(String email, String password) throws SQLException;
    int updateAddressId(String email, int addressId) throws SQLException;
}
