package stock.controller.web.vh.impl;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Customer;
import domain.DomainEntity;
import domain.Make;
import domain.Product;
import domain.TimeCover;
import stock.controller.web.vh.IViewHelper;
import stock.core.application.Result;
import stock.core.impl.dao.DAOCustomer;
import stock.core.impl.dao.DAOProduct;
import stock.core.impl.reports.dynamicreports.DynamicReportGettingStarted;

public class ProductViewHelper implements IViewHelper{

	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		
		Product product = new Product();
	
		String id = "";
		
		if (request.getParameter("id") != "" && request.getParameter("id") != null) {
			
			DAOProduct dao = new DAOProduct();
			id = request.getParameter("id");
			product= dao.findById(Integer.parseInt(id.trim()));
										
		} else {
			
			id = id.equals("")? request.getParameter("txtId"):id;
			String code = request.getParameter("txtCodigo");
			
			String name;
			name = request.getParameter("txtName");
			
			try {
				
				name = name != null && !name.equals("null") && !name.equals("")? new String(name.getBytes("ISO-8859-1"), "UTF-8"):"";
				
			} catch (UnsupportedEncodingException e1) {
								
			}
			
			String barcode = request.getParameter("txtBarcode");
			String unitMeasure = request.getParameter("txtUnitMeasure");
			String makeName = request.getParameter("txtMake");
			String quantityMinimumSale = request.getParameter("txtQuantityMinimumSale");
			String quantity = request.getParameter("txtQuantity");
			String price = request.getParameter("txtPrice");
			String quantityMinimum = request.getParameter("txtQtdeMin");
			String quantityMaximum = request.getParameter("txtMaxQuantity");
			String dateCreated = request.getParameter("txtDateCreated");
			
			if (dateCreated != null && !dateCreated.equals("") && dateCreated.length() == 10) {
				
				Calendar cal = new GregorianCalendar();		
				cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateCreated.substring(0,2)));
				cal.set(Calendar.YEAR,Integer.parseInt(dateCreated.substring(6,10)));
				cal.set(Calendar.MONTH, Integer.parseInt(dateCreated.substring(3,5)));
				product.setDtCreated(cal);
						
			} else {
				
				product.setDtCreated(null);
			}
		
			TimeCover tc = new TimeCover();
			
			String daysToOorder = request.getParameter("txtDaysToOrder");
			String timeCoverId = request.getParameter("timeCoverId");
			String daysToDelivery = request.getParameter("txtDaysToDelivery");
			String daysToConference = request.getParameter("txtDaysToConference");
			String daysMarginSecurity = request.getParameter("txtDaysMarginSecurity");
			int totalDays = 0;
			
			if (timeCoverId != null && !timeCoverId.trim().equals("")) {
				tc.setId(Integer.parseInt(timeCoverId));
				
			} 
				
			if (daysToOorder != null && !daysToOorder.trim().equals("")) {
				tc.setDaysToOrder(Integer.parseInt(daysToOorder));
				totalDays += tc.getDaysToOrder();
			} 
			
			if (daysToDelivery != null && !daysToDelivery.trim().equals("")) {
				tc.setDaysToDelivery(Integer.parseInt(daysToDelivery));
				totalDays += tc.getDaysToDelivery();
			}
			
			if (daysToConference != null && !daysToConference.trim().equals("")) {
				tc.setDaysToConference(Integer.parseInt(daysToConference));
				totalDays += tc.getDaysToConference();
			}
			
			if (daysMarginSecurity != null && !daysMarginSecurity.trim().equals("")) {
				tc.setDaysMarginSecurity(Integer.parseInt(daysMarginSecurity));
				totalDays += tc.getDaysMarginSecurity();
			}
			
			
			tc.setTotalDays(totalDays);
			
			
			product.setTimeCover(tc);
			product.setCode(code);
			product.setName(name);
			product.setBarcode(barcode);
			product.setUnitMeasure(unitMeasure);
			
			if (quantity != null && !quantity.equals("")) {
				try {
					product.setQuantity(new BigDecimal(Double.parseDouble(quantity)));
				} catch (NumberFormatException e) {
					product.setQuantity(null);
					e.printStackTrace();
				}
			}
			
			if (quantityMinimumSale != null && !quantityMinimumSale.equals("")) {
				
				try {
					
					BigDecimal bdQtdeMinSale = new BigDecimal(Double.parseDouble(quantityMinimumSale));
					
					bdQtdeMinSale = bdQtdeMinSale.setScale(2, BigDecimal.ROUND_HALF_UP);
					
					product.setQuantityMinimumSale(bdQtdeMinSale);
					
				} catch (NumberFormatException e) {
					
					product.setQuantity(null);
					e.printStackTrace();
				}
			}
			
			
			if (quantityMinimum != null && !quantityMinimum.equals("") ) {
				
				try {
					
					BigDecimal bdQtdeMin = new BigDecimal(Double.parseDouble(quantityMinimum));
					
					bdQtdeMin = bdQtdeMin.setScale(2, BigDecimal.ROUND_HALF_UP);
					
					product.setQuantityMinimum(bdQtdeMin);
					
				} catch (NumberFormatException e) {
					
					product.setQuantityMinimum(null);
					e.printStackTrace();
				}
			}
			
			if (quantityMaximum != null && !quantityMaximum.equals("")) {
				
				try {
					
					BigDecimal bdQtdeMax = new BigDecimal(Double.parseDouble(quantityMaximum));
					
					bdQtdeMax = bdQtdeMax.setScale(2, BigDecimal.ROUND_HALF_UP);
					
					product.setMaxQuantity(bdQtdeMax);
					
				} catch (NumberFormatException e) {
					
					product.setMaxQuantity(null);
					e.printStackTrace();
				}
				
			}
			
			if (price != null && !price.equals("")) {
				
				try {
					
					BigDecimal bdPrice = new BigDecimal(Double.parseDouble(price));
					
					bdPrice = bdPrice.setScale(2,BigDecimal.ROUND_HALF_UP);
					
					product.setPrice(bdPrice);
					
				} catch (NumberFormatException e) {
					
					product.setPrice(null);
					e.printStackTrace();
				}
			}
			
			
			Make make = new Make();
			make.setName(makeName);
			product.setMake(make);
			
			if (id != null && !id.trim().equals("")) {				
				try{					
					product.setId(Integer.parseInt(id.trim()));
										
				} catch (NumberFormatException e) {					
					e.printStackTrace();
					product.setId(0);
				}
			}

		}
		
		return product;
	}

	@Override
	public void setView(String operacao, String pageOrigin, int pageNumber, int recordsPerPage, Result resultado,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pagina;
		pagina = "/sec/produtoList.jsp";
				
		if (resultado.getEntities() == null || resultado.getEntities().size() == 0 && !operacao.equals("consult") && !operacao.equals("filter") ) {
			
			DAOProduct dao = new DAOProduct();
			String message = resultado.getMessage();
			resultado = dao.consult(new Product(),(pageNumber -1)* recordsPerPage,recordsPerPage);
			resultado.setMessage(message);
		}
		
		if(operacao.equals("save")){
			
			if(resultado.getMessage() == null) {
				
				DAOProduct dao = new DAOProduct();
				resultado = dao.consult(new Product(),(pageNumber -1)* recordsPerPage,recordsPerPage);
				resultado.setMessage("Produto cadastrado com sucesso!");
				resultado.setTypeMessage(Result.SUCCESS);
				
			} else {
				
				request.setAttribute("produto", (Product) resultado.getEntities().get(0));
				pagina = "/sec/produtoCadastro.jsp";
				
			}
			
		} else if(operacao.equals("process")) {
			
			if (resultado.getMessage() == null) {
				
				resultado.setMessage("Estoque minimo atualizado com sucesso");
				resultado.setTypeMessage(Result.SUCCESS);
			} 	
			
		} else if (operacao.equals("update")) {
			
			if (resultado.getMessage() == null) {
								
				DAOProduct dao = new DAOProduct();
				resultado = dao.consult(new Product(),(pageNumber -1)* recordsPerPage,recordsPerPage);
				resultado.setMessage("Produto alterado com sucesso!");
				resultado.setTypeMessage(Result.SUCCESS);
								
			} else {
				
				resultado.setTypeMessage(Result.DANGER);
				request.setAttribute("produto", (Product) resultado.getEntities().get(0));
				pagina = "/sec/produtoCadastro.jsp";
				
			}
		} else if (operacao.equals("delete")) {
			
			if (resultado.getMessage() == null) {
				
				resultado.setMessage("Produto excluído com sucesso!");
				resultado.setTypeMessage(Result.SUCCESS);
								
			} else {
				
				resultado.setTypeMessage(Result.WARNING);	
				
			}
			
			
		} else if (operacao.equals("consult") && pageOrigin != null && !pageOrigin.equals("")) {
			
			request.setAttribute("produto", (Product) resultado.getEntities().get(0));
			
			if (pageOrigin.equals("orderCreate.jsp")) {
				
				DAOCustomer dao = new DAOCustomer();
				request.setAttribute("clientes", dao.consult(new Customer(),0, null).getEntities());				
			} 
			pagina = pageOrigin.equals("produtoList.jsp")?"/sec/produtoCadastro.jsp":""+"/sec/"+pageOrigin;
			
		} else if (operacao.equals("export")) {
			
			DynamicReportGettingStarted dr = new DynamicReportGettingStarted();
			
			try {
				
				dr.exportReport(resultado.getEntities(), "Listagem de Produtos", false, true);
				File arquivo = new File("/home/adriano/development/workspace/stock-web/WebContent/Listagem de Produtos.png");
							
		        if (!arquivo.exists()) {  
					  
		        	resultado.setMessage("Ocorreu um erro ao tentar realizar o download do arquivo. Tente novamente, caso o erro insista contact o administrador do sistema.");
		        	resultado.setTypeMessage(Result.WARNING);
	
		        } else {  
		        	
		            response.setContentType("application/octet-stream");  
		            response.setHeader("Content-Disposition", "attachment; filename=exported_Archive.png");  
	
		            FileInputStream in = new FileInputStream(arquivo);  
		            PrintWriter output = response.getWriter();  
	
		            int bytes = 0;  
	            	
	                while ( (bytes = in.read()) != -1) {  
	                    output.write(bytes);  
	                }  

	                output.flush();  
		            output.close();
		            
	     			in.close();
	     			
	     			return;
			    }
		        
		        
		        
			} catch (Exception e) {
				
				resultado.setMessage("Ocorreu um erro ao tentar realizar o download do arquivo. Tente novamente, caso o erro insista contact o administrador do sistema.");
	        	resultado.setTypeMessage(Result.WARNING);
                e.printStackTrace(System.out);
                
			}  
		}
		
		request.setAttribute("currentPage", pageNumber);
		request.setAttribute("recordsPerPage", recordsPerPage);
		request.setAttribute("operacao", operacao);
		request.setAttribute("resultado", resultado);
		RequestDispatcher d= request.getRequestDispatcher(pagina);  
		d.forward(request,response); 
	}

}
