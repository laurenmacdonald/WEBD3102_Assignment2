package com.example.web3102_assignment2.database;


import com.example.web3102_assignment2.dao.ProductDAO;
import com.example.web3102_assignment2.model.Customer;
import com.example.web3102_assignment2.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class ProductTable implements ProductDAO {
    private static final String SQL_SELECT = "SELECT p.prodId, p.prodName, p.prodDescription, p.categoryId, c.categoryName, p.price, p.quantityAvail, p.avgRating FROM products p JOIN category c ON p.categoryId = c.categoryId;";
    private static final String SQL_SELECT_CAT = "SELECT p.prodId, p.prodName, p.prodDescription, p.categoryId, c.categoryName, p.price, p.quantityAvail, p.avgRating FROM products p JOIN category c ON p.categoryId = c.categoryId WHERE p.categoryId = ?;";

    @Override
    public List<Product> selectAllProducts() throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        List<Product> listAllProducts = new ArrayList<>();
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                listAllProducts.add(new Product(rs.getString("prodName"),
                        rs.getString("prodDescription"),
                        rs.getInt("price"),
                        rs.getInt("quantityAvail"),
                        rs.getInt("avgRating"),
                        rs.getString("categoryName")));
            }
        } catch (Exception ex){
            System.out.println("Error:" + ex.getMessage());
        } finally {
            if(rs != null) {rs.close();}
            if(preparedStatement != null) {preparedStatement.close();}
            if(conn != null) {conn.close();}
        }
        return listAllProducts;
    }

    @Override
    public List<Product> selectAllProductsByCategory(int categoryId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        List<Product> listByCategory = new ArrayList<>();
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT_CAT);
            preparedStatement.setInt(1, categoryId);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                listByCategory.add(new Product(
                        rs.getInt("prodId"),
                        rs.getString("prodName"),
                        rs.getString("prodDescription"),
                        rs.getInt("categoryId"),
                        rs.getDouble("price"),
                        rs.getInt("quantityAvail"),
                        rs.getInt("avgRating"),
                        rs.getString("categoryName")));
            }
        } catch (Exception ex){
            System.out.println("Error:" + ex.getMessage());
        } finally {
            if(rs != null) {rs.close();}
            if(preparedStatement != null) {preparedStatement.close();}
            if(conn != null) {conn.close();}
        }
        return listByCategory;
    }

    @Override
    public Product select(int productId) throws SQLException {
        return null;
    }
}
