package stock.controller.web.vh.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Address;
import domain.Customer;
import domain.DomainEntity;
import stock.controller.web.vh.IViewHelper;
import stock.core.application.Result;
import stock.core.impl.dao.DAOCustomer;

public class CustomerViewHelper implements IViewHelper{

	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		Customer c = new Customer();
		
		Address ad = new Address();
		String id = "";
		
		if (request.getParameter("txtId")!= null && !request.getParameter("txtId").equals("")) {
			id = request.getParameter("txtId");
		} else {
			id = request.getParameter("customer.id");
		}
		
			String name = request.getParameter("customer.name");
			name = name == null?request.getParameter("txtName"):name;
			
			try {
				
				name = name != null && !name.equals("null") && !name.equals("")? new String(name.getBytes("ISO-8859-1"), "UTF-8"):"";
				
			} catch (UnsupportedEncodingException e1) {
								
			}
			
			String email = request.getParameter("customer.email");
			email = email == null?request.getParameter("txtEmail"):email;
			
			String type = request.getParameter("rdType");
			
			if (type == null || type.equals("")) {
				
				type = request.getParameter("txtType");
				
			}
			
			String document = "";
			
			if (type != null && type.equals("PF")) {
				
				document = request.getParameter("customer.cpf");
				
			} else if (type != null && type.equals("PJ")) {
				
				document = request.getParameter("customer.cnpj");
			}
			
			document = document == null || document.equals("")?request.getParameter("txtDocument"):document;
			
			String phone = request.getParameter("customer.phone");
			phone = phone == null?request.getParameter("txtPhone"):phone;
			
			
			String street = request.getParameter("customer.street");
			String zipcode = request.getParameter("customer.zipcode");
			String number = request.getParameter("customer.number");
			String quarter = request.getParameter("customer.quarter");
			
			try {				
				quarter = quarter != null && !quarter.equals("null") && !quarter.equals("")? new String(quarter.getBytes("ISO-8859-1"), "UTF-8"):"";				
			} catch (UnsupportedEncodingException e1) {
								
			}

			
			String city = request.getParameter("customer.city");
			
			try {				
				city = city != null && !city.equals("null") && !city.equals("")? new String(city.getBytes("ISO-8859-1"), "UTF-8"):"";				
			} catch (UnsupportedEncodingException e1) {
								
			}
			String state = request.getParameter("customer.state");
					
			if (id != null && !id.equals("")) {
				try {
					c.setId(Integer.parseInt(id));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			c.setName(name);
			c.setEmail(email);
			c.setDocument(document);
			c.setPhone(phone);
			c.setType(type);
			ad.setStreet(street);
			ad.setZipCode(zipcode);
			ad.setNumber(number);
			ad.setQuarter(quarter);
			ad.setCity(city);
			ad.setState(state);
			c.setAddress(ad);
		return c;
	}

	@Override
	public void setView(String operacao, String pageOrigin, int pageNumber, int recordsPerPage, Result resultado,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pagina = "/sec/customerList.jsp";		
				
		if (resultado.getEntities() == null || resultado.getEntities().size() == 0 && !operacao.equals("consult") && !operacao.equals("filter") ) {
						
			DAOCustomer dao = new DAOCustomer();
			String message = resultado.getMessage();
			resultado = dao.consult(new Customer(),(pageNumber -1)* recordsPerPage,recordsPerPage);
			resultado.setMessage(message);
		}
		
		if ((operacao.equals("save") || operacao.equals("update"))) {
			
			if (resultado.getMessage() == null) {
				
				String message = operacao.equals("save")? "Cliente cadastrado com sucesso!": "Cliente atualizado com sucesso!"; 
				resultado.setMessage(message);
				resultado.setTypeMessage(Result.SUCCESS);
				DAOCustomer dao = new DAOCustomer();
				
				resultado.setEntities(dao.consult(new Customer(), (pageNumber -1)*recordsPerPage, recordsPerPage).getEntities());
				resultado.setCountEntities(dao.consult(new Customer(), (pageNumber -1)*recordsPerPage, recordsPerPage).getCountEntities());
				
			} else {
				
				resultado.setTypeMessage(Result.DANGER);
				request.setAttribute("cliente", (Customer) resultado.getEntities().get(0));
				pagina = "/sec/customerCadastro.jsp";
				
			}
						
		} else if (operacao.equals("delete")) {
			
			if (resultado.getMessage() == null) {
				
				resultado.setMessage("Cliente excluído com sucesso!");
				resultado.setTypeMessage(Result.SUCCESS);
			} else {
				
				resultado.setTypeMessage(Result.DANGER);
			}
			
			
		} else if (operacao.equals("consult") && pageOrigin != null) {
			
			request.setAttribute("cliente", (Customer) resultado.getEntities().get(0));
			pagina = "/sec/customerCadastro.jsp";
			
		}
		
		request.setAttribute("currentPage", pageNumber);
		request.setAttribute("recordsPerPage", recordsPerPage);
		request.setAttribute("resultado", resultado);
		request.setAttribute("operacao", operacao);
		
		RequestDispatcher d= request.getRequestDispatcher(pagina);  
		d.forward(request,response);
		
	}

}
