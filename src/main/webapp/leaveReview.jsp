<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        <%@include file="styles.css" %>
    </style>
</head>
<body class="bg-body-tertiary">
<jsp:include page="/components/navbar.jsp"/>
<div class="container col-md-5 min-vh-100">

    <div class="card m-4">
        <div class="card-body">
            <h1>Leave Review</h1>
            <form action="leaveReview/submit" method="post">
                <c:forEach var="orderItem" items="${sessionScope.orderedProducts}" varStatus="status">
                    <div class="mb-3">
                        <h4><c:out value="${orderItem.prodName}"/></h4>
                        <!-- Include a hidden input to reference the product ID -->
                        <input type="hidden" name="productId[]" value="<c:out value='${orderItem.prodId}'/>"/>
                    </div>
                    <div class="mb-3">
                        <label for="rating${status.index}" class="form-label">Rating</label>
                        <select class="form-select" aria-label="Rating" id="rating${status.index}" name="rating[]">
                            <option value="">Choose from the following options</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                            <option value="4">Four</option>
                            <option value="5">Five</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="reviewText${status.index}" class="form-label">Review Text</label>
                        <textarea class="form-control" rows="2" id="reviewText${status.index}" name="reviewText[]"></textarea>
                    </div>
                </c:forEach>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

        </div>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>