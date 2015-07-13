package stock.controller.web.vh.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.DomainEntity;
import stock.controller.web.vh.IViewHelper;
import stock.core.application.Result;

public class DefaultViewHelper implements IViewHelper {

	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setView(String operacao, String pageOrigin, int pageNumber,int recordsPerPage, Result resultado,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher d= request.getRequestDispatcher("/sec/menu.jsp");  
		d.forward(request,response); 
		
	}

}
