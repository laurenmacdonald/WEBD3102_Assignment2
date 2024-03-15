<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Custom tag to display delivery status" pageEncoding="UTF-8" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>

<c:choose>
    <c:when test="${value eq 'pending'}">
        <p><i class="bi bi-arrow-clockwise" aria-hidden="true"></i>&nbsp;
        Pending</p>
    </c:when>
    <c:when test="${value eq 'in transit'}">
        <p><i class="bi bi-truck" aria-hidden="true"></i>&nbsp;
        In Transit</p>
    </c:when>
    <c:when test="${value eq 'delivered'}">
        <p><i class="bi bi-check-circle" aria-hidden="true"></i>&nbsp;
        Delivered</p>
        <a class="add-to-cart-link btn btn-outline-secondary btn-sm"
           href="<%=request.getContextPath()%>/leaveReview?orderNumber=<c:out value='${sessionScope.delivery.orderId}' />"
           role="button"><i
                class="bi bi-pencil-square" aria-hidden="true"></i>&nbsp;&nbsp;Leave A Review</a>
    </c:when>
</c:choose>