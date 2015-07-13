package stock.controller.web.jstl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import stock.core.application.Result;

public class ShowMessages extends SimpleTagSupport{
	
	private Result resultado;
		
	@Override
	public void doTag() throws JspException, IOException {
		
		if (resultado == null) {
			getJspContext().getOut().print("");
			
		} else if (resultado.getMessage() != null) {
			
			String message;			
			String text = getMessage(resultado.getMessage());			
			text = text != null && !text.equals("null") && !text.equals("")? new String(text.getBytes("ISO-8859-1"), "UTF-8"):"";
		
			if (resultado.getTypeMessage() != null && !resultado.getTypeMessage().equals("")) {
				
				
				message = "<div class='alert alert-" + resultado.getTypeMessage().toLowerCase() +"' role='alert'>"
						+ (resultado.getTypeMessage().equals("WARNING") || 
								resultado.getTypeMessage().equals("DANGER")? 
										"<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>":"")
						+ (!text.equals("")? text:resultado.getMessage())
						+ "</div>";
				
			} else {
				
				message = resultado.getMessage();
				
			}
			
			getJspContext().getOut().print(message);
		}		 
	}
	
	public void setResultado(Result resultado) {
		this.resultado = resultado;
	}
	
	public String getMessage(String key) {
		
		if (key == null || key.equals(""))
			return "";
		
		try {
			
			FileInputStream file = new FileInputStream("/home/adriano/development/workspace/stock-web/system_messages.prop");
			Properties props = new Properties();
			
			props.load(file);
			
			return props.getProperty(key);			
			
		} catch (IOException e) {
			
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static void main(String args[]) {
		
		ShowMessages s = new ShowMessages();
		
		
		System.out.println(s.getMessage("customer.name.empty.error.message"));
		
		String texto = s.getMessage("customer.name.empty.error.message");
		
		try {
			texto = new String(texto.getBytes("ISO-8859-1"), "UTF-8");
			System.out.println(texto);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
