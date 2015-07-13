<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="customtags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	
  	<!--JQuery-->
  	<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
  	
    <c:import url="/sec/menu.jsp"></c:import>
	
</head>
<body>
		
	<ct:showMessages resultado="${resultado}"/>
	<title>Cadastro de Produto</title>
		
	<c:set var="resultado" value="${requestScope.resultado}"/>
	
	<c:choose>
		<c:when test="${resultado == null}">
			<jsp:useBean id="resultado" class="stock.core.application.Result"/>
		</c:when>	
		<c:otherwise>
		 	<c:set var="p" value="${resultado.getEntities().get(0)}"/>
		</c:otherwise>
	</c:choose>
	
	<form class="form-horizontal" action="/stock-web/sec/Produto" method="post">

		<fieldset>

			<!-- Form Name -->
			<legend>Cadastro de Produto</legend>
			
		    <input id="txtId" name="txtId" type="hidden" value="${p.getId()}">
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtName">Nome</label>
			  <div class="col-md-4">
			    <input id="txtName" name="txtName" placeholder="Descrição do Produto" class="form-control input-md" required="" value="${p.getName()}" type="text">
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtCodigo">Código</label>
			  <div class="col-md-2">
			    <input id="txtCodigo" name="txtCodigo" placeholder="Código" class="form-control input-md" required="" type="text" value="${p.getCode()}">
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtBarcode">Código de Barras</label>
			  <div class="col-md-2">
			    <input id="txtBarcode" name="txtBarcode" placeholder="Código de Barras" class="form-control input-md" required="" type="text" maxlength="13" value="${p.getBarcode()}">
			    
			  </div>
			</div>
			
			<!-- Select Basic -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtUnitMeasure">Unidade de Medida</label>
			  <div class="col-md-2">
			    <select id="txtUnitMeasure" name="txtUnitMeasure" class="form-control input-md">
			      	<option value="" > Selecione </option>
					<option value="UN" ${p.getUnitMeasure() == "UN"? "selected='true'":''} >UNIDADE</option>
					<option value="CX" ${p.getUnitMeasure() == "CX"? "selected='true'":''}>CAIXA</option>
					<option value="SC" ${p.getUnitMeasure() == "SC"? "selected='true'":''}>SACO</option>
					<option value="L" ${p.getUnitMeasure() == "L"? "selected='true'":''}>LITRO</option>
					<option value="M" ${p.getUnitMeasure() == "M"? "selected='true'":''}>METRO</option>
					<option value="KG" ${p.getUnitMeasure() == "KG"? "selected='true'":''}>KILOGRAMA</option>
			    </select>
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtMake">Marca</label>
			  <div class="col-md-2">
			    <input id="txtMake" name="txtMake" placeholder="Nome da Marca" class="form-control input-md" required="" type="text" value="${p.getMake().getName()}">
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtQuantity">Quantidade</label>
			  <div class="col-md-2">
			    <input id="txtQuantity" name="txtQuantity" placeholder="Quantidade" class="form-control input-md" required="" type="text" onkeypress="return onlyNumber(event)" value="${p.getQuantity()}">
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtQtdeMin">Quantidade Mínima</label>
			  <div class="col-md-2">
			    <input id="txtQtdeMin" name="txtQtdeMin" placeholder="Quantidade Mínima de Estoque" class="form-control input-md" required="" type="text" onkeypress="return onlyNumber(event)" value="${p.getQuantityMinimum()}" >
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtMaxQuantity">Quantidade Máxima</label>
			  <div class="col-md-2">
			   <input id="txtMaxQuantity" name="txtMaxQuantity" placeholder="Quantidade Máxima de Estoque" class="form-control input-md" required="" type="text" onkeypress="return onlyNumber(event)" value="${p.getMaxQuantity()}">
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtQuantityMinimumSale">Conteúdo</label>
			  <div class="col-md-2">
			    <input id="txtQuantityMinimumSale" name="txtQuantityMinimumSale" placeholder="Conteúdo" class="form-control input-md" required="" type="text" onkeypress="return onlyNumber(event)" value="${p.getQuantityMinimumSale()}"
			    title="Digite a quantidade mínima para uma venda.">
			  </div>
			</div>
			
			
			<!-- Prepended text-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtPrice">Preço Unitário</label>
			  <div class="col-md-2">
			    <div class="input-group">
			      <span class="input-group-addon">R$</span>
			      <input id="txtPrice" name="txtPrice" class="form-control" placeholder="Preço" required="" type="text" value="${p.getPrice()}"
			      title="Digite o preço unitário referente ao conteúdo de uma única venda.">
			    </div>
			  </div>
			</div>
			
			
			<input type="hidden" name="timeCoverId" value="${p.getTimeCover().getId() }"/>
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtDaysToOrder">Dias P/Solicitar</label>
			  <div class="col-md-4">
			    <input id="txtDaysToOrder" name="txtDaysToOrder" class="form-control input-md" placeholder="Quantidade de Dias para Solicitar" required="" type="text" onkeypress="return onlyNumber(event)" value="${p.getTimeCover().getDaysToOrder()}"
			    title="Quantidade de dias necessário para levantar o que precisa ser solicitado ao fornecedor para reposição de estoque.">
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtDaysToDelivery">Dias P/Entrega</label>
			  <div class="col-md-4">
			    <input id="txtDaysToDelivery" name="txtDaysToDelivery" class="form-control input-md" placeholder="Quantidade de Dias para Entrega" required="" type="text" onkeypress="return onlyNumber(event)" value="${p.getTimeCover().getDaysToDelivery()}"
			    title="Quantidade de dias que o fornecedor levará para entregar o pedido de reposição de estoque.">
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtDaysToConference">Dias P/Conferência</label>
			  <div class="col-md-4">
			    <input id="txtDaysToConference" name="txtDaysToConference"  class="form-control input-md" required="" placeholder="Quantidade de Dias para Conferência" type="text" onkeypress="return onlyNumber(event)" value="${p.getTimeCover().getDaysToConference()}"
			    title="Quantidade de dias necessário para realizar conferência dos produtos entregue pelo fornecedor.">
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtDaysMarginSecurity">Margem de Segurança</label>
			  <div class="col-md-4">
			    <input id="txtDaysMarginSecurity" name="txtDaysMarginSecurity"  class="form-control input-md" placeholder="Margem de Segurança" required="" type="text" onkeypress="return onlyNumber(event)" value="${p.getTimeCover().getDaysMarginSecurity()}"
			    title="Quantidade de dias de margem de segurança para caso de imprevistos aconteçam.">
			  </div>
			</div>
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="operacao"></label>
			  <div class="col-md-4">
			    <c:if test="${p.getId() != null}">
					<button type="submit" name="operacao" id="operacao" value="update" class="btn btn-primary">Editar</button>
					<button type="submit" name="operacao" id="operacao" value="delete" class="btn btn-danger">Excluir</button>
					<a href="/stock-web/sec/Produto">Voltar</a>
				</c:if>
				<c:if test="${p.getId() == null}">
					<button type="submit" name="operacao" id="operacao" value="save" class="btn btn-primary">Salvar</button>
					<a href="/stock-web/sec/Produto">Voltar</a>
				</c:if>
			  </div>
			</div>
		
		</fieldset>
	</form>
</body>

<script type="text/javascript">
	
$("#txtPrice").maskMoney({allowNegative: false, thousands:',', decimal:'.', affixesStay: false});
	
	
	document.getElementById("product_menu").style.display ="none";
	function onlyNumber(event) {
		if (event.keyCode == 8 || event.keyCode == 46 || event.keyCode == 9
				 || event.keyCode == 37 || event.keyCode == 39) {
				    return true;
		}
		else if (event.charCode > 47 && event.charCode < 58) {
			return true;
		} else {
			return false;
		} 
		
	}
</script>
</html>
