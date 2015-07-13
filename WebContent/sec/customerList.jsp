<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="customtags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	
	
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<c:import url="/sec/menu.jsp"></c:import>	
	
</head>
<body>	
	
	<title>Clientes Cadastrados</title>
	
	<h3>Lista de Clientes Cadastrados</h3>
	
	<p><a href="/stock-web/sec/customerCadastro.jsp">Cadastrar Novo Usuário</a></p>
	<p><a href="/stock-web/sec/menu.jsp">Voltar ao Menu Principal</a></p>
	
	<c:set var="result" value="${requestScope.resultado}"/>
	<c:set var="clienteFiltro" value="${result.getEntityFiltered()}"/>
	
	<ct:showMessages resultado="${result}"/>

	<div class="table-responsive">
		<table class="table">
	
			<thead>
				<tr>
					<td align="center" style="width: 20px"><strong>ID</strong></td>
					<td align="center" style="width: 250px"><strong>Nome</strong></td>
					<td align="center" style="width: 150px"><strong>Documento</strong></td>
					<td align="center" style="width: 150px"><strong>Telefone</strong></td>
					<td align="center" style="width: 250px"><strong>Email</strong></td>
					<td align="center" style="width: 60px"><strong>Tipo</strong></td>
					<td></td>
				</tr>
				<tr>
					<form action="/stock-web/sec/Cliente" method="get">
						<th>
							<div>
								<input type="text" name="txtId" style="width: 60px" value="${clienteFiltro.getId()}"/>
							</div>
						</th>
						<th>
							<div>
								<input type="text" name="txtName" style="width: 250px" value="${clienteFiltro.getName()}"/>
							</div>
						</th>
						<th>
							<div>
								<input type="text" name="txtDocument" style="width: 150px" value="${clienteFiltro.getDocument()}"/>
							</div>
						</th>
						<th>
							<div>
								<input type="text" name="txtPhone" style="width: 150px" value="${clienteFiltro.getPhone()}"/>
							</div>
						</th>
						<th>
							<div>
								<input type="text" name="txtEmail" style="width: 250px" value="${clienteFiltro.getEmail()}"/>
							</div>
						</th>
						<th>
							<div>
								<input type="text" name="txtType" style="width: 60px"value="${clienteFiltro.getType()}"/>
							</div>
						</th>
						<th>
							<div>
								<input type="hidden" name="operacao" value="filter"/>
								<button type="submit" class="btn btn-primary">Filtrar</button>
							</div>
						</th>
					</form>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${result.getEntities()}">
					<tr>
						<td align="center"><c:out value="${customer.getId()}"/></td>
						<td align="center"><c:out value="${customer.getName()}"/></td>	
						<td align="center"><c:out value="${customer.getDocument()}"/></td>
						<td align="center"><c:out value="${customer.getPhone()}"/></td>
						<td align="center"><c:out value="${customer.getEmail()}"/></td>
						<td align="center"><c:out value="${customer.getType()}"/></td>
						<td>
							<form action="/stock-web/sec/Cliente" method="get">	
								<input type="hidden" name="origin" value="customerList">			
								<input type="hidden" name="txtId" value="${customer.getId()}">
								<button type="submit" name="operacao" id="operacao" value="consult" class="btn btn-primary">Editar</button>
								<button type="submit" name="operacao" id="operacao" value="delete" onclick="return confirm('Tem certeza que deseja excluir o cadastro selecionado?')" class="btn btn-danger">Excluir</button>
							</form>
						</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>

	<c:set var="filters" value="/stock-web/sec/Cliente?txtId=${clienteFiltro.getId()}&txtName=${clienteFiltro.getName()}&
			txtDocument=${clienteFiltro.getDocument()}&txtPhone=${clienteFiltro.getPhone()}&
			txtEmail=${clienteFiltro.getEmail()}&txtType=${clienteFiltro.getType()}&operacao=consult"/>

	<ct:paginate currentPage="${requestScope.currentPage}" total="${resultado.getCountEntities()}" recordsPerPage="${recordsPerPage}" params="${filters}"/>
</body>
<script>

	document.getElementById("client_menu").style.display="none";
	$(document).ready( function() {
		 
	  	$("#datepicker").datepicker({});
	  	
	});
	
	function formatDate(data) {
		
		document.getElementById("datepicker").value = data.substring(5,3) +"/" + data.substring(2,0) + "/" + data.substring(10,6);
	}
</script>
</html>