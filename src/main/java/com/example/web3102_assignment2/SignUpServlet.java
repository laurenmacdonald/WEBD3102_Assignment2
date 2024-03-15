package com.example.web3102_assignment2;

import com.example.web3102_assignment2.database.*;
import com.example.web3102_assignment2.model.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.*;

@WebServlet(name="SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private CustomerTable customerTable;
    private AddressTable addressTable;
    private BillingTable billingTable;

    public void init() {
        customerTable = new CustomerTable();
        addressTable = new AddressTable();
        billingTable = new BillingTable();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String action = request.getServletPath();
        RequestDispatcher dispatcher;
        try {
            switch (action) {
                case "/sign-up":
                    dispatcher = request.getRequestDispatcher("/sign-up.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "/address":
                    dispatcher = request.getRequestDispatcher("/address.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "/billing":
                    dispatcher = request.getRequestDispatcher("/billing.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        } catch (IOException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/sign-up/create-account":
                try {
                    createNewAccount(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/sign-up/add-address":
                try {
                    addAddress(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/sign-up/add-billing":
                try {
                    addBilling(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    public void createNewAccount(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        Customer newCustomer = new Customer(email, password, firstName, lastName, phoneNumber);
        Address nullAddress = new Address();

        if(customerTable.create(newCustomer) == 1 && addressTable.create(nullAddress) == 1){
            int addressId = addressTable.selectAddressId();
            // Put the customer email in session id to be used with address and billing.
            String customerEmail = newCustomer.getEmail();
            boolean accountCreated = true;
            HttpSession session = request.getSession();
            session.setAttribute("customerEmail", customerEmail);
            session.setAttribute("addressId", addressId);
            session.setAttribute("accountCreated", accountCreated);

            response.sendRedirect(request.getContextPath() + "/address");
        }
    }

    public void addAddress(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();

        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String city = request.getParameter("city");
        String province = request.getParameter("province");
        String country = request.getParameter("country");
        String postalCode = request.getParameter("postalCode");
        Address newAddress = new Address(addressLine1, addressLine2, city, province, country, postalCode);
        addressTable.update(newAddress);

        // Get the customer email and addressID stored in session to update the customer table with the addressId
        String customerEmail = (String) session.getAttribute("customerEmail");
        int addressId = (Integer) session.getAttribute("addressId");
        customerTable.updateAddressId(customerEmail, addressId);
        boolean addressAdded = true;
        session.setAttribute("addressAdded", addressAdded);
        response.sendRedirect(request.getContextPath() + "/billing");
    }

    public void addBilling(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        int addressId = (Integer) session.getAttribute("addressId");

        Long cardNumber = Long.valueOf(request.getParameter("cardNumber"));
        String expiryDate = request.getParameter("expiryDate");
        int securityCode = Integer.parseInt(request.getParameter("securityCode"));
        Billing newBilling = new Billing(cardNumber, expiryDate, securityCode, addressId);

        // If the sign-up process is complete and successful, remove the session ids used in sign-up and redirect to login page.
        if (billingTable.create(newBilling) == 1) {
            session.removeAttribute("addressId");
            session.removeAttribute("customerEmail");
            session.removeAttribute("addressAdded");
            session.removeAttribute("accountCreated");
            String successMessage = "Sign up successful! Login to continue.";
            response.sendRedirect(request.getContextPath() + "/LoginServlet/login?signupSuccess=" + URLEncoder.encode(successMessage, StandardCharsets.UTF_8));
            //response.sendRedirect(request.getContextPath() + "/login");
        }
    }

}
