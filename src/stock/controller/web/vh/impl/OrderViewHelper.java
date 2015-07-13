package stock.controller.web.vh.impl;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Customer;
import domain.DomainEntity;
import domain.Order;
import domain.Product;
import stock.controller.web.vh.IViewHelper;
import stock.core.application.Result;
import stock.core.impl.dao.DAOCustomer;
import stock.core.impl.dao.DAOOrder;
import stock.core.impl.dao.DAOProduct;

public class OrderViewHelper implements IViewHelper {
	
	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		
		DAOCustomer daoCustomer = new DAOCustomer();
		DAOProduct daoProduct = new DAOProduct();
		Order ol = new Order();
		
		String id = request.getParameter("id");
		id = id == null? request.getParameter("txtId"):id;
		
		String code = request.getParameter("txtCode");
		String nameProduct = request.getParameter("txtNameProduct");
		String document = request.getParameter("txtDocument");
		String nameCustomer = request.getParameter("txtNameCustomer");
		String idCustomer = request.getParameter("customerID");
		String idProduct = request.getParameter("product.id");
		String quantity = request.getParameter("txtQuantity");
		String dateCreated = request.getParameter("txtDateCreated");
		
		Customer c = new Customer();
		
		if (dateCreated != null && !dateCreated.equals("") && dateCreated.length() == 10) {
			
			Calendar cal = new GregorianCalendar();		
			cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateCreated.substring(0,2)));
			cal.set(Calendar.YEAR,Integer.parseInt(dateCreated.substring(6,10)));
			cal.set(Calendar.MONTH, Integer.parseInt(dateCreated.substring(3,5)));
			ol.setDtCreated(cal);
					
		} else {
			
			ol.setDtCreated(null);
		}
		
		
		if (idCustomer == null || idCustomer.equals("")) {
			
			c.setName(nameCustomer);
			c.setDocument(document);
			
		} else {
			
			c = daoCustomer.findById(Integer.parseInt(idCustomer.replaceAll("\n||\r||\t", "").trim()));
			
		}
		
		Product p = new Product();
		
		if (idProduct == null || idProduct.equals("")) {
			
			p.setCode(code);
			p.setName(nameProduct);
			
		} else {
			
			p = daoProduct.findById(Integer.parseInt(idProduct));
			
		}
		
		if (id != null && !id.equals("")) {
			
			ol.setId(Integer.parseInt(id));
			
		}
					
		ol.setCustomer(c);
		ol.setProduct(p);
		
		if (quantity != null && !quantity.equals("")) {
			
			ol.setQuantity(Double.parseDouble(quantity));
			BigDecimal dbQuantidadeVenda = new BigDecimal(ol.getQuantity());
			
			Double subTotal = Double.parseDouble(dbQuantidadeVenda.multiply(ol.getProduct().getPrice()).toString());
			ol.setSubTotal(subTotal);
		}
		
		return ol;
	}

	@Override
	public void setView(String operacao, String pageOrigin, int pageNumber, int recordsPerPage, Result resultado,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pagina = "/sec/orderList.jsp";		
					
		if ((resultado.getEntities() == null || resultado.getEntities().size() == 0) && resultado.getMessage() == null && !operacao.equals("consult")) {
			
			DAOOrder dao = new DAOOrder();
			resultado = dao.consult(new Order(),(pageNumber -1)* recordsPerPage,recordsPerPage);
		}
		
		if(operacao.equals("save")){
			if (resultado.getMessage() == null && pageOrigin.equals("orderCreate.jsp")) {
				
				resultado.setTypeMessage(Result.SUCCESS);
				resultado.setMessage("Venda cadastrada com sucesso!");
				
			} else {
				
				DAOProduct daoP = new DAOProduct();
				DAOCustomer daoC = new DAOCustomer();
				resultado.setEntityFiltered(new Product());
				request.setAttribute("clientes", daoC.consult(new Customer(), 0, null).getEntities());
				String message = resultado.getMessage();
				resultado = daoP.consult(new Product(), (pageNumber -1) * recordsPerPage, recordsPerPage);
				
				if (!pageOrigin.equals("orderList.jsp")) {
					
					resultado.setMessage(message);
					resultado.setTypeMessage(Result.DANGER);
					
				} 
				
				pagina = "/sec/orderCreate.jsp";
			}
			
		} else if (resultado.getMessage() == null && operacao.equals("update")) {
			
			resultado.setMessage("Venda alterado com sucesso!");
			resultado.setTypeMessage(Result.SUCCESS);
			
		} else if (resultado.getMessage() == null && operacao.equals("delete")) {
			
			resultado.setMessage("Venda excluída com sucesso!");
			resultado.setTypeMessage(Result.SUCCESS);
			
		} else if (operacao.equals("consult") && pageOrigin != null && pageOrigin.equals("orderList")) {
			
			pagina = "/sec/orderEdit.jsp";
		}
		
		request.setAttribute("currentPage", pageNumber);
		request.setAttribute("recordsPerPage", recordsPerPage);
		request.setAttribute("resultado", resultado);
		request.setAttribute("operacao", operacao);
			
		RequestDispatcher d= request.getRequestDispatcher(pagina);  
		d.forward(request,response);
	}

}
