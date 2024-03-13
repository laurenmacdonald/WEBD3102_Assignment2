<%--<jsp:useBean id="customer" scope="request" type="com.example.web3102_assignment2.model.Customer"/>--%>
<%--
  Created by IntelliJ IDEA.
  User: laure
  Date: 2024-03-10
  Time: 6:30 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" rel="stylesheet">
    <%--    <link href="styles.css" rel="stylesheet" type="text/css">--%>
    <%--    <style><%@include file="styles.css"%></style>--%>
</head>
<body>
<div class="container justify-content-center p-5 min-vh-100">
    <h1>Customer Profile</h1>
    <div class="row row-cols-1 row-cols-lg-4 g-2 g-lg-3">
            <div class="col">
                <div class="card">
                    <p>Email: ${customer.email}</p>
                    <p>First Name: ${customer.firstName}</p>
                    <p>Last Name: ${customer.lastName}</p>
                    <p>Phone Number: ${customer.phoneNumber}</p>

                </div>
            </div>
    </div>
</div>
</body>
</html>
