# FitTrackCampus — SECJ3303 Lab Exercise 2

**Course:** SECJ 3303 – Internet Programming  
**Lab:** Lab Exercise 2 – JSTL and EL in MVC Web Application

## Overview

FitTrackCampus is a Java web application that demonstrates the Model–View–Controller (MVC) pattern. This lab improves the JSP view layer by using Jakarta Expression Language (EL) and Jakarta Standard Tag Library (JSTL) instead of Java scriptlets.

The application authenticates three demonstration users and displays a role-specific dashboard and menu.

## Technologies

- Java 25 (Maven compiler release 25)
- Maven
- Jakarta Servlet API 6.1.0
- Jakarta JSTL 3.0.2 API and GlassFish JSTL implementation 3.0.1
- JSP, Expression Language (EL) and JSTL
- Apache Tomcat 11

## Demonstration accounts

| Username | Password | Role |
|---|---|---|
| `admin` | `admin` | Admin |
| `coach1` | `coach1` | Coach |
| `member1` | `member1` | Member |

Any other username/password combination is treated as invalid.

> These credentials are for this lab demonstration only. The application does not use a database or production-grade password authentication.

## Project structure

```text
Lab Exercise 2/
├── pom.xml
├── README.md
├── .gitignore
└── src/
    └── main/
        ├── java/
        │   ├── controller/
        │   │   └── LoginController.java
        │   └── model/
        │       ├── User.java
        │       └── Auth.java
        └── webapp/
            ├── loginPage.jsp
            └── WEB-INF/
                └── views/
                    ├── dashboard.jsp
                    └── errorPage.jsp
```

## MVC responsibilities

- **Model — `User.java`:** stores the username and password submitted through the login form.
- **Authentication service — `Auth.java`:** checks the supplied credentials and returns the corresponding role (`admin`, `coach`, `member`) or `invalid`.
- **Controller — `LoginController.java`:** handles the `/login` request, calls the authentication service, stores data as request attributes, prepares role-specific menu items and forwards to the appropriate JSP.
- **Views — JSP files:** `loginPage.jsp` displays the login form; `dashboard.jsp` displays the authenticated user's role and menu; `errorPage.jsp` displays the invalid-login message.

## EL and JSTL implementation

The JSP views use EL and Jakarta JSTL:

- `${username}`, `${role}` and `${menus}` access request attributes.
- `<c:out>` displays values with HTML escaping.
- `<c:choose>`, `<c:when>` and `<c:otherwise>` select dashboard content according to the user's role.
- `<c:forEach>` iterates through the menu items supplied by the controller.
- `<c:if>` checks whether a username is empty or present on the error page.

The JSP view files do not contain Java scriptlets.

## Build the application

Open a terminal in the project directory (the directory containing `pom.xml`) and run:

```bash
mvn clean package
```

A successful build produces:

```text
target/FitTrackCampus.war
```

## Deploy to Apache Tomcat 11

1. Make sure Tomcat 11 is configured to use port `8585`.
2. Copy `target/FitTrackCampus.war` into Tomcat's `webapps` directory.
3. Start or restart Tomcat.
4. Open the application at:

```text
http://localhost:8585/FitTrackCampus/loginPage.jsp
```

## Test cases

| Test | Username | Password | Expected result |
|---|---|---|---|
| Admin login | `admin` | `admin` | Admin dashboard and admin menu |
| Coach login | `coach1` | `coach1` | Coach dashboard and coach menu |
| Member login | `member1` | `member1` | Member dashboard and member menu |
| Invalid login | `test` | `test` | Error page with invalid-login message |

## Reflection

### 1. Explain how EL is used to access username and role in dashboard.jsp.

Expression Language accesses request attributes set by the servlet controller. For example, `${username}` and `${role}` retrieve the username and role without writing Java code inside the JSP page.

### 2. Why is `<c:out>` better than printing user input directly in JSP?

`<c:out>` escapes XML/HTML-sensitive characters by default. This helps prevent user-supplied text from being interpreted as HTML or script content when displayed in the browser.

### 3. How does `<c:choose>` support role-based content display?

`<c:choose>` evaluates its `<c:when>` conditions and displays the matching section. In this application, it selects the Admin, Coach or Member dashboard based on the role supplied by the controller.

### 4. How does `<c:forEach>` help to display menu items dynamically?

`<c:forEach>` iterates over the `menus` collection supplied by the controller. Each menu item is displayed as a list element, so the JSP does not need separate hard-coded markup for every item.

### 5. Explain why the updated JSP pages are more consistent with the MVC pattern than scriptlet-based JSP pages.

The controller handles request processing and prepares the data, while the model represents user data and authentication logic. The JSP pages focus on displaying information using EL and JSTL rather than embedding Java processing code. This improves separation of concerns and maintainability.

## Submission checklist

- [ ] Source code (`src/`) and `pom.xml` included.
- [ ] Login page screenshot captured.
- [ ] Admin dashboard screenshot captured.
- [ ] Coach dashboard screenshot captured.
- [ ] Member dashboard screenshot captured.
- [ ] Invalid-login error page screenshot captured.
- [ ] Maven build completed successfully.
- [ ] `target/` excluded from source control.
- [ ] Lab Exercise 2 pushed to its own GitHub repository.
