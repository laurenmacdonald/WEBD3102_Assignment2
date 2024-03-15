<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: laure
  Date: 2024-03-11
  Time: 2:08 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style><%@include file="../styles.css"%></style>
</head>
<body>
<%--<% String sessionId = session.getAttribute("customerSessionId").toString(); %>--%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid ps-5">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/home">Pizzaiolo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/menu">Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/cart">Cart</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-fill" aria-hidden="true"></i><span
                            class="visually-hidden">Profile</span>  Account
                    </a>
                    <ul class="dropdown-menu">
                        <c:choose>
                            <c:when test="${sessionScope.customerSessionId != null}">
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>LoginServlet/logout">Log Out</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/sign-up">Create Account</a></li>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/login">Login</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
