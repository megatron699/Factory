package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/Zavod/login")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);
        String loginURIAdmin = request.getContextPath() + "/Zavod/admin/index";
        String loginURIUser = request.getContextPath() + "/Zavod/user/worker";
        boolean loggedIn = session != null && session.getAttribute("username") != null && session.getAttribute("userrole") != null;
        if (loggedIn) {
            if(Boolean.parseBoolean(session.getAttribute("userrole").toString())) {
                response.sendRedirect(loginURIAdmin);
            } else {
                response.sendRedirect(loginURIUser);
            }
        } else {
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
