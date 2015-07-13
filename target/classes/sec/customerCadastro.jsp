<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="customtags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<c:import url="/sec/menu.jsp"></c:import>
	
</head>
<body>
	
	<title>Cadastro de Clientes</title>

	<c:set var="resultado" value="${requestScope.resultado}"/>
	<c:set var="customer" value="${requestScope.cliente}"/>
	<c:set var="operacao" value="${requestScope.operacao}"/>
	<ct:showMessages resultado="${resultado}"/>
		
	<form class="form-horizontal" method="post" action="/stock-web/sec/Cliente">
		<fieldset>
		
			<!-- Form Name -->
			<legend>Cadastro de Cliente</legend>
			<input id="customer.id" type="hidden" name="customer.id" value="${customer.getId()}">
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="customer.name">Nome</label>  
			  <div class="col-md-4">
				  <input id="customer.name" name="customer.name" placeholder="Nome do cliente." class="form-control input-md" 
				  required="Digite o nome do cliente." type="text" value="${customer.getName()}">
			  </div>
			</div>
			
			<!-- Multiple Radios (inline) -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="rdType">Pessoa</label>
			  <div class="col-md-4"> 
			    <input name="rdType" id="rdType" value="PF" checked="checked" type="radio" onclick="showDocument(this.value)" ${customer.getType() == 'PF' ? 'checked=checked':'' }>Física
			    <input name="rdType" id="rdType" value="PJ" type="radio" onclick="showDocument(this.value)" ${customer.getType() == 'PJ' ? 'checked=checked':'' }>Jurídica
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" id="lblDocument" for="document">Documento</label>  
			  <div class="col-md-2">
		  		<div id="pfcustomer" style="display: none;">
					<input type="text" id="cpf" name="customer.cpf" class="form-control input-md" maxlength="14" placeholder="Digite o CPF do cliente." onkeypress="javascript: mascara(this, cpf_mask);" value="${customer.getDocument() != null? customer.getDocument():'' }"/>
				</div>
				<div id="pjcustomer" style="display: none;">
					<input type="text" id="cnpj" name="customer.cnpj" class="form-control input-md" maxlength="18" onkeypress="javascript: mascara(this, cnpf_mask);" placeholder="Digite o CNPJ do cliente." value="${customer.getDocument() != null? customer.getDocument():'' }"/>
				</div>
			 </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="customer.phone">Telefone</label>  
			  <div class="col-md-2">
				  <input id="customer.phone" name="customer.phone" maxlength="14" placeholder="(11)99999-9999" 
				  class="form-control input-md" required="" onkeypress="javascript: mascara(this, phone_mask);" type="text"
				  value="${customer.getPhone() != null? customer.getPhone():''}">
			  </div>
			</div>
			
			<!-- Prepended text-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="customer.email">E-mail</label>
			  <div class="col-md-4">
			    <div class="input-group">
			      <span class="input-group-addon">@</span>
			      <input id="customer.email" name="customer.email" class="form-control" 
			      placeholder="example@example.com" required="Digite o email do cliente." type="text" value="${customer.getEmail() != null? customer.getEmail():'' }">
			    </div>
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="zipcode">CEP</label>  
			  <div class="col-md-2">
			  <input id="zipcode" name="customer.zipcode" placeholder="CEP" class="form-control input-md" required="Digite o cep." type="text" maxlength="8" 
			  value="${customer.getAddress().getZipCode() != null? customer.getAddress().getZipCode():'' }">
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="street">Rua</label>  
			  <div class="col-md-2">
			  <input id="street" name="customer.street" placeholder="Rua" class="form-control input-md" 
			  required="" type="text" readonly="readonly" value="${customer.getAddress().getStreet() != null? customer.getAddress().getStreet():'' }">
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="number">Número</label>  
			  <div class="col-md-2">
			  <input id="number" name="customer.number" placeholder="Número" class="form-control input-md" 
			  required="" type="text" value="${customer.getAddress().getNumber() != null? customer.getAddress().getNumber():'' }">
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="quarter">Bairro</label>  
			  <div class="col-md-2">
			  <input id="quarter" name="customer.quarter" placeholder="Bairro" 
			  class="form-control input-md" required="" type="text" readonly="readonly" value="${customer.getAddress().getQuarter() != null? customer.getAddress().getQuarter():'' }">
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="city">Cidade</label>  
			  <div class="col-md-2">
			  <input id="city" name="customer.city" placeholder="Cidade" class="form-control input-md" required="" type="text"
			  readonly="readonly" value="${customer.getAddress().getCity() != null? customer.getAddress().getCity():'' }">
			    
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="state">Estado</label>  
			  <div class="col-md-2">
			  <input id="state" name="customer.state" placeholder="Estado" 
			  class="form-control input-md" required="" type="text" readonly="readonly" value="${customer.getAddress().getState() != null? customer.getAddress().getState():'' }">
			    
			  </div>
			</div>
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="operacao"></label>
			  <div class="col-md-4">
			    <input type="hidden" name="origin" value="customerCadastro.jsp"/>
					<c:if test="${customer.getId() != null }">
						<button type="submit" name="operacao" id="operacao" class="btn btn-primary" value="update">Editar</button>
					</c:if>
					<c:if test="${customer.getId() == null }">
						<button type="submit" name="operacao" id="operacao" class="btn btn-primary" value="save">Salvar</button>
					</c:if>
					<a href="/stock-web/sec/Cliente">Voltar</a>
			  </div>
			</div>
		
		</fieldset>
	</form>
