package org.youcode.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;
import java.util.Random;

@WebServlet(name = "dashboardServlet", urlPatterns = {"/game" })
public class GameServlet extends HttpServlet {
    private int NumberToguess;
    private int NumberOfTries;

    @Override
    public void init() throws ServletException {
        Random random = new Random();
        NumberToguess = random.nextInt(100) + 1;
        NumberOfTries = 0;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        request.getRequestDispatcher("view/game.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String guessStr = request.getParameter("guess");
        int guess = Integer.parseInt(guessStr);
        NumberOfTries++;
        String message;

        if (guess < NumberToguess) {
            message = "Too low";
        } else if (guess > NumberToguess) {
            message = "Too high";
        } else {
            message = "Congratulations you got the correct answer after " + NumberOfTries + " tries";
            init();
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("view/game.jsp").forward(request, response);
    }
}
