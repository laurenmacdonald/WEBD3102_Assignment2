<%--
  Created by IntelliJ IDEA.
  User: laure
  Date: 2024-03-11
  Time: 2:22 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pizzaiolo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        <%@include file="styles.css" %>
    </style>
</head>
<body>
<jsp:include page="/components/navbar.jsp"/>
<section class="section-bg">
    <% String logoutSuccess = request.getParameter("logoutSuccess"); %>
    <% if (logoutSuccess != null && !logoutSuccess.isEmpty()) {%>
    <div class="toast container position-fixed bottom-0 end-0 p-3 z-3 mb-5 show">
        <div class="toast-body d-flex justify-content-between align-items-center">
            <i class="bi bi-check-circle-fill" aria-hidden="true"></i>&nbsp;
            <strong class="me-auto">&nbsp;<%=logoutSuccess%></strong>
            <button type="button" class="btn-close align-self-end" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
    <% } %>
    <div class="mask" style="background-color: #00000099;">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="text-white text-center">
                <h4 class="home-details">2500 Main Street</h4>
                <h4 class="home-details"> — </h4>
                <h4 class="home-details">Halifax NS</h4>
                <h4 class="home-details"> — </h4>
                <h4 class="home-details">902-555-9999</h4>
                <h2 class="mb-3"><a class="home-link" href="${pageContext.request.contextPath}/menu#pizzas">Famous
                    Pizza</a></h2>
                <h2 class="mb-3"><a class="home-link" href="${pageContext.request.contextPath}/menu#heros">Heros &
                    Salads</a></h2>
                <h2 class="mb-3"><a class="home-link" href=${pageContext.request.contextPath}/menu#desserts">Desserts &
                    Drinks</a></h2>
                <figure class="text-center">
                    <blockquote class="blockquote">
                        <p>Always my go-to pizza! Cannot get enough of it.</p>
                    </blockquote>
                    <figcaption class="blockquote-footer">
                        Happy Customer
                    </figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
