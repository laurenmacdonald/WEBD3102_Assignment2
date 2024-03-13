package com.example.web3102_assignment2;

import com.example.web3102_assignment2.database.AddressTable;
import com.example.web3102_assignment2.database.BillingTable;
import com.example.web3102_assignment2.database.CustomerTable;
import com.example.web3102_assignment2.database.ProductTable;
import com.example.web3102_assignment2.model.Address;
import com.example.web3102_assignment2.model.Billing;
import com.example.web3102_assignment2.model.Customer;
import com.example.web3102_assignment2.model.Product;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(urlPatterns = "/", loadOnStartup = 1)
public class Servlet extends HttpServlet {
    private CustomerTable customerTable;
    private ProductTable productTable;
    private AddressTable addressTable;
    private BillingTable billingTable;
    public void init(){customerTable = new CustomerTable(); productTable = new ProductTable();
        addressTable = new AddressTable();
    billingTable = new BillingTable();}

    // doGet - fetching data from server. Simple and everyone can see the request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String action = request.getServletPath();
        RequestDispatcher dispatcher;
        if(action.startsWith("/login?error")){
            String errorMessage = request.getParameter("error");
        }
        try{
            switch(action){
                case "/customer":
                    customerProfile(request,response);
                    break;
                case "/menu":
                    productsByCategory(request, response);
                    break;
                case "/home":
                    dispatcher = request.getRequestDispatcher("/home.jsp");
                    dispatcher.forward(request,response);
                    break;
                case "/logout":
                    logout(request, response);
                    break;
                case "/login":
                    dispatcher = request.getRequestDispatcher("/login.jsp");
                    dispatcher.forward(request,response);
                    break;
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
                    dispatcher.forward(request,response);
                    break;
            }
        } catch(SQLException | IOException ex){
            throw new ServletException(ex);
        }
    }
    // doPost - sending data to server that will change something. More private, can carry more data.
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/login/auth":
                login(request, response);
                break;
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
    private void customerProfile(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        Customer customer = customerTable.select(1);
//        request.setAttribute("customer", customer);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer.jsp");
//        dispatcher.forward(request, response);
    }

    private void productsByCategory(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> originalPizza = productTable.selectAllProductsByCategory(1);
        List<Product> hero = productTable.selectAllProductsByCategory(2);
        List<Product> salad = productTable.selectAllProductsByCategory(3);
        List<Product> drink = productTable.selectAllProductsByCategory(4);
        List<Product> dessert = productTable.selectAllProductsByCategory(5);
        List<Product> featurePizza = productTable.selectAllProductsByCategory(6);
        List<Product> specialtyPizza = productTable.selectAllProductsByCategory(7);
        List<List<Product>> allProducts = new ArrayList<>();
        allProducts.add(originalPizza);
        allProducts.add(featurePizza);
        allProducts.add(specialtyPizza);
        allProducts.add(hero);
        allProducts.add(salad);
        allProducts.add(dessert);
        allProducts.add(drink);

        request.setAttribute("originalPizza", originalPizza);
        request.setAttribute("hero", hero);
        request.setAttribute("drink", drink);
        request.setAttribute("salad", salad);
        request.setAttribute("dessert", dessert);
        request.setAttribute("featurePizza", featurePizza);
        request.setAttribute("specialtyPizza", specialtyPizza);
        request.setAttribute("allProducts", allProducts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/menu.jsp");
        dispatcher.forward(request,response);
    }

    public void createNewAccount(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        Customer newCustomer = new Customer(email, password, firstName, lastName, phoneNumber);
        Address nullAddress = new Address();
        customerTable.create(newCustomer);
        addressTable.create(nullAddress);
        int addressId = addressTable.selectAddressId();
        // Put the customer email in session id to be used with address and billing.
        String customerEmail = newCustomer.getEmail();
        HttpSession session = request.getSession();
        session.setAttribute("customerEmail", customerEmail);
        session.setAttribute("addressId", addressId);

        response.sendRedirect(request.getContextPath() + "/address");

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
        if(billingTable.create(newBilling) == 1){
            session.removeAttribute("addressId");
            session.removeAttribute("customerEmail");
            response.sendRedirect(request.getContextPath() + "/login");
        };


    }
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Customer customer = null;
        Random random = new Random();

        try {
            customer = customerTable.select(email, password);
            if (customer != null) {
                String sessionId = customer.getEmail() + Integer.toString(random.nextInt(1000));
                HttpSession session = request.getSession();
                session.setAttribute("customerSessionId", sessionId);
                response.sendRedirect(request.getContextPath() + "/home");
            } else {
                String errorMessage = "Invalid. Please try again.";
                response.sendRedirect(request.getContextPath() + "/login?error=" + URLEncoder.encode(errorMessage, StandardCharsets.UTF_8));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.removeAttribute("customerSessionId");
        String successMessage = "Successfully logged out.";
        response.sendRedirect(request.getContextPath() + "/home?logoutSuccess=" + URLEncoder.encode(successMessage, StandardCharsets.UTF_8));
    }
//    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
//        int prodId = Integer.parseInt(request.getParameter("prodId"));
//        Cart cart = new Cart(prodId, 1);
//
//    }
//    private void addToOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
//
//        String taskName = request.getParameter("taskName");
//        Date dueDate = Date.valueOf(request.getParameter("dueDate"));
//        String category = request.getParameter("category");
//        boolean completeStatus = Boolean.parseBoolean(request.getParameter("completeStatus"));
//
//        Task newTask = new Task(taskName, dueDate, category, completeStatus);
//        taskDatabase.insert(newTask);
//        response.sendRedirect("list");
//    }
}
