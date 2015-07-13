<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="customtags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
		
	<c:import url="/sec/menu.jsp"></c:import>	
	
</head>
<body>
	<title>Usuários</title>
	<c:set var="resultado" value="${requestScope.resultado}"/>
	<ct:showMessages resultado="${resultado}"/>
	
	<c:choose>
		<c:when test="${resultado == null}">
			<jsp:useBean id="resultado" class="stock.core.application.Result"/>
		</c:when>	
		<c:otherwise>
		 	<c:set var="u" value="${resultado.getEntities().get(0)}"/>
		</c:otherwise>
	</c:choose>	
	
	<form class="form-horizontal" method="post" action="/stock-web/sec/User" id="f1">
		<fieldset>
			<c:choose>
	
				<c:when test="${u.getId() == null}">
					<legend>Cadastro de Usuário</legend>
				</c:when>
				<c:otherwise>
					<legend>Edição de Usuário</legend>	
				</c:otherwise>
					
			</c:choose>
			
			<input id="usernameRoot" type="hidden" value="${sessionScope.user.getUsername()}">
			<input id="id" name="id" type="hidden" value="${u.getId()}">
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="txtUsername">E-mail do Usuário</label>  
			  <div class="col-md-4">
			  <input id="txtUsername" name="txtUsername" placeholder="E-mail do Usuário" class="form-control input-md" required="" type="text" value="${u.getUsername()}">
			    
			  </div>
			</div>
			
			
				<div class="form-group">
				  <label class="col-md-4 control-label" for="txtPassword">Senha</label>
				  <div class="col-md-4">
				    <input id="txtPassword" name="txtPassword" placeholder="Digite uma senha" class="form-control input-md" required="" type="password">
				  </div>
				</div>
				
				<!-- Password input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="txtPassword2">Confirmar Senha</label>
				  <div class="col-md-4">
				    <input id="txtPassword2" name="txtPassword2" placeholder="Confirme a senha" class="form-control input-md" required="" type="password">
				  </div>
				</div>
			
			<!-- Password input-->
			
		
			<!-- Multiple Radios -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="rdRoot">Usuário Root</label>
			  <div class="col-md-4">
			  <div class="radio">
			    <label for="rdRoot">
			      <input type="radio" id="rdRoot" name="rdRoot" required="" ${u.getRoot() == true ? 'checked=checked':'' } value="1" >SIM
			    </label>
				</div>
			  <div class="radio">
			    <label for="rdRoot">
			      <input type="radio" id="rdRoot" name="rdRoot" required="" ${u.getRoot() == false ? 'checked=checked':'' } value="0">Não
	      	    </label>
				</div>
			  </div>
			</div>
		
			<!-- Multiple Radios -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="rdAbleEmail">Receber E-mail</label>
			  <div class="col-md-4">
			  <div class="radio">
			    <label for="rdAbleEmail">
  					<input type="radio" id="rdAbleEmail" required="" name="rdAbleEmail" ${u.getAbleEmail() == true ? 'checked=checked':''} value="1">Habilitado
			    </label>
				</div>
			  <div class="radio">
			    <label for="rdAbleEmail">
			      <input type="radio" id="rdAbleEmail" name="rdAbleEmail" required="" ${u.getAbleEmail() == false ? 'checked=checked':''} value="0">Desabilitado
			    </label>
				</div>
			  </div>
			</div>
		
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="operacao"></label>
			  <div class="col-md-4">
			  
				<input type="hidden" name="origin" value="userCadastro.jsp"/>
									
				<c:choose>
				<c:when test="${u.getId() == null}">
					<button type="submit" name="operacao" id="operacao" value="save" class="btn btn-primary">Salvar</button>
				</c:when>
				<c:otherwise>
					<button type="submit" name="operacao" id="operacao" value="update" class="btn btn-primary">Alterar</button>	
				</c:otherwise>
				
				</c:choose>
				
				<a href="/stock-web/sec/User">Voltar</a>
			  </div>
			</div>
		
		</fieldset>
	</form>
	
</body>


<script>

	document.getElementById("user_menu").style.display="none";
  
	$(document).ready(function(){  
		$("#f1").submit(function(){
	   
	    	//Aqui se quiser pode fazer outras validações, mas nesse caso farei apenas a validação de ambos campos de senha.  
	          if ($("#txtPassword").val() == $("#txtPassword2").val()) {
	        	  
	      		var radios = document.getElementsByName("rdAbleEmail");
	    		var userRoot = document.getElementById("usernameRoot").value;
	    		var userOnPage = document.getElementById("txtUsername").value;
	    		
	    		if (userRoot != userOnPage) {
	    		
	    			  return confirm("Alerta!!\n\n\nO sistema só pode possuir um usuário ROOT.\nTem certeza que deseja alterar o usuário ROOT do sistema?\n\nSomente o usuário ROOT tem acesso a gestão de usuários do sistema.");
	    		}
	        	return true;  
	          } 
	          
	          alert("Senhas divergentes!");
	          $("#txtPassword").val("");
	          $("#txtPassword2").val("");
	          $("#txtPassword").focus();
	          return false; // Aqui ele irá cancelar o submit tenha seja inválido ambas senhas.  
	    });  
	
	});
</script>

</html>