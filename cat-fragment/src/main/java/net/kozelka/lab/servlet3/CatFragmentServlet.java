package net.kozelka.lab.servlet3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author Petr Kozelka
 */
@WebServlet("/cat/hello")
public class CatFragmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final PrintWriter pw = resp.getWriter();
        pw.println("Hello it's me, the " + CatFragmentServlet.class + "!");
        pw.println("req.getRequestURL() returns " + req.getRequestURL());
        pw.flush();
    }
}
