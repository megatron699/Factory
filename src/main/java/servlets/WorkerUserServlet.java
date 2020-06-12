package servlets;

import DAO.AttendanceDao;
import DAO.PlaceOfWorkDao;
import DAO.WorkerDao;
import models.Attendance;
import models.Worker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet("/Zavod/user/worker")
public class WorkerUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);
        req.setAttribute("worker", session.getAttribute("worker"));
        req.getRequestDispatcher("worker.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AttendanceDao attendanceDao = new AttendanceDao();
        WorkerDao workerDao = new WorkerDao();
        HttpSession session = req.getSession(false);
        Worker worker = workerDao.get(Long.parseLong(req.getParameter("id")));
        Attendance attendance;
        if(!worker.isPresence()) {
            worker.setPresence(true);
            workerDao.update(worker);
            session.setAttribute("worker", worker);
            attendance = new Attendance();
            attendance.setWorker(worker);
            attendance.setDateInWork(new Date());
            attendanceDao.save(attendance);
        } else {
            attendance = attendanceDao.getByIdAndDate(worker, new Date());
            worker.setPresence(false);
            workerDao.update(worker);
            session.setAttribute("worker", worker);
            attendance.setWorker(worker);
            attendance.setDateOutWork(new Date());
            attendanceDao.update(attendance);
        }
        req.setAttribute("worker", worker);
        req.getRequestDispatcher("worker.jsp").forward(req, resp);
    }

}
