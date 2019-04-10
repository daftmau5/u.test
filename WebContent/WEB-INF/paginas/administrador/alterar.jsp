<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/paginas/template/cabecalho.jsp" />

<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>

<link href="<c:url value="/resources/form-css/css/normalize.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/form-css/css/style.css"/>"
	rel="stylesheet">

<div class="form">
	<div class="tab-content">
			<h1>Alterar dados</h1>
			<form action="salvar_administrador" method="post">
			
						<input type="hidden"
						class="form-control input-lg" name="id" value="${adm.id}"
						readonly="readonly"> 
						
						<input type="hidden"
						class="form-control input-lg" name="tipoUsuario" value=0
						readonly="readonly">
						
						<h4>Informações pessoais:</h4>
          				<hr>	
							
						<h4>Nome:</h4>	
						<input type="text" name="nome"
						value="${adm.nome}" required="required"> 
						
						<h4>Email:</h4>	
						<input type="email" name="email"
						value="${adm.email}" required="required"> 
						
						
						<h4>Telefone:</h4>
              			<input type="text" maxlength="15" name="telefone" 
              			id="telefone" value="${adm.telefone}" required autocomplete="off"/>
            			
          
        				<script type="text/javascript">
							function mascara(o,f){
								v_obj=o
								v_fun=f
								setTimeout("execmascara()",1)
							}
							function execmascara(){
								v_obj.value=v_fun(v_obj.value)
							}
							function mtel(v){
								v=v.replace(/\D/g,""); //Remove tudo o que não é dígito
								v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
								v=v.replace(/(\d)(\d{4})$/,"$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
								return v;
							}
							function id( el ){
								return document.getElementById( el );
							}
							window.onload = function(){
								id('telefone').onkeyup = function(){
									mascara( this, mtel );
								}
							}
						</script>
							
						<h4>Informações de conta</h4>
		 				<hr>
						
						<h4>Login:</h4>
						<input style="background-color: gray" readonly="readonly" type="text" maxlength="15"
						name="login" value="${adm.login}" required="required">
						
						<h4>Senha:</h4><input type="password" id="password" maxlength="15"
						name="senha" value="${adm.senha}" required="required">
						
						<h4>Confirmar senha:</h4>
						<input type="password" id="confirm_password" maxlength="15"
						value="${adm.senha}" required="required">
						
						<script type="text/javascript">
							var password = document.getElementById("password"), 
							confirm_password = document.getElementById("confirm_password");
							function validatePassword(){
 								if(password.value != confirm_password.value) {
  									confirm_password.setCustomValidity("Senhas diferentes!");
								} else {
					    			confirm_password.setCustomValidity('');
  								}
							}
							password.onchange = validatePassword;
							confirm_password.onkeyup = validatePassword;
						</script>
						<br>
						
					<button type="submit" class="button button-block" />
						Salvar!
						</button>
			</form>
	</div>	
</div>

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>
<c:import url="/WEB-INF/paginas/template/rodape.jsp" />