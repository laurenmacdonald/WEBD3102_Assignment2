package com.example.web3102_assignment2.dao;

import com.example.web3102_assignment2.model.Address;
import com.example.web3102_assignment2.model.Customer;

import java.sql.SQLException;

public interface AddressDAO {
    int create(Address address) throws SQLException;
    int selectAddressId() throws SQLException;
    int update(Address address) throws SQLException;
}
