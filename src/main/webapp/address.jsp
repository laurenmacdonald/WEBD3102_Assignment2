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
            <h1>Add Your Address</h1>
            <c:choose>
                <c:when test="${sessionScope.accountCreated != null && sessionScope.accountCreated == true}">
            <form action="sign-up/add-address" method="post">
                <div class="mb-3">
                    <label for="addressLine1" class="form-label">Address Line 1</label>
                    <input type="text" class="form-control" id="addressLine1" name="addressLine1" value="<c:out value='${addressLine1}'/>"  required>
                </div>
                <div class="mb-3">
                    <label for="addressLine2" class="form-label">Address Line 2</label>
                    <input type="text" class="form-control" id="addressLine2" name="addressLine2" value="<c:out value='${addressLine2}'/>">
                </div>
                <div class="mb-3">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" name="city"
                           value="<c:out value='${city}'/>" required>
                </div>
                <div class="mb-3">
                    <label for="province" class="form-label">Province</label>
                    <input type="text" class="form-control" id="province" name="province"
                           value="<c:out value='${province}'/>" required>
                </div>
                <div class="mb-3">
                    <label for="country" class="form-label">Country</label>
                    <input type="text" class="form-control" id="country" name="country"
                           value="<c:out value='${country}'/>" required>
                </div>
                <div class="mb-3">
                    <label for="postalCode" class="form-label">Postal Code</label>
                    <input type="text" class="form-control" id="postalCode" name="postalCode"
                           value="<c:out value='${postalCode}'/>" required>
                </div>
                <button type="submit" class="btn btn-secondary">Submit</button>
            </form>
            </c:when>
            <c:otherwise>
                <div class="container text-center">
                    <p class="lead">Error. <br> Please go back to the first step - create account.</p>
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
