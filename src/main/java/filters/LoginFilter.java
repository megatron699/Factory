package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/*@WebFilter(servletNames = {"assignmentOfManufactoryServlet", "AttendanceAdminServlet", "LoginServlet", "MainServlet",
"ManufactoryServlet", "RegisterServlet", "StoreServlet", "WorkerAdminServlet"})//Все страницы сайта обрабатывает данный фильтр*/
@WebFilter(value = "/Zavod/*")
public class LoginFilter implements Filter{

        @Override
        public void init(FilterConfig filterConfig) throws ServletException {

        }

        @Override
        public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            HttpSession session = request.getSession(false);
            String loginURI = request.getContextPath() + "/Zavod/login";
            boolean loggedIn = session != null && session.getAttribute("username") != null && session.getAttribute("userrole") != null;
            boolean loginRequest = request.getRequestURI().equals(loginURI);
            if (loggedIn || loginRequest) {
                filterChain.doFilter(request, response);
            } else {
                response.sendRedirect(loginURI);
            }
        }

        @Override
        public void destroy() {
        }

}
