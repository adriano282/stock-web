<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" uri="customtags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<c:import url="/sec/logout.jsp"></c:import>	

</head>
<body>

	<title>Criacao de Pedidos</title>
	
	<c:set var="resultado" value="${requestScope.resultado}"/>
	<c:set var="produtos" value="${resultado.getEntities()}"/>
	<c:set var="customers" value="${requestScope.clientes }"/>
	
	<H1>Criando Pedido</H1>
	<p><a href="/stock-web/sec/menu.jsp">Voltar ao Menu Principal</a></p>
	
	<ct:showMessages resultado="${resultado}"/>
	
	<c:if test="${requestScope.resultado.getEntityFiltered() != null}">
		<c:set var="produtoFiltro" value="${requestScope.resultado.getEntityFiltered()}"/>
	</c:if>
		
	<label style="font-size: medium;">Selecione um Cliente:</label>
					
	<select name="customer.id" id="customerId"	onchange="mostra(this);">	
		<option value="">Selecione</option>		
		<c:forEach var="c" items="${customers}">
			<option value="${c.getId()}">
				<c:out value="${c.getName()}"/>
			</option>
		</c:forEach>
	</select>
	
	<br><br>
	
	<p style="font-size: medium;"><strong>Insira a quantidade no produto desejado para cadastrar a venda:</strong></p>
	<table class="table-responsive" >
		<thead>
			<tr>
				<td align="center" style="width: 80px;"><strong>ID</strong></td>
				<td align="center" style="width: 250px;"><strong>Nome do Produto</strong></td>
				<td align="center" style="width: 150px;"><strong>Código</strong></td>		 
				<td align="center" style="width: 150px;"><strong>Codigo de Barras</strong></td>
				<td align="center" style="width: 150px;"><strong>Unidade de Medida</strong></td>
				<td align="center" style="width: 150px;"><strong>Marca</strong></td>
				<td align="center" style="width: 150px;"><strong>Preço</strong></td>
				<td align="center" style="width: 150px;"><strong>Quantidade</strong></td>
				<td align="center" style="width: 150px;"><strong>Açõees</strong></td>
			</tr>
			<tr>
				<form action="/stock-web/sec/Produto" method="get">
					<th>
						<div>
						<input  type="text" style="width: 80px;" name="txtId" value="${produtoFiltro.getId()}"/>
						</div>
					</th>
					<th>
						<div>
						<input type="text" style="width: 250px;" id="txtName" name="txtName" value="${produtoFiltro.getName()}" />
						</div>
					</th>
					<th>
						<div>
						<input type="text"	style="width: 150px;" id="txtCodigo"	name="txtCodigo" value="${produtoFiltro.getCode()}"/>
						</div>
					</th>
					<th>
						<div>
							<input type="text" style="width: 150px;" id="txtBarcode" name="txtBarcode" value="${produtoFiltro.getBarcode()}" />
						</div>
					</th>
					<th>

					<div >
						<select name="txtUnitMeasure" style="width: 150px;">
							<option value="">-</option>
							<option value="UN">UNIDADE</option>
				         	<option value="CX">CAIXA</option>
				         	<option value="SC">SACO</option>
				         	<option value="L">LITRO</option>
				         	<option value="M">METRO</option>
				         	<option value="KG">KILOGRAMA</option>
						</select>
						
						</div>
					</th>
					<th>
						<div>
							<input type="text" style="width: 150px;" id="txtMake"	name="txtMake" value="${produtoFiltro.getMake().getName()}"/>
						</div>
					</th>
					<th>
					</th>
					<th>
					</th>
					<th>
						
						<input type="hidden" name="operacao" value="consult"/>
						<input type="hidden" name="origin" value="orderCreate.jsp"/>
						<button type="submit" style="width: 150px;" class="btn btn-primary">Filtrar</button>
					</th>
				</form>
			</tr>

		</thead>
		<tbody style="border-style: 10;">
			<c:forEach var="produto" items="${produtos}">
				<tr>
					<td align="center">
						<c:out value="${produto.getId()}"/>
					</td>
					<td align="center">
						<c:out value="${produto.getName()}"/>
					</td>
					<td align="center">
						<c:out value="${produto.getCode()}"/>
					</td>
					<td align="center">
						<c:out value="${produto.getBarcode()}"/>
					</td>
					<td align="center">
						<c:out value="${produto.getUnitMeasure()}"/>
					</td>
					<td align="center">
						<c:out value="${produto.getMake().getName()}"/>
					</td>
					<td align="center">
						<fmt:setLocale value="pt-BR"/>
						<fmt:formatNumber value="${produto.getPrice()}" minFractionDigits="2" type="currency"/>
					</td>
					
					<form action="/stock-web/sec/Order" method="post">
						<td align="center" >		
							<input type="text" name="txtQuantity" ${produto.getQuantity() == 0? 'readonly=readonly value=\'Produto Zerado\'' :''}/>
						</td>
						<td align="center">	
						
							<c:if test="${produto.getQuantity() != 0}">
								<input type="hidden" name="origin" value="orderCreate.jsp">	
							<input type="hidden" name="customerID"> 
							<input type="hidden" name="product.id" value="${produto.getId()}">
							<button type="submit" name="operacao" id="operacao" class="btn btn-success" value="save">Comprar</button>
							</c:if>
							
						</td>
					</form>
				</tr>
			</c:forEach>			
			
			
		</tbody>

	</table>
	<c:set var="filters" value="Produto?txtId=${produtoFiltro.getId()}&txtName=${produtoFiltro.getName()}&
				txtCodigo=${produtoFiltro.getCode()}&txtBarcode=${produtoFiltro.getBarcode()}&
				txtUnitMeasure=${produtoFiltro.getUnitMeasure()}&txtMake=${produtoFiltro.getMake().getName()}&
				operacao=consult&origin=orderCreate.jsp"/>
			<ct:paginate currentPage="${requestScope.currentPage}" total="${resultado.getCountEntities()}" recordsPerPage="${requestScope.recordsPerPage}" params="${filters}"/>
</body>
		
<script type="text/javascript">

		function mostra(select)	{ 	
			
			var w = document.getElementById("customerId").value;
			var x = document.getElementsByName("customerID");
			
			for ( var i = 0; i < x.length; i++) {
				
				x[i].value = w;
				
			}
		}
		
</script>
</html>
