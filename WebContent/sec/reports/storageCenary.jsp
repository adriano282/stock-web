

<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@ page import="java.awt.Color" %>


<br>
		<H3>Armazenamento de Produtos</H3>
<table>
	
	<tr>
	 	
	 	<jsp:useBean id="productByStatusStorage" class="stock.core.impl.reports.cewolf.CountProductByStatusStorage"/>
		<cewolf:chart id="grafico3" title="Qtde Produtos por Status de Estoque" type="pie"> 
		     <cewolf:gradientpaint> 
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="productByStatusStorage" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico3" renderer="/cewolf" width="710" height="380"/>
 	 </tr>
 	 
	<tr>
	 	<jsp:useBean id="productByStorageLevel" class="stock.core.impl.reports.cewolf.CountProductByStorageLevel"/>
		<cewolf:chart id="grafico3" title="Qtde de Produtos por % de Nível de Capacidade de Armazenamento Atingido" type="pie3d"> 
		     <cewolf:gradientpaint> 
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="productByStorageLevel" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico3" renderer="/cewolf" width="710" height="380"/>
 	 </tr>
</table>