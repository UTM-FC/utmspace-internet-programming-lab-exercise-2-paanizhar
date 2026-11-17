
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitTrackCampus Login</title>
</head>
<body>

    <h1>FitTrackCampus Login</h1>

    <form method="post" action="${pageContext.request.contextPath}/login">

        <label>Username:</label>
        <input type="text" name="username" required />

        <br><br>

        <label>Password:</label>
        <input type="password" name="password" required />

        <br><br>

        <button type="submit">Login</button>

    </form>

</body>
</html>
