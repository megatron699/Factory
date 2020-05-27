package servlets;

import DAO.AssignmentOfManufactoryDao;
import models.AssignmentOfManufactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/assign")
public class AssignmentOfManufactoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AssignmentOfManufactoryDao assignmentOfManufactoryDao = new AssignmentOfManufactoryDao();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.findAll());
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
        }
        req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.findAll());
        req.getRequestDispatcher("assignmentofmanufactory.jsp").forward(req, resp);
    }
}
