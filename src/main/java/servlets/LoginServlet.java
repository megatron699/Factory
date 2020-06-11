package servlets;

import DAO.UserDao;
import DAO.WorkerDao;
import models.User;
import models.Worker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Zavod/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userDao.login(username, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("username", user.getUsername());
            session.setAttribute("userrole", user.isUserRole());
            if (user.isUserRole()) {
                resp.sendRedirect("/Zavod/admin/index");
            } else {
                resp.sendRedirect("/Zavod/user/worker");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        User user;
        if (userDao.findAll().size() == 0) {
            WorkerDao workerDao = new WorkerDao();
            Worker worker = new Worker();
            worker.setPost("Администратор БД");
            workerDao.save(worker);
            user = new User();
            user.setUsername("admin");
            user.setPassword("admin");
            user.setWorker(worker);
            user.setUserRole(true);
            userDao.save(user);
        }
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}
