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
			<form action="salvar_professor" method="post">
			
						<input type="hidden"
						class="form-control input-lg" name="id" value="${professor.id}"
						readonly="readonly"> 
						
						<input type="hidden"
						class="form-control input-lg" name="tipoUsuario" value=1
						readonly="readonly">
						
						<h4>Informa��es pessoais:</h4>
          				<hr>	
							
						<h4>Nome:</h4>	
						<input type="text" name="nome"
						value="${professor.nome}" required="required"> 
						
						<h4>Email:</h4>	
						<input type="email" name="email"
						value="${professor.email}" required="required"> 
						
						
						<h4>Telefone:</h4>
              			<input type="text" maxlength="15" name="telefone" 
              			id="telefone" value="${professor.telefone}" required autocomplete="off"/>
            			
          
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
								v=v.replace(/\D/g,""); //Remove tudo o que n�o � d�gito
								v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca par�nteses em volta dos dois primeiros d�gitos
								v=v.replace(/(\d)(\d{4})$/,"$1-$2"); //Coloca h�fen entre o quarto e o quinto d�gitos
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
						
						<h4>Data de Nascimento:</h4>
          				<input type="text" onfocus="(this.type='date')" required name="dataNasc" autocomplete="off"
						value='<fmt:formatDate value="${professor.dataNasc.time }" 
						pattern="yyyy-MM-dd"/>'>
						
						<script type="text/javascript">$(document).ready(function(){	$("#cpf").mask("999.999.999-99");});</script>
						
						
						<h4>CPF:</h4>
          				<input type="text" name="cpf"
						value="${professor.cpf}" id="cpf" required="required">
						<span id="resposta"></span>				
						
						<script type="text/javascript">
							function CPF(){"user_strict";
							function r(r){for(var t=null,n=0;9>n;++n)t+=r.toString().charAt(n)*(10-n);
							var i=t%11;return i=2>i?0:11-i}function t(r){for(var t=null,n=0;10>n;++n)t+=r.toString().charAt(n)*(11-n);
							var i=t%11;return i=2>i?0:11-i}var n="CPF Inv�lido <span class='glyphicon glyphicon-remove'></span>",i="CPF V�lido <span class='glyphicon glyphicon-ok'></span>";
							this.gera=function(){for(var n="",i=0;9>i;++i)n+=Math.floor(9*Math.random())+"";
							var o=r(n),a=n+"-"+o+t(n+""+o);
							return a},this.valida=function(o){for(var a=o.replace(/\D/g,""),u=a.substring(0,9),f=a.substring(9,11),v=0;10>v;v++)if(""+u+f==""+v+v+v+v+v+v+v+v+v+v+v)return n;
							var c=r(u),e=t(u+""+c);
							return f.toString()===c.toString()+e.toString()?i:n}}

   							var CPF = new CPF();
   
   							for(var i =0;i<40;i++) {
      							var temp_cpf = CPF.gera();
   							}

							$("#cpf").keypress(function(){
    							$("#resposta").html(CPF.valida($(this).val()));
							});

							$("#input").blur(function(){
     							$("#resposta").html(CPF.valida($(this).val()));
							});
							
						</script>
							
						<h4>Informa��es de conta</h4>
		 				<hr>
						
						<h4>Login:</h4>
						<input style="background-color: gray" readonly="readonly" type="text" maxlength="15"
						name="login" value="${professor.login}" required="required">
						
						<h4>Senha:</h4><input type="password" id="password" maxlength="15"
						name="senha" value="${professor.senha}" required="required">
						
						<h4>Confirmar senha:</h4>
						<input type="password" id="confirm_password" maxlength="15"
						value="${professor.senha}" required="required">
						
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
						<h4>Informa��es profissionais</h4>
						<hr>
						
						
						<h4>Institui��o:</h4>
						<input style="background-color: gray" readonly="readonly" type="text" maxlength="15"
						value="${professor.instituicao}" required="required">
						
						<input style="background-color: gray" readonly="readonly" type="hidden" maxlength="15"
						name="instituicao.id" value="${professor.instituicao.id}" required="required">
						
						<h4>Forma��o:</h4>
						<input type="text" name="formacao" value="${professor.formacao}" required autocomplete="off">
									
						<h4>�rea:</h4>
						<input style="background-color: gray" readonly="readonly" type="text" maxlength="15"
						value="${professor.area.nome}" required="required"><br>
						<input style="background-color: gray" readonly="readonly" type="hidden" maxlength="15"
						name="area.id" value="${professor.area.id}" required="required">
						
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