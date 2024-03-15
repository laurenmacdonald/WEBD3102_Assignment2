package com.example.web3102_assignment2.dao;

import com.example.web3102_assignment2.model.Address;
import com.example.web3102_assignment2.model.Billing;

import java.sql.SQLException;

public interface BillingDAO {
    int create(Billing billing) throws SQLException;
}
