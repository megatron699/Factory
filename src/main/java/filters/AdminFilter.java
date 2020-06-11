package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebFilter("/Zavod/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);

        //Существует ли сессиия
        boolean loggedIn = session != null && session.getAttribute("username") != null && session.getAttribute("userrole") != null;
        if (loggedIn) {
            //Если существует то получаем роль
            boolean userRole = Boolean.parseBoolean(session.getAttribute("userrole").toString(  ));
            if (!userRole) {
                response.sendRedirect(request.getContextPath() + "/Zavod/user/worker");
            } else {
                response.sendRedirect(request.getContextPath() + "/Zavod/admin/index");
            }
        } else{
            response.sendRedirect(request.getContextPath() + "/Zavod/login");
        }
    }

    @Override
    public void destroy() {

    }
}
