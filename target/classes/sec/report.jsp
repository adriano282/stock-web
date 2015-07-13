<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
	<head>
	
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	   	<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	   	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<c:import url="/sec/menu.jsp"></c:import>
				
	</head>
	<body>
		
		<title>Relatorios</title>

		<H1>Gráficos</H1>		
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active" id="tab_sales_cenary"> <a onclick="showSalesCenary()">Vendas</a></li>
		  <li role="presentation" id="tab_storage_cenary"><a onclick="showStorageCenary()" >Estoque</a></li>
		</ul>
		
		<div id="sales_cenary" style="display: block;">
			<c:import url="/sec/reports/salesCenary.jsp"></c:import>
		</div>
		
		<div id="storage_cenary" style="display: none;">
			<c:import url="/sec/reports/storageCenary.jsp"></c:import>
		</div>
</body>
	
<script>
		
	document.getElementById("charts").style.display ="none";
	
	function showSalesCenary() {
		
		document.getElementById("tab_storage_cenary").className = "";
		document.getElementById("tab_sales_cenary").className = "active";
	
		document.getElementById("sales_cenary").style.display = "block";
		document.getElementById("storage_cenary").style.display = "none";
			
	}
	
	function showStorageCenary() {
		
		document.getElementById("tab_storage_cenary").className = "active";
		document.getElementById("tab_sales_cenary").className = "";
	
		document.getElementById("sales_cenary").style.display = "none";
		document.getElementById("storage_cenary").style.display = "block";
			
	}
	
	
	function showProduct() {
		document.getElementById("cliente").className = "";
		document.getElementById("venda").className = "";
		document.getElementById("produto").className = "active";
	
		document.getElementById("products").style.display = "block";
		document.getElementById("customers").style.display = "none";
		document.getElementById("sales").style.display = "none";
	}
	
	function showCustomers() {
		document.getElementById("cliente").className = "active";
		document.getElementById("venda").className = "";
		document.getElementById("produto").className = "";
		document.getElementById("products").style.display = "none";
		document.getElementById("customers").style.display = "block";
		document.getElementById("sales").style.display = "none";
	}
	
	function showSales() {
		document.getElementById("cliente").className = "";
		document.getElementById("venda").className = "active";
		document.getElementById("produto").className = "";
		document.getElementById("products").style.display = "none";
		document.getElementById("customers").style.display = "none";
		document.getElementById("sales").style.display = "block";
	}


</script>


</html>

