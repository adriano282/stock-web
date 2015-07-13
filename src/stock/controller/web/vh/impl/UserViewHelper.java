package stock.controller.web.vh.impl;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.DomainEntity;
import domain.User;
import stock.controller.web.vh.IViewHelper;
import stock.core.application.Result;
import stock.core.impl.dao.DAOUser;

public class UserViewHelper implements IViewHelper {

	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		
		User user = new User();
		
		String id = request.getParameter("id");
		String username = request.getParameter("txtUsername");
		String password = request.getParameter("txtPassword");
		String root = request.getParameter("rdRoot");
		String ableEmail = request.getParameter("rdAbleEmail");
		String dateCreated = request.getParameter("txtDtCreated");
		
		if (dateCreated != null && !dateCreated.equals("") && dateCreated.length() == 10) {
			
			Calendar cal = new GregorianCalendar();		
			cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateCreated.substring(0,2)));
			cal.set(Calendar.YEAR,Integer.parseInt(dateCreated.substring(6,10)));
			cal.set(Calendar.MONTH, Integer.parseInt(dateCreated.substring(3,5)));
			user.setDtCreated(cal);
					
		} else {
			
			user.setDtCreated(null);
		}
		
		if (root == null)
			root = "0";
		
		user.setId(null);
		
		if (ableEmail == null)
			ableEmail = "0";
		
		if (id != null && !id.equals("")) {
			user.setId(Integer.parseInt(id));
		}
		
		user.setUsername(username);
		user.setHashCodePassword(password != null && !password.equals("")? password.hashCode():null);
		user.setRoot(root.equals("0")? false:true);
		user.setAbleEmail(ableEmail.equals("0")? false:true);
				
		return user;
	}

	@Override
	public void setView(String operacao, String pageOrigin, int pageNumber, int recordsPerPage,
			Result resultado, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String pagina = "/sec/userList.jsp";		
				
		if (operacao.equals("save") || operacao.equals("update") || operacao.equals("delete")) {
			
			if(resultado.getMessage() == null) {
				
				String message = operacao.equals("delete")? "Usuário excluido com sucesso.":"Usuario salvo com sucesso!";
				resultado.setMessage(message);
				resultado.setTypeMessage(Result.SUCCESS);
				
				DAOUser dao = new DAOUser();
				
				resultado.setEntities(dao.consult(new User(), (pageNumber -1)*recordsPerPage, recordsPerPage).getEntities());
				resultado.setCountEntities(dao.consult(new User(), (pageNumber -1)*recordsPerPage, recordsPerPage).getCountEntities());
				
			} else {
				
				resultado.setTypeMessage(Result.DANGER);
				switch (operacao) {
					
					case "delete":
						pagina = "/sec/userList.jsp";
						break;
					
					case "update":
						pagina = "/sec/userCadastro.jsp";
						break;
						
					case "save":
						pagina = "/sec/userCadastro.jsp";
						break;
						
				}
				
			}		
			
		} else if (operacao.equals("consult") && pageOrigin != null) {
			
			request.setAttribute("user", (User) resultado.getEntities().get(0));
			pagina = "/sec/userCadastro.jsp";
			
		}
		
		request.setAttribute("currentPage", pageNumber);
		request.setAttribute("recordsPerPage", recordsPerPage);
		request.setAttribute("resultado", resultado);
		request.setAttribute("operacao", operacao);
		
		RequestDispatcher d= request.getRequestDispatcher(pagina);  
		d.forward(request,response);
		
		
	}

	
}
