package servlets;

import DAO.AssignmentOfManufactoryDao;
import DAO.ManufactoryDao;
import models.AssignmentOfManufactory;
import models.Manufactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Zavod/admin/manufactory")
public class ManufactoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ManufactoryDao manufactoryDao = new ManufactoryDao();
        AssignmentOfManufactoryDao assignmentOfManufactoryDao = new AssignmentOfManufactoryDao();
        String search = req.getParameter("search");
        String searchField = req.getParameter("searchfield");
        String button = req.getParameter("searching");
        if(button != null) {
            switch (button) {
                case "search":
                    req.setAttribute("manufactories", manufactoryDao.search(search, searchField));
                    break;
                case "reset":
                    req.setAttribute("manufactories", manufactoryDao.findAll());
                    break;
            }
        }
        else {
            req.setAttribute("manufactories", manufactoryDao.findAll());
        }
        req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.findAll());
        req.getRequestDispatcher("manufactory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        Manufactory manufactory;
        ManufactoryDao manufactoryDao = new ManufactoryDao();
        AssignmentOfManufactoryDao assignmentOfManufactoryDao = new AssignmentOfManufactoryDao();
        switch (action){
            case "add":
                manufactory = new Manufactory();
                manufactory.setPlaceOfWorkName(req.getParameter("placeofworkname") + " цех");
                if(req.getParameter("amountcurrently") != "")
                    manufactory.setAmountCurrently(Integer.parseInt(req.getParameter("amountcurrently")));
                if(req.getParameter("amountpermonth") != "")
                    manufactory.setAmountPerMonth(Integer.parseInt(req.getParameter("amountpermonth")));
                if(req.getParameter("assignmentofmanufactory") != "" && req.getParameter("assignmentofmanufactory") != null)
                    manufactory.setAssignmentOfManufactory(
                            assignmentOfManufactoryDao.get(Long.parseLong(req.getParameter("assignmentofmanufactory"))));
                manufactoryDao.save(manufactory);
                break;
            case "edit":
                manufactory = manufactoryDao.get(Long.parseLong(req.getParameter("id")));
                manufactory.setPlaceOfWorkName(req.getParameter("placeofworkname"));
                if(req.getParameter("amountcurrently") != "")
                    manufactory.setAmountCurrently(Integer.parseInt(req.getParameter("amountcurrently")));
                if(req.getParameter("amountpermonth") != "")
                    manufactory.setAmountPerMonth(Integer.parseInt(req.getParameter("amountpermonth")));
                if(req.getParameter("assignmentofmanufactory") != "" && req.getParameter("assignmentofmanufactory") != null) manufactory.setAssignmentOfManufactory(
                        assignmentOfManufactoryDao.get(Long.parseLong(req.getParameter("assignmentofmanufactory"))));
                manufactoryDao.update(manufactory);
                break;
            case "delete":
                manufactoryDao.delete(Long.parseLong(req.getParameter("id")));
                break;

            case "exit":
                HttpSession session = req.getSession(false);
                session.invalidate();
                resp.sendRedirect("/Zavod/login");
                break;
        }
        if(!action.equals("exit")) {

            req.setAttribute("assignmentofmanufactories", assignmentOfManufactoryDao.findAll());
            req.setAttribute("manufactories", manufactoryDao.findAll());
            req.getRequestDispatcher("manufactory.jsp").forward(req, resp);
        }
    }
}
