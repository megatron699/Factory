package servlets;

import DAO.AssignmentOfManufactoryDao;
import models.AssignmentOfManufactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Zavod/admin/assign")
public class AssignmentOfManufactoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        AssignmentOfManufactoryDao assignmentOfManufactoryDao = new AssignmentOfManufactoryDao();
        String search = req.getParameter("search");
        String searchField = req.getParameter("searchfield");
        String button = req.getParameter("searching");
        if(button != null) {
            switch (button) {
                case "search":
                    req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.search(search, searchField));
                    break;
                case "reset":
                    req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.findAll());
                    break;
            }
        }
        else {
            req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.findAll());
        }
        req.getRequestDispatcher("assignmentofmanufactory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        AssignmentOfManufactory assignmentOfManufactory;
        AssignmentOfManufactoryDao assignmentOfManufactoryDao = new AssignmentOfManufactoryDao();
        switch (action){
            case "add":
                assignmentOfManufactory = new AssignmentOfManufactory();
                assignmentOfManufactory.setAssign(req.getParameter("assign"));
                assignmentOfManufactoryDao.save(assignmentOfManufactory);
                break;
            case "edit":
                assignmentOfManufactory = assignmentOfManufactoryDao.get(Long.parseLong(req.getParameter("id")));
                assignmentOfManufactory.setAssign(req.getParameter("assign"));
                assignmentOfManufactoryDao.update(assignmentOfManufactory);
                break;
            case "delete":
                assignmentOfManufactoryDao.delete(Long.parseLong(req.getParameter("id")));
                break;
            case "exit":
                HttpSession session = req.getSession(false);
                session.invalidate();
                resp.sendRedirect("/Zavod/login");
                break;
        }
        if(!action.equals("exit")) {
            req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.findAll());
            req.getRequestDispatcher("assignmentofmanufactory.jsp").forward(req, resp);
        }
    }
}
