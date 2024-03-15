<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.web3102_assignment2.model.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: laure
  Date: 2024-03-13
  Time: 3:36 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        <%@include file="styles.css" %>
    </style>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>--%>
</head>
<body class="bg-body-tertiary">
<jsp:include page="/components/navbar.jsp"/>
<div class="container bg-body-tertiary justify-content-center p-5 min-vh-100">
    <div class="text-center">
        <h1>Cart</h1>
    </div>
    <c:choose>
        <c:when test="${empty sessionScope.fullOrderList}">
            <div class="container text-center">
                <p class="display-6">There is nothing in your cart.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="container text-left">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Product Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="orderItem" items="${sessionScope.fullOrderList}">
                        <tr>
                            <td><c:out value="${orderItem.prodName}" /></td>
                            <td><c:out value="${orderItem.prodQuantity}" /></td>
                            <td><c:out value="${orderItem.totalAmount}" /></td>
                        </tr>
                    </c:forEach>
                    <c:set var="totalAmount" value="0" />
                    <c:forEach var="orderItem" items="${sessionScope.fullOrderList}">
                        <c:set var="totalAmount" value="${totalAmount + orderItem.totalAmount}" />
                    </c:forEach>
                    <tr>
                        <td class="table-light" colspan="2">Total:</td>
                        <td class="table-light">$<c:out value="${totalAmount}" /></td>

                    </tr>
                    <tr>
                        <td colspan="3"><a class="add-to-cart-link btn btn-outline-secondary btn-sm"
                                                          href="<%=request.getContextPath()%>/startDelivery" role="button"><i
                                class="bi bi-cart-check-fill" aria-hidden="true"></i>&nbsp;&nbsp;Place delivery</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
