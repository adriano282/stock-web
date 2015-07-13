<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@ page import="java.awt.Color" %>


<table>
	<tr>
		<jsp:useBean id="pageViews" class="stock.core.impl.reports.cewolf.CountSaleByMonth"/>
		<!-- GRÁFICO LINHAS E COLUNA --> 
		 <cewolf:chart id="grafico1" title="Quantidade de Vendas" type="verticalbar3d" xaxislabel="Periodo"  yaxislabel="Quantidade de Vendas"> 
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
	 	
	 	<jsp:useBean id="salesByDaysOfWeek" class="stock.core.impl.reports.cewolf.SalesByDaysOfWeek"/>
		<cewolf:chart id="grafico3" title="(%) Vendas Por Dia da Semana" type="pie3d"> 
		     <cewolf:gradientpaint> 
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="salesByDaysOfWeek" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico3" renderer="/cewolf" width="710" height="380"/>
 	 </tr>
	 <tr>
	 	<jsp:useBean id="sumSales" class="stock.core.impl.reports.cewolf.SumSaleByMonth"/>
		<cewolf:chart id="grafico2" title="(R$) Valor Total de Vendas" type="line" xaxislabel="Periodo"  yaxislabel="Valor Total de Vendas"> 
		     <cewolf:gradientpaint> 
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="sumSales" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico2" renderer="/cewolf" width="710" height="380"/>
 	 </tr>
	
</table>