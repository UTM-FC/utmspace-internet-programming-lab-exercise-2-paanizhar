
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitTrackCampus Error</title>
</head>
<body>
    <h1>Error Page</h1>

    <c:if test="${empty username}">
        <p>No username was provided.</p>
    </c:if>

    <c:if test="${not empty username}">
        <p>
            Sorry, username
            <strong><c:out value="${username}" /></strong>
            is invalid or the password is incorrect.
        </p>
    </c:if>

    <p>
        <a href="${pageContext.request.contextPath}/loginPage.jsp">
            Back to Login
        </a>
    </p>
</body>
</html>
