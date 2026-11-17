
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitTrackCampus Dashboard</title>
</head>

<body>

    <h1>FitTrackCampus Dashboard</h1>

    <p>You are successfully logged in.</p>

    <p>
        Welcome,
        <c:out value="${username}" />
    </p>

    <p>
        Your role is:
        <c:out value="${role}" />
    </p>

    <hr>

    <!-- Display content based on user role -->

    <c:choose>

        <c:when test="${role == 'admin'}">

            <h2>Admin Dashboard</h2>

            <p>
                You can manage users and monitor fitness activity reports.
            </p>

        </c:when>

        <c:when test="${role == 'coach'}">

            <h2>Coach Dashboard</h2>

            <p>
                You can monitor members and provide training feedback.
            </p>

        </c:when>

        <c:when test="${role == 'member'}">

            <h2>Member Dashboard</h2>

            <p>
                You can view your fitness profile and training schedule.
            </p>

        </c:when>

        <c:otherwise>

            <p>No valid role was found.</p>

        </c:otherwise>

    </c:choose>

    <hr>

    <!-- Display menu items dynamically -->

    <h2>Menu</h2>

    <ul>

        <c:forEach var="menu" items="${menus}">

            <li>
                <c:out value="${menu}" />
            </li>

        </c:forEach>

    </ul>

    <p>
        <a href="${pageContext.request.contextPath}/loginPage.jsp">
            Back to Login
        </a>
    </p>

</body>
</html>
