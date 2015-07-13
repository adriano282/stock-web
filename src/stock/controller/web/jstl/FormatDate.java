package stock.controller.web.jstl;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class FormatDate extends SimpleTagSupport {
	
	private Calendar calendar;

	public void doTag() throws JspException, IOException {
		
		String formatedDate = "";
		
		Integer dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);
		Integer month = calendar.get(Calendar.MONTH);
		Integer year = calendar.get(Calendar.YEAR);
		
		
		
		formatedDate = 
				(dayOfMonth < 10? "0" + dayOfMonth.toString():dayOfMonth)
				+ "/" + (month < 10? "0" + month.toString():month)
				+ "/" +year; 
		
		getJspContext().getOut().print(formatedDate);
	}

	public Calendar getCalendar() {
		return calendar;
	}

	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}
}
