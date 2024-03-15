package com.example.web3102_assignment2.database;


import com.example.web3102_assignment2.dao.ProductDAO;
import com.example.web3102_assignment2.model.Customer;
import com.example.web3102_assignment2.model.Order;
import com.example.web3102_assignment2.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class ProductTable implements ProductDAO {
    private static final String SQL_SELECT_ONE = "SELECT * FROM products WHERE prodId = ?";
    private static final String SQL_SELECT_CAT = "SELECT p.prodId, p.prodName, p.prodDescription, p.categoryId, c.categoryName, p.price, p.quantityAvail, p.avgRating " +
            "FROM products p JOIN category c ON p.categoryId = c.categoryId WHERE p.categoryId = ?;";
    private static final String SQL_SELECT_NAME = "SELECT prodName FROM products WHERE prodId = ?;";
    private static final String SQL_SELECT_PROD_NAME = "SELECT p.prodId, p.prodName FROM orderDetails od JOIN products p ON od.prodId = p.prodId WHERE od.orderId=?;";

    @Override
    public Product select(int productId) throws SQLException  {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Product product = null;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT_ONE);
            preparedStatement.setInt(1, productId);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
               product = new Product(rs.getString("prodName"),
                        rs.getString("prodDescription"),
                        rs.getInt("categoryId"),
                        rs.getInt("price"),
                        rs.getInt("quantityAvail"),
                        rs.getInt("avgRating"));
            }
        } catch (Exception ex){
            System.out.println("Error:" + ex.getMessage());
        } finally {
            if(rs != null) {rs.close();}
            if(preparedStatement != null) {preparedStatement.close();}
            if(conn != null) {conn.close();}
        }
        return product;
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
    public String selectName(int productID) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        String productName = null;
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT_NAME);
            preparedStatement.setInt(1, productID);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                productName = rs.getString("prodName");
            }
        } catch (Exception ex){
            System.out.println("Error:" + ex.getMessage());
        } finally {
            if(rs != null) {rs.close();}
            if(preparedStatement != null) {preparedStatement.close();}
            if(conn != null) {conn.close();}
        }
        return productName;
    }
    @Override
    public List<Product> selectProdNameByOrderId(int orderId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();
        try{
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_SELECT_PROD_NAME);
            preparedStatement.setInt(1, orderId);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                productList.add(new Product(rs.getInt("prodId"),
                        rs.getString("prodName"))
                );
            }
        } catch (Exception ex){
            System.out.println("Error:" + ex.getMessage());
        } finally {
            if(rs != null) {rs.close();}
            if(preparedStatement != null) {preparedStatement.close();}
            if(conn != null) {conn.close();}
        }
        return productList;
    }
}
