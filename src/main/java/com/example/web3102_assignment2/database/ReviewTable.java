package com.example.web3102_assignment2.database;

import com.example.web3102_assignment2.dao.ReviewDAO;
import com.example.web3102_assignment2.model.Review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;

import static com.example.web3102_assignment2.database.MySQLConnection.getConnection;

public class ReviewTable implements ReviewDAO {

    public static final String SQL_INSERT = "INSERT INTO reviews(productId, userId, rating, reviewText, reviewDate) VALUES (?, ?, ?, ?, NOW());";
    @Override
    public int create(Review review) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        int rs = 0;
        try {
            conn = getConnection();
            preparedStatement = conn.prepareStatement(SQL_INSERT);
            preparedStatement.setInt(1, review.getProductId());
            preparedStatement.setInt(2, review.getUserId());
            preparedStatement.setInt(3, review.getRating());
            preparedStatement.setString(4, review.getReviewText());

            // rs will return 0 if unsuccessful, 1 if successful
            rs = preparedStatement.executeUpdate();
        } catch (SQLSyntaxErrorException ex) {
            System.err.println("Error:" + ex.getMessage());
        } catch (Exception genericException) {
            System.err.println("Exception:" + genericException.getMessage());
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return rs;
    }
}
