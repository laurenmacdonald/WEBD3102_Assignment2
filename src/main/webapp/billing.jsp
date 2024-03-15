<%--
  Created by IntelliJ IDEA.
  User: laure
  Date: 2024-03-12
  Time: 8:07 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        <%@include file="styles.css" %>
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-body-tertiary">
<jsp:include page="/components/navbar.jsp"/>
<div class="container col-md-5 min-vh-100">
    <div class="card m-4">
        <div class="card-body">
            <h1>Add Your Billing Information</h1>
            <c:choose>
                <c:when test="${sessionScope.addressAdded != null && sessionScope.addressAdded}">
                    <form action="sign-up/add-billing" method="post">
                        <div class="mb-3">
                            <label for="cardNumber" class="form-label">Card Number</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber"
                                   value="<c:out value='${cardNumber}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="expiryDate" class="form-label">Expiry Date</label>
                            <input type="text" class="form-control" id="expiryDate" name="expiryDate"
                                   value="<c:out value='${expiryDate}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="securityCode" class="form-label">Security Code</label>
                            <input type="text" class="form-control" id="securityCode" name="securityCode"
                                   value="<c:out value='${securityCode}'/>" required>
                        </div>
                        <button type="submit" class="btn btn-secondary">Submit</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <div class="container text-center">
                        <p class="lead">Error. <br> Please go back to the first step - add your address or create account.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
