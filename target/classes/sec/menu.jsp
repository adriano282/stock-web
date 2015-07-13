<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<script src="/stock-web/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="/stock-web/css/bootstrap.min.css">
	<link rel="stylesheet" href="/stock-web/css/bootstrap-theme.min.css">
	<script src="/stock-web/js/bootstrap.min.js"></script>
		
	<!--  datepick -->
	<link rel="stylesheet" href="/stock-web/css/jquery-ui.css">
  	<script src="/stock-web/js/jquery-1.10.2.js"></script>
  	<script src="/stock-web/js/jquery-ui.js"></script>	
	
	<script src="/stock-web/js/jquery.maskMoney.js"></script>
	<script src="/stock-web/js/jquery.maskMoney.min.js"></script>
	
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu Principal</title>
</head>
<body>
	<c:import url="/sec/logout.jsp"></c:import>
    
<h1>Menu Principal</h1>
<a href="/stock-web/sec/Cliente">
	<button type="button" class="btn btn-default" id="client_menu">
  		<span class="glyphicon glyphicon-user" aria-hidden="true"></span> Clientes
	</button>
</a>


<a href="/stock-web/sec/Produto">
	<button type="button" class="btn btn-default" id="product_menu">
  		<span class="glyphicon glyphicon-list" aria-hidden="true"></span> Produtos
	</button>
</a>
<a href="/stock-web/sec/Order">
	<button type="button" class="btn btn-default" id="order_menu">
  		<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Vendas
	</button>
</a>

<c:if test="${sessionScope.user.getRoot()}">
<a href="/stock-web/sec/User">
	<button type="button" class="btn btn-default" id="user_menu">
  		<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Usuários do Sistema
	</button>
</a>
</c:if>

<a href="/stock-web/sec/report.jsp">
	<button type="button" class="btn btn-default" id="charts">
  		<span class="glyphicon glyphicon-signal" aria-hidden="true"></span> Gráficos
	</button>
</a>
<br>
<br>
</body>
</html>