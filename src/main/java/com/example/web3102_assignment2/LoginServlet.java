package com.example.web3102_assignment2;

import com.example.web3102_assignment2.database.*;
import com.example.web3102_assignment2.model.*;
import com.example.web3102_assignment2.util.ProductIdCounter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.*;

@WebServlet(name="LoginServlet")
public class LoginServlet extends HttpServlet {
    private CustomerTable customerTable;

    public void init() {
        customerTable = new CustomerTable();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String action = request.getServletPath();
        RequestDispatcher dispatcher;
        if (action.startsWith("/login?error")) {
            String errorMessage = request.getParameter("error");
        }
        try {
            switch (action) {
                case "/logout":
                    logout(request, response);
                    break;
                case "/login":
                    dispatcher = request.getRequestDispatcher("/login.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        }catch(ServletException | IOException ex){
                throw new ServletException(ex);
            }

    }

        protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
            String action = request.getServletPath();
            switch (action) {
                case "/login/auth":
                    login(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        }

        public void login (HttpServletRequest request, HttpServletResponse response) throws IOException {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Customer customer;
            Random random = new Random();

            try {
                customer = customerTable.select(email, password);
                if (customer != null) {
                    String sessionId = customer.getEmail() + Integer.toString(random.nextInt(1000));
                    int customerId = customer.getCustomerId();
                    HttpSession session = request.getSession();
                    session.setAttribute("customerSessionId", sessionId);
                    session.setAttribute("customerId", customerId);
                    response.sendRedirect(request.getContextPath() + "/home");
                } else {
                    String errorMessage = "Invalid. Please try again.";
                    response.sendRedirect(request.getContextPath() + "/login?error=" + URLEncoder.encode(errorMessage, StandardCharsets.UTF_8));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public void logout (HttpServletRequest request, HttpServletResponse response) throws IOException {
            HttpSession session = request.getSession();
            session.removeAttribute("customerSessionId");
            String successMessage = "Successfully logged out.";
            response.sendRedirect(request.getContextPath() + "/Servlet/home?logoutSuccess=" + URLEncoder.encode(successMessage, StandardCharsets.UTF_8));
        }

    }

