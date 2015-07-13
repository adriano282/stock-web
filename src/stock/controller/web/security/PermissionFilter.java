package stock.controller.web.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import stock.core.impl.dao.DAOUser;
import domain.User;


@WebFilter(asyncSupported = true, urlPatterns = { "/sec/User", "/sec/userCadastro.jsp", "/sec/userEdit.jsp", "/sec/userlist.jsp" })
public class PermissionFilter implements Filter {

    public PermissionFilter() {
        
    }

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		DAOUser dao = new DAOUser();
		if (user == null) {
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp");
			dispatcher.forward(req, res);
			
			return;
			
		} else if (!((User) dao.consult(user).getEntities().get(0)).getRoot()) {
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/accessDenied.jsp");
			dispatcher.forward(req, res);
			return;
			
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
