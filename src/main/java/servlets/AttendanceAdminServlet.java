package servlets;

import DAO.AttendanceDao;
import DAO.WorkerDao;
import models.Worker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Zavod/admin/attendance")
public class AttendanceAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AttendanceDao attendanceDao = new AttendanceDao();
        WorkerDao workerDao = new WorkerDao();
        Long idWorker = Long.parseLong(req.getParameter("attendance"));

        req.setAttribute("attendances", attendanceDao.findByIdWorker(idWorker));
        req.getRequestDispatcher("attendance.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AttendanceDao attendanceDao = new AttendanceDao();
        attendanceDao.delete(Long.parseLong(req.getParameter("id")));
        Long idWorker = Long.parseLong(req.getParameter("idworker"));
        req.setAttribute("attendances", attendanceDao.findByIdWorker(idWorker));
        req.getRequestDispatcher("attendance.jsp").forward(req, resp);
    }
}
