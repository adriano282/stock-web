<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@ page import="java.awt.Color" %>

<table>
	<tr>
		<jsp:useBean id="pageViews" class="stock.core.impl.reports.cewolf.CountCustomerByMonth"/>
		<!-- GRÁFICO LINHAS E COLUNA --> 
		 <cewolf:chart id="grafico1" title="Cadastros por Mês" type="line"  xaxislabel="Periodo"  yaxislabel="Qtde Cadastros"> 
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
		<jsp:useBean id="salesCustomer" class="stock.core.impl.reports.cewolf.CountQtdSaleSCustomer"/>
		<!-- GRÁFICO LINHAS E COLUNA --> 
		 <cewolf:chart id="grafico1" title="Clientes que Realizaram Compra" type="verticalbar3d" xaxislabel="Quantidades de Compras"  yaxislabel="Qtde Clientes"> 
		     <cewolf:gradientpaint>
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="salesCustomer" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico1" renderer="/cewolf" width="710" height="380"/> 
	</tr>
	<tr>
		<jsp:useBean id="salesTypeCustomer" class="stock.core.impl.reports.cewolf.CountSaleByTypeCustomer"/>
		<!-- GRÁFICO LINHAS E COLUNA --> 
		 <cewolf:chart id="grafico1" title="(%) Vendas Por Tipo de CLiente" type="pie" xaxislabel="Quantidade de Vendas"  yaxislabel="Tipo de Cliente"> 
		     <cewolf:gradientpaint> 
		         <cewolf:point x="0" y="0" color="#FBFBFB" /> 
		         <cewolf:point x="350" y="0" color="#F3F3F3" /> 
		     </cewolf:gradientpaint> 
		     <cewolf:data> 
		         <cewolf:producer id="salesTypeCustomer" /> 
		        </cewolf:data> 
		 </cewolf:chart> 
		 <cewolf:img chartid="grafico1" renderer="/cewolf" width="710" height="380"/> 
	</tr>
</table>