package servlets;

import DAO.AttendanceDao;
import DAO.WorkerDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Zavod/user/attendance")
public class AttendanceUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AttendanceDao attendanceDao = new AttendanceDao();
        Long idWorker = Long.parseLong(req.getParameter("attendance"));
        req.setAttribute("attendances", attendanceDao.findByIdWorker(idWorker));
        req.getRequestDispatcher("attendance.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        session.invalidate();
        resp.sendRedirect("/Zavod/login");
    }
}
