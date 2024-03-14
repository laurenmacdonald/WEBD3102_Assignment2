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
<%@ taglib prefix="deliveryStatus" tagdir="/WEB-INF/tags" %>

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
</head>
<body class="bg-body-tertiary">
<jsp:include page="/components/navbar.jsp"/>
<div class="container bg-body-tertiary justify-content-center p-5 min-vh-100">
    <div class="text-center">
        <h1>Your Deliveries</h1>
    </div>
    <div class="container text-left">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Order Number</th>
                <th scope="col">Delivery Agent</th>
                <th scope="col">Agent Phone #</th>
                <th scope="col">Delivery Status</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><p><c:out value="${sessionScope.delivery.orderId}"/></p></td>
                <td><p><c:out value="${sessionScope.delivery.firstName}"/></p></td>
                <td><p><c:out value="${sessionScope.delivery.phoneNumber}"/></p></td>
                <td><deliveryStatus:deliveryStatusTag value="${sessionScope.delivery.deliveryStatus}"/>
                    <a class="add-to-cart-link btn btn-outline-secondary btn-sm"
                       href="<%=request.getContextPath()%>/leaveReview?orderNumber=<c:out value='${sessionScope.delivery.orderId}' />"
                       role="button"><i
                            class="bi bi-pencil-square" aria-hidden="true"></i>&nbsp;&nbsp;Leave A Review</a></td>
            </tr>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
