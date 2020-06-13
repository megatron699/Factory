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

@WebServlet("/Zavod/admin/worker")
public class WorkerAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        WorkerDao workerDao = new WorkerDao();
        AttendanceDao attendanceDao = new AttendanceDao();
        PlaceOfWorkDao placeOfWorkDao = new PlaceOfWorkDao();
        String search = req.getParameter("search");
        String searchField = req.getParameter("searchfield");
        String button = req.getParameter("searching");
        if (button != null) {
            switch (button) {
                case "search":
                    req.setAttribute("workers", workerDao.search(search, searchField));
                    break;
                case "reset":
                    req.setAttribute("workers", workerDao.findAll());
                    break;
            }
        } else {
            req.setAttribute("workers", workerDao.findAll());
        }

        req.setAttribute("placeofworks", placeOfWorkDao.findAll());
        req.getRequestDispatcher("worker.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        Worker worker;
        PlaceOfWorkDao placeOfWorkDao = new PlaceOfWorkDao();
        WorkerDao workerDao = new WorkerDao();
        switch (action) {
            case "add":
                worker = new Worker();
                worker.setLastname(req.getParameter("lastname"));
                worker.setFirstname(req.getParameter("firstname"));
                worker.setMiddlename(req.getParameter("middlename"));
                worker.setPost(req.getParameter("post"));
                if (req.getParameter("placeofwork") != "" && req.getParameter("placeofwork") != null)
                    worker.setPlaceOfWork(placeOfWorkDao.get(Long.parseLong(req.getParameter("placeofwork"))));
                String[] vacation = req.getParameterValues("vacation");
                if (vacation != null && vacation.length > 0)
                    worker.setVacation(true);
                String[] sickLeave = req.getParameterValues("sickLeave");
                if (sickLeave != null && sickLeave.length > 0)
                    worker.setSickLeave(true);
                workerDao.save(worker);
                break;
            case "edit":
                worker = workerDao.get(Long.parseLong(req.getParameter("id")));
                worker.setLastname(req.getParameter("lastname"));
                worker.setFirstname(req.getParameter("firstname"));
                worker.setMiddlename(req.getParameter("middlename"));
                worker.setPost(req.getParameter("post"));
                if (req.getParameter("placeofwork") != "" && req.getParameter("placeofwork") != null)
                    worker.setPlaceOfWork(placeOfWorkDao.get(Long.parseLong(req.getParameter("placeofwork"))));
                vacation = req.getParameterValues("vacation");
                if (vacation != null && vacation.length > 0)
                    worker.setVacation(true);
                else worker.setVacation(false);
                sickLeave = req.getParameterValues("sickLeave");
                if (sickLeave != null && sickLeave.length > 0)
                    worker.setSickLeave(true);
                else worker.setSickLeave(false);
                workerDao.update(worker);
                break;
            case "delete":
                workerDao.delete(Long.parseLong(req.getParameter("id")));
                break;
            case "inOut":
                AttendanceDao attendanceDao = new AttendanceDao();
                worker = workerDao.get(Long.parseLong(req.getParameter("id")));
                Attendance attendance;
                if(!worker.isPresence()) {
                    worker.setPresence(true);
                    workerDao.update(worker);
                    attendance = new Attendance();
                    attendance.setWorker(worker);
                    attendance.setDateInWork(new Date());
                    attendanceDao.save(attendance);

                } else {
                    attendance = attendanceDao.getByIdAndDate(worker, new Date());
                    worker.setPresence(false);
                    workerDao.update(worker);
                    attendance.setWorker(worker);
                    attendance.setDateOutWork(new Date());
                    attendanceDao.update(attendance);
                }
                break;
            case "exit":
                HttpSession session = req.getSession(false);
                session.invalidate();
                resp.sendRedirect("/Zavod/login");
                break;
        }
        if(!action.equals("exit")) {
            req.setAttribute("workers", workerDao.findAll());
            req.setAttribute("placeofworks", placeOfWorkDao.findAll());
            req.getRequestDispatcher("worker.jsp").forward(req, resp);
        }
    }
}
