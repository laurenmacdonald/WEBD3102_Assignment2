<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Custom tag to display rating in bootstrap star icons" pageEncoding="UTF-8" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>

<c:choose>
    <c:when test="${value eq 5}">
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i>
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i>
        <i class="bi bi-star-fill" aria-hidden="true"></i><span
            class="visually-hidden">5 stars</span>
    </c:when>
    <c:when test="${value eq 4}">
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i>
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i>
        <i class="bi bi-star" aria-hidden="true"></i><span
            class="visually-hidden">4 stars</span>
    </c:when>
    <c:when test="${value eq 3}">
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i>
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star" aria-hidden="true"></i>
        <i class="bi bi-star" aria-hidden="true"></i><span
            class="visually-hidden">3 stars</span>
    </c:when>
    <c:when test="${value eq 2}">
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i>
        <i class="bi bi-star" aria-hidden="true"></i><i class="bi bi-star" aria-hidden="true"></i>
        <i class="bi bi-star" aria-hidden="true"></i><span
            class="visually-hidden">2 stars</span>
    </c:when>
    <c:when test="${value eq 1}">
        <i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star" aria-hidden="true"></i>
        <i class="bi bi-star" aria-hidden="true"></i><i class="bi bi-star" aria-hidden="true"></i>
        <i class="bi bi-star" aria-hidden="true"></i><span
            class="visually-hidden">1 star</span>
    </c:when>
    <c:otherwise>
        <span>None</span>
    </c:otherwise>
</c:choose>