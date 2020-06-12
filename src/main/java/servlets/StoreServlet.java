package servlets;

import DAO.PlaceOfWorkDao;
import DAO.StoreDao;
import models.PlaceOfWork;
import models.Store;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Zavod/admin/store")
public class StoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoreDao storeDao = new StoreDao();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String search = req.getParameter("search");
        String searchField = req.getParameter("searchfield");
        String button = req.getParameter("searching");
        if(button != null) {
            switch (button) {
                case "search":
                    req.setAttribute("stores", storeDao.search(search, searchField));
                    break;
                case "reset":
                    req.setAttribute("stores", storeDao.findAll());
                    break;
            }
        }
        else {
            req.setAttribute("stores", storeDao.findAll());
        }
       // req.setAttribute("stores", storeDao.findAll());
        req.getRequestDispatcher("store.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        Store store;
        StoreDao storeDao = new StoreDao();
        switch (action){
            case "add":
                store = new Store();
                store.setPlaceOfWorkName(req.getParameter("placeofworkname") + " склад");
                store.setAmountOfStored(Integer.parseInt(req.getParameter("amountofstored")));
                store.setTypeOfStored(req.getParameter("typeofstored"));
                storeDao.save(store);
                break;
            case "edit":
                store = storeDao.get(Long.parseLong(req.getParameter("id")));
                store.setPlaceOfWorkName(req.getParameter("placeofworkname"));
                store.setAmountOfStored(Integer.parseInt(req.getParameter("amountofstored")));
                store.setTypeOfStored(req.getParameter("typeofstored"));
                storeDao.update(store);
                break;
            case "delete":
                storeDao.delete(Long.parseLong(req.getParameter("id")));
                break;
            case "exit":
                HttpSession session = req.getSession(false);
                session.invalidate();
                resp.sendRedirect("/Zavod/login");
                break;
        }
        if(!action.equals("exit")) {
            req.setAttribute("stores", storeDao.findAll());
            req.getRequestDispatcher("store.jsp").forward(req, resp);
        }
    }
}
