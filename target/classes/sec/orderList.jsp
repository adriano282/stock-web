<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" uri="customtags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
      <script src="//code.jquery.com/jquery-1.10.2.js"></script>
      <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
           
      
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vendas</title>
</head>
<body>

	<c:import url="/sec/menu.jsp"></c:import>
	<H3>Vendas</H3>
	<p><a href="/stock-web/sec/Order?operacao=save&origin=orderList.jsp">Cadastrar uma Nova Venda</a></p>
	<p><a href="/stock-web/sec/menu.jsp">Voltar ao Menu Principal</a></p>
	
	
	<c:set var="resultado" value="${requestScope.resultado}"/>
	<ct:showMessages resultado="${resultado}"/>
		
	<c:if test="${requestScope.resultado.getEntityFiltered() != null}">
		<c:set var="orderFiltro" value="${requestScope.resultado.getEntityFiltered()}"/>
	</c:if>
	
	<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>			
				<td align="center" style="width: 60px"><strong>ID</strong></td>
				<td align="center" ><strong>Quantidade</strong></td>
				<td align="center"><strong>Valor Total</strong></td>
				<td align="center" style="width: 150px"><strong>Codigo do Produto</strong></td>
				<td align="center" style="width: 200px"><strong>Produto</strong></td>
				<td align="center" style="width: 150px"><strong>Documento do Cliente</strong></td>
				<td align="center" style="width: 150px"><strong>Cliente</strong></td>
				<td align="center" style="width: 150px"><strong>Data Venda</strong></td>
				<td align="center"><strong>Acoes</strong></td>
			</tr>
		<form action="/stock-web/sec/Order" method="get">
				<th>
					<div>
						<input type="text" name="txtId" style="width: 60px" value="${orderFiltro.getId()}"/>
					</div>
				</th>
				<th>
					<div>
						
					</div>
				</th>
				<th>
					<div>
						
					</div>
				</th>
				<th>
					<div>
						<input type="text" id="txtCode" name="txtCode" style="width: 150px" value="${orderFiltro.getProduct().getCode()}" />
					</div>
				</th>
				<th>
					<div>
					<input type="text"	 id="txtNameProduct"	name="txtNameProduct" style="width: 200px" value="${orderFiltro.getProduct().getName()}"/>
					</div>
				</th>
				<th>
					<div>
						<input type="text"	 id="txtDocument"	name="txtDocument" style="width: 150px" value="${orderFiltro.getCustomer().getDocument()}"/>
					</div>
				</th>
				<th>
					<div>
						<input type="text"	 id="txtNameCustomer"	name="txtNameCustomer" style="width: 150px" value="${orderFiltro.getCustomer().getName()}"/>
					</div>
				</th>
				<th>
					<div>
						
						<input type="text"	 id="datepicker" name="txtDateCreated" style="width: 150px" onchange="return formatDate(this.value)" value="${orderFiltro.getDtCreated() != null? orderFiltro.getStringDate():''}"/>
					</div>
				</th>
				<td align="center">
					<input type="hidden" name="operacao" value="consult"/>
					<input type="hidden" name="origin" value="produtoList.jsp"/>
					<button type="submit"  class="btn btn-primary">Filtrar</button>
				</th>
			</form>
		</thead>
		<tbody>
		<c:forEach var="order" items="${resultado.getEntities()}">
			<tr>
				<td align="center"><c:out value="${order.getId()}"></c:out></td>
				<td align="center"><c:out value="${order.getQuantity()}"></c:out></td>
				<td align="center">
					<fmt:setLocale value="pt-BR"/>
					<fmt:formatNumber value="${order.getSubTotal()}" minFractionDigits="2" type="currency"/>
				</td>
				<td align="center"><c:out value="${order.getProduct().getCode()}"></c:out></td>
				<td align="center"><c:out value="${order.getProduct().getName()}"></c:out></td>
				<td align="center"><c:out value="${order.getCustomer().getDocument()}"></c:out></td>
				<td align="center"><c:out value="${order.getCustomer().getName()}"></c:out></td>
				<td align="center">
					<ct:formatdate calendar="${order.getDtCreated()}"/>
				</td>
				<td align="center">
					<form action="/stock-web/sec/Order" method="get">
						<input type="hidden" name="id" value="${order.getId()}">
						<input type="hidden" name="origin" value="orderList"/>
						<button type="submit" name="operacao" id="operacao" value="delete" class="btn btn-danger" onclick="return confirm('Tem certeza que deseja excluir a venda selecionada?')">Excluir</button>
					</form> 
				</td>
			</tr>
		</c:forEach>
		
		</tbody>
	</table>
	</div>
		<c:set var="filters" value="/stock-web/sec/Order?txtId=${orderFiltro.getId()}&txtCode=${orderFiltro.getProduct().getCode()}&
			txtNameProduct=${orderFiltro.getProduct().getName()}&txtDocument=${orderFiltro.getCustomer().getDocument()}&
			txtNameCustomer=${orderFiltro.getCustomer().getName()}&txtDateCreated=${orderFiltro.getStringDate()}&operacao=consult"/>
			
		<ct:paginate currentPage="${requestScope.currentPage}" total="${resultado.getCountEntities()}" recordsPerPage="${requestScope.recordsPerPage}" params="${filters}"/>
	
</body>

<script>
	
	document.getElementById("order_menu").style.display="none";
	$(document).ready( function() {
		 
	  	$("#datepicker").datepicker({});
	  	
	});
	
	function formatDate(data) {
		
		document.getElementById("datepicker").value = data.substring(5,3) +"/" + data.substring(2,0) + "/" + data.substring(10,6);
	}
</script>
</html>