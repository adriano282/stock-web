

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table">

			<tr>			
				<td align="center" style="width: 150px"><strong>Cliente</strong></td>
				<td align="center" style="width: 150px"><strong>Data Ínicio</strong></td>
				<td align="center" style="width: 150px"><strong>Data Fim</strong></td>
				<td align="center"></td>
			</tr>
		<form action="/stock-web/sec/Report" method="get">
				<th>
					<div>
						<input type="text"	 id="txtTypeCustomer"	name="txtNameCustomer" style="width: 150px" value="${orderFiltro.getCustomer().getName()}"/>
					</div>
				</th>
				<th>
					<div>
						
						<input type="text"	 id="datepickerBegin" name="txtDateCreated" style="width: 150px" onchange="return formatDate(this.value, this.id)" value="${orderFiltro.getDtCreated() != null? orderFiltro.getStringDate():''}"/>
					</div>
				</th>
				
				<th>
					<div>
						
						<input type="text"	 id="datepickerEnd" name="txtDateCreated" style="width: 150px" onchange="return formatDate(this.value, this.id)" value="${orderFiltro.getDtCreated() != null? orderFiltro.getStringDate():''}"/>
					</div>
				</th>
				<th align="center">
					<input type="hidden" name="operacao" value="consult"/>
					<input type="hidden" name="origin" value="produtoList.jsp"/>
					<button type="submit"  class="btn btn-primary">Filtrar</button>
				</th>
			</form>

</table>
		
<figure>
		
	<c:url value="../Vendas.png" var="imagem"/>
	<img src="${imagem}"class="img-rounded" width="636" height="900"/>
				 				
</figure>
				
<%String source = ".."+request.getContextPath()+"/Vendas.png" ;%>

