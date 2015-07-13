<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" uri="customtags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<c:import url="/sec/menu.jsp"></c:import>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Listagem de Usuarios</title>
	</head>
	
	<body>
		<h3>Lista de Usuários Cadastrados</h3>
		
		<p><a href="/stock-web/sec/userCadastro.jsp">Cadastrar Novo Usuario</a></p>
		<p><a href="/stock-web/sec/menu.jsp">Voltar ao Menu Principal</a></p>
		
		<c:set var="resultado" value="${requestScope.resultado}"/>
			
		<ct:showMessages resultado="${resultado}"/>
			
		<c:if test="${requestScope.resultado.getEntityFiltered() != null}">
		
			<c:set var="userFiltro" value="${requestScope.resultado.getEntityFiltered()}"/>
			
		</c:if>
			
		<div class="table-responsive">
			<table class="table">
		
			<thead>
			
				<form action="/stock-web/sec/User" method="get">
					<tr>
						<td style="width: 150px"><strong>ID</strong></td>
						<td style="width: 150px"><strong>Email do Usuario</strong></td>
						<td style="width: 150px"><strong>Root</strong></td>
						<td style="width: 150px"><strong>Recebe Emails</strong></td>
						<td style="width: 150px"><strong>Data de Criacao</strong></td>
						<td style="width: 150px"></td>
					</tr>				
					<tr>
						<th>
							<div>
								<input type="text" style="width: 150px" name="id" value="${userFiltro.getId()}"/>
							</div>
						</th>
						<th>
							<div>
							<input type="text" style="width: 150px" id="txtUsername" name="txtUsername" value="${userFiltro.getUsername()}" />
							</div>
						</th>
						<th>
							<div></div>
						</th>
						<th>
							<div></div>
							
						</th>
						
						<th>
							<div>
							<input type="text" id="datepicker" style="width: 150px" onchange="return formatDate(this.value)" name="txtDtCreated" value="${userFiltro.getStringDate()}" />
							</div>
						</th>
						<th>
							<input type="hidden" name="operacao" value="filter"/>
							<input type="hidden" name="origin" value="userList.jsp"/>
							<button type="submit" class="btn btn-primary">Filtrar</button>
						</th>
					</tr>
				</form>

			</thead>
			
			<c:forEach var="user" items="${resultado.getEntities()}">
				<tr>
					<td>
						<c:out value="${user.getId()}"/>
					</td>
					<td>
						<c:out value="${user.getUsername()}"/>
					</td>
					<td>
						<c:out value="${user.getRoot()? 'Sim':'Não'}"/>
					</td>
					<td>
						<c:out value="${user.getAbleEmail()? 'Sim':'Não'}"/>
					</td>
					<td>
						<ct:formatdate calendar="${user.getDtCreated()}"/>
												
					</td>
					
					<form action="/stock-web/sec/User" method="get">
						<td>	
							<input type="hidden" name="id" value="${user.getId()}">
							<input type="hidden" name="origin" value="userList.jsp"/>
							<button type="submit" name="operacao" id="operacao" value="consult" class="btn btn-primary">Editar</button>
						
							<button type="submit" name="operacao" id="operacao" value="delete" class="btn btn-danger">Delete</button>
						</td>
					</form>
					
										
				</tr>
				
			</c:forEach>
			
			
			
		</table>
		</div>
		<c:set var="filters" value="/stock-web/sec/User?txtId=${userFiltro.getId()}&txtUsername=${userFiltro.getUsername()}&txtRoot=${userFiltro.getRoot()}
				&txtAbleEmail=${userFiltro.getAbleEmail()}&txtDtCreated=${userFiltro.getDtCreated()}&operacao=consult&origin=userList.jsp"/>
				
		<ct:paginate currentPage="${requestScope.currentPage }" total="${resultado.getCountEntities()}" recordsPerPage="${requestScope.recordsPerPage}" params="${filters}"/>
	</body>
<script>

	document.getElementById("user_menu").style.display="none";
	$(document).ready( function() {		
		
	  	$("#datepicker").datepicker({});
	  	
	});
	
	function formatDate(data) {
		
		document.getElementById("datepicker").value = data.substring(5,3) +"/" + data.substring(2,0) + "/" + data.substring(10,6);
	}
</script>
</html>