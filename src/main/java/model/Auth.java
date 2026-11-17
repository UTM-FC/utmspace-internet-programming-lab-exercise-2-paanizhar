
package model;

/**
 * Auth class checks the user's login credentials
 * and determines the user's role.
 */
public class Auth {

    public String roleFor(User user) {

        if (user == null ||
            user.getUsername() == null ||
            user.getPassword() == null) {
            return "invalid";
        }

        String username = user.getUsername();
        String password = user.getPassword();

        if ("admin".equals(username) && "admin".equals(password)) {
            return "admin";

        } else if ("coach1".equals(username) && "coach1".equals(password)) {
            return "coach";

        } else if ("member1".equals(username) && "member1".equals(password)) {
            return "member";
        }

        return "invalid";
    }
}
