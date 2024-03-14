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

@WebServlet(urlPatterns = "/", loadOnStartup = 1)
public class Servlet extends HttpServlet {
    private CustomerTable customerTable;
    private ProductTable productTable;
    private AddressTable addressTable;
    private BillingTable billingTable;
    private OrderTable orderTable;
    private DeliveryTable deliveryTable;
    private ReviewTable reviewTable;

    public void init() {
        customerTable = new CustomerTable();
        productTable = new ProductTable();
        addressTable = new AddressTable();
        billingTable = new BillingTable();
        orderTable = new OrderTable();
        deliveryTable = new DeliveryTable();
        reviewTable = new ReviewTable();
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
                case "/menu":
                    productsByCategory(request, response);
                    break;
                case "/home":
                    dispatcher = request.getRequestDispatcher("/home.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "/logout":
                    logout(request, response);
                    break;
                case "/login":
                    dispatcher = request.getRequestDispatcher("/login.jsp");
                    dispatcher.forward(request, response);
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
                    dispatcher.forward(request, response);
                    break;
                case "/add":
                    addToCart(request, response);
                    break;
                case "/cart":
                    displayCart(request, response);
                    break;
                case "/startDelivery":
                    createDelivery(request, response);
                    break;
                case "/deliveries":
                    getDeliveries(request, response);
                    break;
                case "/leaveReview":
                    getOrderedProducts(request);
                    dispatcher = request.getRequestDispatcher("/leaveReview.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        } catch (SQLException | IOException ex) {
            throw new ServletException(ex);
        }
    }

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
            case "/leaveReview/submit":
                try {
                    submitReview(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
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
        dispatcher.forward(request, response);
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
        if (billingTable.create(newBilling) == 1) {
            session.removeAttribute("addressId");
            session.removeAttribute("customerEmail");
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("customerSessionId");
        String successMessage = "Successfully logged out.";
        response.sendRedirect(request.getContextPath() + "/home?logoutSuccess=" + URLEncoder.encode(successMessage, StandardCharsets.UTF_8));
    }

    public void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = productTable.selectName(productId);

        // Retrieve the list from the session
        List<Integer> productIdList = (List<Integer>) session.getAttribute("productIdList");

        // If the list doesn't exist, create a new one
        if (productIdList == null) {
            productIdList = new ArrayList<>();
        }

        // Add the new product ID to the list
        productIdList.add(productId);

        // Store the updated list back into the session
        session.setAttribute("productIdList", productIdList);

        // success message to be displayed in toast on menu screen
        String successMessage = productName + " added to cart.";
        response.sendRedirect(request.getContextPath() + "/menu?productAdded=" + URLEncoder.encode(successMessage, StandardCharsets.UTF_8));
    }

    public void getQuantity(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Integer> productIdList = (List<Integer>) session.getAttribute("productIdList");
        // first int is prodId, second int is count of that id
        Map<Integer, Integer> countOfProductIds;
        if (productIdList != null) {
            countOfProductIds = ProductIdCounter.countProductIds(productIdList);
            session.setAttribute("countOfProductIds", countOfProductIds);
        }
    }

    public void getListOfProducts(HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession();
        List<Integer> productIdList = (List<Integer>) session.getAttribute("productIdList");
        if (productIdList != null) {
            List<Product> productList = new ArrayList<>();

            for (Integer productId : productIdList) {
                Product newProduct = productTable.select(productId);
                productList.add(newProduct);
            }
            session.setAttribute("productList", productList);
        }

    }

    public void updateCart(HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession();
        getQuantity(request);
        getListOfProducts(request);

        int customerId = (int) session.getAttribute("customerId");
        Map<Integer, Integer> countOfProductIds = (Map<Integer, Integer>) session.getAttribute("countOfProductIds");
        Order customerIdOrderInfo = new Order(customerId);
        orderTable.create(customerIdOrderInfo);
        int orderId = orderTable.selectOrderId(customerId);
        for (Map.Entry<Integer, Integer> prodId : countOfProductIds.entrySet()) {
            Order newOrder = new Order(orderId, prodId.getKey(), prodId.getValue(), 0.00);
            orderTable.createDetails(newOrder);
            orderTable.updateTotalAmount(orderId);
        }

        session.setAttribute("orderId", orderId);
    }

    public void displayCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        HttpSession session = request.getSession();
        updateCart(request);
        List<Order> fullOrderList;
        int orderId = ((Integer) session.getAttribute("orderId"));
        fullOrderList = orderTable.selectAllOrders(orderId);

        session.setAttribute("fullOrderList", fullOrderList);
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }

    public void createDelivery(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        int orderId = ((Integer) session.getAttribute("orderId"));
        Random random = new Random();
        int deliveryAgentId = random.nextInt(2) + 1;

        Delivery delivery = new Delivery(orderId, deliveryAgentId);
        deliveryTable.create(delivery);

        getDeliveries(request, response);

    }

    public void getDeliveries(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        Delivery delivery;
        int orderId = ((Integer) session.getAttribute("orderId"));
        delivery = deliveryTable.select(orderId);

        session.setAttribute("delivery", delivery);
        response.sendRedirect(request.getContextPath() + "/deliveries.jsp");
    }

    public void getOrderedProducts(HttpServletRequest request) throws IOException, SQLException {
        HttpSession session = request.getSession();
        int orderId = Integer.parseInt(request.getParameter("orderNumber"));
        List<Product> orderedProducts = productTable.selectProdNameByOrderId(orderId);

        // Store the updated list back into the session
        session.setAttribute("orderedProducts", orderedProducts);
    }

    public void submitReview(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        List<Product> orderedProducts = (List<Product>) session.getAttribute("orderedProducts");

        String[] ratings = request.getParameterValues("rating[]");
        String[] reviewTexts = request.getParameterValues("reviewText[]");
        Integer orderId = (Integer) session.getAttribute("orderId");
        Integer customerId = (Integer) session.getAttribute("customerId");

        for (int i = 0; i < orderedProducts.size(); i++) {
            int rating = Integer.parseInt(ratings[i]);
            String reviewText = reviewTexts[i];

            Review review = new Review(orderId, customerId, rating, reviewText);
            reviewTable.create(review);
        }
        response.sendRedirect(request.getContextPath() + "/home");
    }
}
