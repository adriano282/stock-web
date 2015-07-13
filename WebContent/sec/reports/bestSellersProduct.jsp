<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@ page import="java.awt.Color" %>

<table>
	<tr>
		<jsp:useBean id="pageViews" class="stock.core.impl.reports.cewolf.CountSalesBestSellersProducts"/>
		<cewolf:chart id="grafico1" title="Vendas - Produtos Mais Vendidos" type="verticalbar3d"  xaxislabel="Produtos"  yaxislabel="Qtde Vendas"> 
		     <cewolf:gradientpaint> 
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="pageViews" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico1" renderer="/cewolf" width="710" height="380"/> 
	</tr>
	
	<tr>
		<jsp:useBean id="pageViews2" class="stock.core.impl.reports.cewolf.SumItensBestSellersProducts"/>
		<cewolf:chart id="grafico1" title="Itens - Produtos Mais Vendidos" type="verticalbar3d"  xaxislabel="Produtos"  yaxislabel="Soma da Qtde de Itens"> 
		     <cewolf:gradientpaint> 
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="pageViews2" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico1" renderer="/cewolf" width="710" height="380"/> 
	</tr>
</table>