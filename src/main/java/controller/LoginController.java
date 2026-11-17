
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import model.Auth;
import model.User;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/loginPage.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get login details from the form
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 2. Create User object and authenticate
        User user = new User(username, password);
        Auth auth = new Auth();

        String role = auth.roleFor(user);

        // 3. Store username and role as request attributes
        request.setAttribute("username", username);
        request.setAttribute("role", role);

        // 4. Check whether login is valid
        if (role.equals("invalid")) {

            request.getRequestDispatcher("/WEB-INF/views/errorPage.jsp")
                   .forward(request, response);

            return;
        }

        // 5. Create menu list for the user's role
        List<String> menus = new ArrayList<>();

        if (role.equals("admin")) {

            menus.add("Manage campus fitness users");
            menus.add("View fitness activity reports");
            menus.add("Update FitTrackCampus settings");

        } else if (role.equals("coach")) {

            menus.add("View assigned member list");
            menus.add("Record training progress");
            menus.add("Provide fitness feedback");

        } else if (role.equals("member")) {

            menus.add("View personal fitness profile");
            menus.add("Check training schedule");
            menus.add("Read coach feedback");
        }

        // 6. Store menu list as a request attribute
        request.setAttribute("menus", menus);

        // 7. Forward to the shared dashboard
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
               .forward(request, response);
    }
}
