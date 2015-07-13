<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br>
		<H3>Cenário das Vendas</H3>
		
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active" id="venda"> <a onclick="showSales()">Vendas - Geral</a></li>
		  <li role="presentation" id="cliente"><a onclick="showCustomers()" >Clientes</a></li>
		  <li role="presentation" id="produto"><a onclick="showProduct()">Produtos</a></li>
		</ul>
		
		<div id="sales" style="display: block;">
			<c:import url="/sec/reports/salesGeneral.jsp"></c:import>
		</div>
		
		<div id="customers" style="display: none;">
			<c:import url="/sec/reports/customersByMonth.jsp"></c:import>
		</div>
		<div id="products" style="display: none;">
			<c:import url="/sec/reports/bestSellersProduct.jsp"></c:import>
			
		</div>