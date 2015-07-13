package stock.controller.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.DomainEntity;
import stock.controller.web.command.ICommand;
import stock.controller.web.command.impl.ConsultCommand;
import stock.controller.web.command.impl.DeleteCommand;
import stock.controller.web.command.impl.ProcessCommand;
import stock.controller.web.command.impl.SaveCommand;
import stock.controller.web.command.impl.UpdateCommand;
import stock.controller.web.vh.IViewHelper;
import stock.controller.web.vh.impl.CustomerViewHelper;
import stock.controller.web.vh.impl.DefaultViewHelper;
import stock.controller.web.vh.impl.OrderViewHelper;
import stock.controller.web.vh.impl.ProductViewHelper;
import stock.controller.web.vh.impl.UserViewHelper;
import stock.core.application.Result;

public class Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Map<String, ICommand> commands;
	private static Map<String, IViewHelper> vhs;	
	
    /**
     * Default constructor. 
     */
    public Servlet() {
    	
    	commands = new HashMap<String, ICommand>();
    	
    	commands.put("update", 	new UpdateCommand()	);
    	commands.put("save", 	new SaveCommand()	);
    	commands.put("delete", 	new DeleteCommand()	);
    	commands.put("consult", new ConsultCommand());
    	commands.put("filter", 	new ConsultCommand());
    	commands.put("process", new ProcessCommand());
    	commands.put("export",  new ConsultCommand());
    	    	
    	vhs = new HashMap<String, IViewHelper>();
    	
    	vhs.put("/stock-web/Produto", 	new ProductViewHelper());
    	vhs.put("/stock-web/Cliente", 	new CustomerViewHelper());
    	vhs.put("/stock-web/Order", 	new OrderViewHelper());
    	vhs.put("/stock-web/User", 		new UserViewHelper());
    	vhs.put("/stock-web/sec/Produto", 	new ProductViewHelper());
    	vhs.put("/stock-web/sec/Cliente", 	new CustomerViewHelper());
    	vhs.put("/stock-web/sec/Order", 	new OrderViewHelper());
    	vhs.put("/stock-web/sec/User", 		new UserViewHelper());
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String uri = request.getRequestURI();
		
		String operacao = request.getParameter("operacao");
		
		IViewHelper vh = vhs.get(uri);
		vh = vh == null? new DefaultViewHelper():vh;
		String pageOrigin = request.getParameter("origin");
		
		DomainEntity entidade =  vh.getEntity(request);
		Result resultado = null;
		int page = 1;
		int recordsPerPage = 10;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if (entidade != null) {
			operacao = operacao != null? operacao:"consult";
			ICommand command = commands.get(operacao);
			resultado = operacao.equals("consult") ? command.execute(entidade, page, recordsPerPage):command.execute(entidade);
		}
		
		vh.setView(operacao, pageOrigin, page,recordsPerPage, resultado, request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();		
		String operacao = request.getParameter("operacao");		
		IViewHelper vh = vhs.get(uri);
		vh = vh == null? new DefaultViewHelper():vh;
		String pageOrigin = request.getParameter("origin");
		
		DomainEntity entidade =  vh.getEntity(request);
		Result resultado = null;
		int page = 1;
		int recordsPerPage = 10;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if (entidade != null) {
			operacao = operacao != null? operacao:"consult";
			ICommand command = commands.get(operacao);
			
			if (operacao.equals("export")) {
				
				resultado = command.execute(entidade, 0, null);
			} else {
				resultado = operacao.equals("consult") || operacao.equals("filter")? command.execute(entidade, page, recordsPerPage):command.execute(entidade);
			}
			
			
		}
		
		vh.setView(operacao, pageOrigin, page, recordsPerPage, resultado, request, response);
	}
	
		

}
