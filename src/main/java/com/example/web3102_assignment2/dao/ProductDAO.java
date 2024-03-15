package com.example.web3102_assignment2.dao;

import com.example.web3102_assignment2.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDAO {
    // Select operations for products
    List<Product> selectAllProductsByCategory(int categoryId) throws SQLException;
    Product select(int productId) throws SQLException;
    String selectName(int productID) throws SQLException;
    List<Product> selectProdNameByOrderId(int orderId) throws SQLException;

}
