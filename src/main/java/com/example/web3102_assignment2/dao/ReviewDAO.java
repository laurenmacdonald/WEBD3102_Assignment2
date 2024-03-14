package com.example.web3102_assignment2.dao;

import com.example.web3102_assignment2.model.Review;

import java.sql.SQLException;

public interface ReviewDAO {
    int create(Review review) throws SQLException;
}