</body>
<script>
	
	document.getElementById("client_menu").style.display="none";
	$(document).ready(function() {
		
		var radios = document.getElementsByName("rdType");
				
		if (radios[0].checked == true) {
			
			document.getElementById("pfcustomer").style.display = "block";
			document.getElementById("pjcustomer").style.display = "none";
			document.getElementById("lblDocument").innerHTML = "CPF";
			
		} else if (radios[1].checked == true) {
			
			document.getElementById("pfcustomer").style.display = "none";
			document.getElementById("pjcustomer").style.display = "block";
			document.getElementById("lblDocument").innerHTML = "CNPJ";
			
		} else {
			
			radios[0].checked = true;
			document.getElementById("pfcustomer").style.display = "block";
			document.getElementById("pjcustomer").style.display = "none";document.getElementById("pfcustomer").style.display = "block";
			document.getElementById("lblDocument").innerHTML = "CPF";
			
		}
		function clear_form_cep() {
			// Clear the fields of the form of cep
			
			$("#zipcode").val("");
			$("#street").val("");
			$("#quarter").val("");
			$("#city").val("");
			$("#state").val("");
		}
		
		$("#zipcode").blur(function() {
						
			var zipcode = $(this).val().replace(/\D/g, '');
			
			if (zipcode != "") {
				
				var validateZipcode = /^[0-9]{8}$/;
				
				if (validateZipcode.test(zipcode)) {
					
					$("#street").val("...");
					$("#quarter").val("...");
					$("#city").val("...");
					$("#state").val("...");
					
					$.getJSON("//viacep.com.br/ws/" + zipcode+"/json/?callback=?", function(dados) {
						
						if (!("erro" in dados)) {
							
							$("#street").val(dados.logradouro);
							$("#quarter").val(dados.bairro);
							$("#city").val(dados.localidade);
							$("#state").val(dados.uf);
							
						} else {
							
							clear_form_cep();
							alert("CEP não encontrado.");
						}
						
					});
					function phone_mask(v) {
						v=v.replace(/\D/g,"")                 //Remove tudo o que não é dígito
						v=v.replace(/(\d{0})(\d)/,"$1($2")    
						v=v.replace(/(\d{2})(\d)/,"$1)$2")    
						v=v.replace(/(\d{4})(\d)/,"$1-$2")    
						return v
					}
					
				} else {
					
					clear_form_cep();
					alert("Formato de cep inválido.");
					
				}
			}
		});
		
		
		$("#cnpj").blur(function() {
			
			var document = $(this).val();
			
			if ( document.length > 0 && document.length < 18) {
				
				alert("Documento CNPJ inválido.");
				$(this).val("");
			}
		});
		
		$("#cpf").blur(function() {
			
			var document = $(this).val();
			
			if (document.length > 0 && document.length < 14) {
				
				alert("Documento CPF inválido.");
				$(this).val("");
				
			}
		});	
		
		$("#customer.phone").blur(function() {
			
			var document = $(this).val();
			
			if (document.length > 0 && document.length < 13) {
				
				alert("Número para contado inválido.");
				$(this).val("");
				
			}
		});
				
	});
	
	function showDocument(value) {
		
		var radios = document.getElementsByName("rdType");
		if (radios[0].checked == true) {
			
			document.getElementById("pfcustomer").style.display = "block";
			document.getElementById("pjcustomer").style.display = "none";
			document.getElementById("cpf").value = "";
			document.getElementById("lblDocument").innerHTML = "CPF";
			
		} else {
			
			document.getElementById("pfcustomer").style.display = "none";
			document.getElementById("pjcustomer").style.display = "block";
			document.getElementById("cnpj").value = "";
			document.getElementById("lblDocument").innerHTML = "CNPJ";
		}
	}
	
	/**
	   * MASCARA ( mascara(o,f) e execmascara() ) CRIADAS POR ELCIO LUIZ
	   * elcio.com.br
	   */
	function mascara(o,f){
		v_obj=o
		v_fun=f
		setTimeout("execmascara()",1)
	}

	function execmascara(){
		v_obj.value=v_fun(v_obj.value)
	}

	function cpf_mask(v){
		v=v.replace(/\D/g,"")                 //Remove tudo o que não é dígito
		v=v.replace(/(\d{3})(\d)/,"$1.$2")    //Coloca ponto entre o terceiro e o quarto dígitos
		v=v.replace(/(\d{3})(\d)/,"$1.$2")    //Coloca ponto entre o setimo e o oitava dígitos
		v=v.replace(/(\d{3})(\d)/,"$1-$2")   //Coloca ponto entre o decimoprimeiro e o decimosegundo dígitos
		return v
	}
	
	function cnpf_mask(v){
		v=v.replace(/\D/g,"")                 
		v=v.replace(/(\d{2})(\d)/,"$1.$2")    
		v=v.replace(/(\d{3})(\d)/,"$1.$2")    
		v=v.replace(/(\d{3})(\d)/,"$1/$2")
		v=v.replace(/(\d{4})(\d)/,"$1-$2")
		return v
	}	
	
	function phone_mask(v) {
		v=v.replace(/\D/g,"")                 //Remove tudo o que não é dígito
		v=v.replace(/(\d{0})(\d)/,"$1($2")    
		v=v.replace(/(\d{2})(\d)/,"$1)$2")    
		v=v.replace(/(\d{5})(\d)/,"$1-$2")    
		return v
	}
	

</script>
</html>