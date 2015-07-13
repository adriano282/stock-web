package stock.controller.web.jstl;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class Paginate extends SimpleTagSupport {
		
	private int recordsPerPage;
	private int total;
	private String params;	
	private double numberPages;
	private int currentPage;
	
	public void doTag() throws JspException, IOException {
		
		numberPages =  Math.ceil((total / recordsPerPage)) + ((total % recordsPerPage == 0)? 0:1);
		
		String paginate = "<nav>"
			+ "<ul class='pagination'>";
							    
		
		paginate = paginate 
				+ "<li>"
				+ "<a href='";
		if (numberPages > 0 && currentPage > 1) {			
			//getJspContext().getOut().print("<td><a href='"+params+"&page="+(currentPage - 1)+"'>Anterior</a></td>");
			paginate = paginate
			+params+"&page="+(currentPage - 1);
		}
		
		paginate = paginate 
		+ "' aria-label='Previous'>"
		+ "<span aria-hidden='true'>&laquo;</span>"
		+ "</a>"
		+ "</li>";
//		getJspContext().getOut().print("<table border='1' cellpadding='5' cellspacing='5'> <tr>");
		
		for( int i = 1; i < numberPages+1; i++) {
			if(i == currentPage) {
				//getJspContext().getOut().print("<td>"+i+"</td>");
				
			    paginate = paginate + "<li class='active'><a href='#'>"+i+"</a></li>"; 

			} else {
				//getJspContext().getOut().print("<td><a href='"+ params +"&page="+i+"'>" +i+"</a></td>");
				paginate = paginate + "<li><a href='"+ params +"&page="+i+"'>"+i+"</a></li>";
				
			}
			
		}
		//getJspContext().getOut().print("</tr></table>");
		
		paginate = paginate
				+ "<li>"
				+ "<a href='";
		if (currentPage != numberPages ) {
			//getJspContext().getOut().print("<td><a href='" + params + "&page="+(currentPage + 1)+"'>Proximo</a></td>");
			paginate = paginate
			+ params + "&page="+(currentPage + 1);
		} else {
			paginate = paginate + "#";
		}
		
		
		paginate = paginate 
			+"' aria-label='Next'>"
		    + "<span aria-hidden='true'>&raquo;</span>"
		    + "</a>"
		    + "</li>"
		    + "</ul></nav>";
		getJspContext().getOut().print(paginate);
			
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
}
