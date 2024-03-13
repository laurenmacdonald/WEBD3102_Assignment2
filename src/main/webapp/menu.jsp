<%--
  Created by IntelliJ IDEA.
  User: laure
  Date: 2024-03-10
  Time: 7:35 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="rating" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        <%@include file="styles.css" %>
    </style>
</head>
<body class="bg-body-tertiary">
<jsp:include page="/components/navbar.jsp"/>
<jsp:useBean id="allProducts" scope="request" type="java.util.List"/>
<jsp:useBean id="originalPizza" scope="request" type="java.util.List"/>
<jsp:useBean id="featurePizza" scope="request" type="java.util.List"/>
<jsp:useBean id="specialtyPizza" scope="request" type="java.util.List"/>
<jsp:useBean id="hero" scope="request" type="java.util.List"/>
<jsp:useBean id="drink" scope="request" type="java.util.List"/>
<jsp:useBean id="dessert" scope="request" type="java.util.List"/>
<jsp:useBean id="salad" scope="request" type="java.util.List"/>
<div class="container bg-body-tertiary justify-content-center p-5 min-vh-100">
    <div class="text-center">
        <h1 class="display-1">Menu</h1>
    </div>
    <c:forEach var="list" items="${allProducts}" varStatus="status">
        <div class="text-center py-4">
            <c:choose>
                <c:when test="${status.current == originalPizza}">
                    <h3>Original Pizzas</h3>
                </c:when>
                <c:when test="${status.current == featurePizza}">
                    <h3>Feature Pizzas</h3>
                </c:when>
                <c:when test="${status.current == specialtyPizza}">
                    <h3>Specialty Pizzas</h3>
                </c:when>
                <c:when test="${status.current == hero}">
                    <h3>Heroes</h3>
                </c:when>
                <c:when test="${status.current == salad}">
                    <h3>Salads</h3>
                </c:when>
                <c:when test="${status.current == dessert}">
                    <h3>Desserts</h3>
                </c:when>
                <c:when test="${status.current == drink}">
                    <h3>Drinks</h3>
                </c:when>
            </c:choose>
        </div>
        <div class="row row-cols-1 row-cols-lg-4 g-2 g-lg-4">
            <c:forEach var="item" items="${list}">
                <div class="col">
                    <div class="card h-100 bg-body-tertiary ">
                        <div class="card-body">
                            <h5>${item.prodName}</h5>
                            <div class="row">
                                <div class="col-9">
                                    <p>${item.prodDescription}</p>
                                </div>
                                <div class="col-3">
                                    <p>$${item.price}</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-body-tertiary border-light">
                            <div class="row text-center">
                                <p>Rating: <rating:ratingIconTag value="${item.avgRating}"/></p>
                            </div>
                            <div class="row px-5">
                                <a class="add-to-cart-link btn btn-outline-secondary btn-sm"
                                   href="add?productId=<c:out value='${item.prodId}' />" role="button"><i
                                        class="bi bi-plus-circle" aria-hidden="true"></i>&nbsp;&nbsp;Add To Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
