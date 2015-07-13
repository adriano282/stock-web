<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" uri="customtags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<c:import url="/sec/menu.jsp"></c:import>
	
<head>
<style>
	th, td {
    	padding: 5px;
    	text-align: center;    
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de Produtos</title>
</head>
<body>
	
		
	<h3>Lista de Produtos Cadastrados</h3>

<p><a href="/stock-web/sec/produtoCadastro.jsp">Cadastrar Novo Produto</a></p>
<p><a href="/stock-web/sec/menu.jsp">Voltar ao Menu Principal</a></p>
	
	<c:set var="resultado" value="${requestScope.resultado}"/>
	
	
	<ct:showMessages resultado="${resultado}"/>
	
	<c:if test="${requestScope.resultado.getEntityFiltered() != null}">
		<c:set var="produtoFiltro" value="${requestScope.resultado.getEntityFiltered()}"/>
	</c:if>
	
	<div class="table-responsive">
	<table class="table">
		<thead>
		<tr>	
				<th style="width: 60px"><strong>ID</strong></th>
				<th style="width: 90px"><strong>Nome do Produto</strong></th>
				<th style="width: 90px"><strong>Código</strong></th>		 
				<th style="width: 90px"><strong>Codigo de Barras</strong></th>
				<th style="width: 80px"><strong>Unidade de Medida</strong></th>
				<th style="width: 100px"><strong>Marca</strong></th>
				<th ><strong>Estoque</strong></th>
				<th ><strong>Estoque Minimo</strong></th>
				<th ><strong>Venda Minima</strong></th>
				<th ><strong>Preço</strong></th>
				<th style="width: 100px"><strong>Data de Criação</strong></th>
				<th colspan="3"><strong>Açoes</strong></th>

			</tr>
			<form action="/stock-web/sec/Produto" method="get">
				<th>
					<div >
						<input type="text" id="txtId" name="txtId" style="width: 60px" value="${produtoFiltro.getId()}"/>
					</div>
				</th>
				<th>
					<div >
					<input type="text" id="txtName" style="width: 90px" name="txtName" value="${produtoFiltro.getName()}" />
					</div>
				</th>
				<th>
					<div >
					<input type="text" id="txtCodigo" style="width: 90px" name="txtCodigo" value="${produtoFiltro.getCode()}"/>
					</div>
				</th>
				<th>
					<div >
						<input type="text" id="txtBarcode" name="txtBarcode" style="width: 90px" value="${produtoFiltro.getBarcode()}" />
					</div>
				</th>
				<th>
				<div >
				
				
					<select name="txtUnitMeasure" style="width: 80px" >

						<option value="${produtoFiltro.getUnitMeasure()}">
							<c:if test="${produtoFiltro.getUnitMeasure().equals('UN')}">
								UNIDADE
							</c:if>
							<c:if test="${produtoFiltro.getUnitMeasure().equals('CX')}">
								CAIXA
							</c:if>
							<c:if test="${produtoFiltro.getUnitMeasure().equals('SC')}">
								SACO
							</c:if>
							<c:if test="${produtoFiltro.getUnitMeasure().equals('L')}">
								LITRO
							</c:if>
							<c:if test="${produtoFiltro.getUnitMeasure().equals('M')}">
								METRO
							</c:if>
							<c:if test="${produtoFiltro.getUnitMeasure().equals('KG')}">
								KILOGRAMA
							</c:if>							
						</option>
						<c:if test="${!produtoFiltro.getUnitMeasure().equals('UN')}">
							<option value="UN">UNIDADE</option>
						</c:if>
						<c:if test="${!produtoFiltro.getUnitMeasure().equals('CX')}">
							<option value="CX">CAIXA</option>
						</c:if>
						<c:if test="${!produtoFiltro.getUnitMeasure().equals('SC')}">
							<option value="SC">SACO</option>
						</c:if>
						<c:if test="${!produtoFiltro.getUnitMeasure().equals('L')}">
							<option value="L">LITRO</option>
						</c:if>
						<c:if test="${!produtoFiltro.getUnitMeasure().equals('M')}">
							<option value="M">METRO</option>
						</c:if>
						<c:if test="${!produtoFiltro.getUnitMeasure().equals('KG')}">
							<option value="KG">KILOGRAMA</option>
						</c:if>
					</select>
					
					</div>
				</th>
				<th>
					<div >
						<input type="text" id="txtMake"	name="txtMake" style="width: 100px" value="${produtoFiltro.getMake().getName()}"/>
					</div>
				</th>
				<th>
				</th>
				<th>
				</th>
				<th>
				</th>
				<th>
				</th>
				<th>
					<div>
						<input type="text" style="width: 100px"	 id="datepicker" name="txtDateCreated" style="width: 150px" onchange="return formatDate(this.value)" value="${produtoFiltro.getStringDate()}"/>
					</div>
				</th>
				<th>
					<input type="hidden" id="operacao" name="operacao" value="filter"/>
					<input type="hidden" name="origin" value="produtoList.jsp"/>
					<button type="submit" id="filter" onclick="alterOperation(this.id)" class="btn btn-primary">Filtrar</button>
				</th>
				<th>
					
				</th>
				<th>
					<button type="submit" id="export" onclick="alterOperation(this.id)" class="btn btn-success" >Exportar Listagem Exibida</button>
				</th>
			</form>
			
		</thead>
		<tbody>
				<c:forEach var="produto" items="${resultado.getEntities()}">
					<tr style="${produto.getQuantity() < produto.getQuantityMinimum()? 'color: red;':''}">
						<td>
							<c:out value="${produto.getId()}"/>
						</td>
						<td>
							<c:out value="${produto.getName()}"/>
						</td>
						<td>
							<c:out value="${produto.getCode()}"/>
						</td>
						<td>
							<c:out value="${produto.getBarcode()}"/>
						</td>
						<td>
							<c:out value="${produto.getUnitMeasure()}"/>
						</td>
						<td>
							<c:out value="${produto.getMake().getName()}"/>
						</td>
						<td>
							<c:out value="${produto.getQuantity()}"/>
						</td>
						<td>
							<c:out value="${produto.getQuantityMinimum()}"/>
						</td>
						<td>
							<c:out value="${produto.getQuantityMinimumSale()}"/>
						</td>
						<td>
							<fmt:setLocale value="pt-BR"/>
							<fmt:formatNumber value="${produto.getPrice()}" minFractionDigits="2" type="currency"/>
						</td>
						<td>
							<ct:formatdate calendar="${produto.getDtCreated()}"/>
						</td>
								
						<form action="/stock-web/sec/Produto" method="get">
							<td>
							<input type="hidden" name="id" value="${produto.getId()}">
							<input type="hidden" name="origin" value="produtoList.jsp"/>
							<button type="submit" name="operacao" id="operacao" value="consult" class="btn btn-primary">Editar</button>
							</td>
							<td>
							<button type="submit" name="operacao" id="operacao" value="delete" class="btn btn-danger" onclick="return confirm('Tem certeza que deseja excluir o produto selecionado?')">Excluir</button>
							</td>
							<td>
							<button class="btn btn-success" type="submit" name="operacao" id="operacao" value="process">Calcular Estoque Minimo</button>
							</td>
						</form>
						
											
					</tr>
				</c:forEach>
		
		</tbody>
		<tfoot>
						
			
		</tfoot>
</table>
	</div>
		<c:set var="filters" value="/stock-web/sec/Produto?txtId=${produtoFiltro.getId()}&txtName=${produtoFiltro.getName()}&
						txtCodigo=${produtoFiltro.getCode()}&txtBarcode=${produtoFiltro.getBarcode()}&
						txtUnitMeasure=${produtoFiltro.getUnitMeasure()}&txtMake=${produtoFiltro.getMake().getName()}&
						operacao=filter&origin=produtoList.jsp"/>
						
				<ct:paginate currentPage="${requestScope.currentPage }" total="${resultado.getCountEntities()}" recordsPerPage="${requestScope.recordsPerPage}" params="${filters}"/>
			
	
</body>

<script>

	document.getElementById("product_menu").style.display ="none";
	
	$(document).ready( function() {
		 
	  	$("#datepicker").datepicker({});
	  	
	});
	
	function alterOperation(value) {
		
		document.getElementById("operacao").value = value;
		
	}
		
	function formatDate(data) {
		
		document.getElementById("datepicker").value = data.substring(5,3) +"/" + data.substring(2,0) + "/" + data.substring(10,6);
	}
</script>
</html>