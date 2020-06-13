package servlets;

import DAO.UserDao;
import DAO.WorkerDao;
import models.User;
import org.hibernate.jdbc.Work;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Zavod/admin/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("register", req.getParameter("register"));
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            UserDao userDao = new UserDao();
            WorkerDao workerDao = new WorkerDao();
            User user = new User();
            User usernameInDb = userDao.getByUsername(req.getParameter("username"));
            String password = req.getParameter("password");
            if (usernameInDb == null) {
                user.setUsername(req.getParameter("username"));
                if (password.equals(req.getParameter("passconfirm"))) {
                    user.setPassword(password);
                } else {
                    req.setAttribute("status", "password");
                    req.getRequestDispatcher("register.jsp").forward(req, resp);
                }
                String[] userRole = req.getParameterValues("userrole");
                if (userRole != null && userRole.length > 0) {
                    user.setUserRole(true);
                } else {
                    user.setUserRole(false);
                }
                user.setWorker(workerDao.get(Long.parseLong(req.getParameter("register"))));
                userDao.save(user);
                resp.sendRedirect(req.getContextPath() + "/Zavod/admin/worker");
            } else {
                req.setAttribute("status", "username");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
    }
}
