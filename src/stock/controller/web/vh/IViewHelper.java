package stock.controller.web.vh;

import java.io.IOException;

import domain.DomainEntity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import stock.core.application.Result;


public interface IViewHelper {
	
	public DomainEntity getEntity(HttpServletRequest request);
	
	public void setView(String operacao, String pageOrigin, int pageNumber,int recordsPerPage, Result resultado, 
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
