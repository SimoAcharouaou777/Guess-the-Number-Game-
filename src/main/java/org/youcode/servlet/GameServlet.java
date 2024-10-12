package org.youcode.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.youcode.model.User;
import org.youcode.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "dashboardServlet", urlPatterns = {"/addUser" ,"/dashboard"})
public class dashboardServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException{
        userService = new UserService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userService.getAllUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("view/game.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        String action = request.getServletPath();
        if("/addUser".equals(action)){
            addTask(request,response);
        }
    }

    public void addTask(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        User user = new User();
        user.setEmail(email);
        user.setUsername(username);
        userService.addUser(username, email);
        response.sendRedirect(request.getContextPath() +"/dashboard");

    }
}
