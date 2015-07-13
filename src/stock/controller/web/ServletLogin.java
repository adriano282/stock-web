package stock.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import stock.core.impl.dao.DAOUser;
import stock.core.service.EmailService;
import domain.User;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	
    	DAOUser dao = new DAOUser();
    	   
    	User user = dao.getUserByUsername(username);
    	HttpSession session = request.getSession();
    	
    	String page = "/login.jsp";
    	
    	if (user == null) {
    		
    		request.setAttribute("message", "Usuário incorreto.");
    		session.setAttribute("user", null);
    		
    		requestDispacher(request, response, page);
    		return;
    	} 
    	    	
    	
    	if (user.getHashCodePassword() == password.hashCode()) {
    		
    		session.setAttribute("user", user);
    		page = "/sec/menu.jsp";
    		
    		setUserEmail(user);   		
    		
    	} else {
    		
    		request.setAttribute("message", "Senha incorreta.");
    	}
    	
    	requestDispacher(request, response, page);
    	    	
	}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();    	
    	session.setAttribute("user", null);
    	
    	String page = "/login.jsp";
    	
    	requestDispacher(request, response, page);	
    	
    }
    
    private void requestDispacher(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher(page);
    	dispatcher.forward(request,response);
    	
    }
    
    /**
     * Method for configuration of user with the EmailService.
     * @param user
     * 		User that is logged on the system.
     */
    private void setUserEmail(User user) {
    	
    	EmailService emailService = EmailService.getInstance();
    	
    	if (user.getAbleEmail()) {
    		
			emailService.setEmailUserLogged(user.getUsername());
			
    	}
    	    	
    	if (user.getRoot()) {  			
    		
    		emailService.setAddressUserRoot(user.getAbleEmail()? user.getUsername():"");
			
		} else {
		
			DAOUser dao = new DAOUser();
			User userRoot = dao.getUserRoot();
			
			if (userRoot != null && userRoot.getAbleEmail()) {
				
				emailService.setAddressUserRoot(userRoot.getUsername());
				
			}
			 	
		}
    	
    }
    

}
