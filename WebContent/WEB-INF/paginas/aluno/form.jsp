<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/paginas/template/cabecalho.jsp" />

<div class="row">
	<section class="form col-sm-4 col-sm-offset-4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title" align="center">Cadastre-se</h3>

			</div>
			<div class="panel-body">
				<form action="salvar_aluno" method="post">
					<div class="form-group">
						<input type="hidden"
						class="form-control input-lg" name="aluno.id" value="${aluno.id}"
						readonly="readonly"> 
						
						<input type="hidden"
						class="form-control input-lg" name="tipoUsuario" value=2
						readonly="readonly">
							
						<label>Nome</label> 
						<input type="text" placeholder="Digite seu nome..." class="form-control input-lg" name="nome"
						value="${aluno.nome}" required="required"> 
							
						<label>Email</label>
						<input type="email" placeholder="Digite seu e-mail..." class="form-control input-lg" name="email"
						value="${aluno.email}" required="required"> 
							
						<label>Telefone</label>
						
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
						
						<input type="text" maxlength="15" name="telefone" class="form-control input-lg" 
						id="telefone" value="${aluno.telefone}" required="required" placeholder="Digite seu telefone..."/>
						
						<label>Data de Nascimento</label><br>
						<input type="date" class="form-control input-lg" required="required" name="dataNasc"
						value='<fmt:formatDate value="${aluno.dataNasc.time }" 
						pattern="yyyy-MM-dd"/>'>
						
						<hr>
						
						<label>Nome de Usu�rio</label>
						<input type="text" placeholder="Digite um nome de usu�rio..." class="form-control input-lg" maxlength="15"
						name="login" value="${aluno.login}" required="required">
						
						<label>Senha</label>
						<input type="password" placeholder="Digite uma senha..." class="form-control input-lg" id="password" maxlength="15"
						name="senha" value="${aluno.senha}" required="required">
						
						<label>Confirmar Senha</label>
						<input type="password" placeholder="Confirme sua senha..." class="form-control input-lg" id="confirm_password" maxlength="15"
						value="${aluno.senha}" required="required">
						
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
						
						<hr>
							
						<label>Institui��o Atual:</label>
						<select class="form-control input-lg" id="select"
							name="instituicao.id">
							<c:forEach items="${instituicao }" var="instituicao">
								<option value="${instituicao.id }"
									<c:if test="${instituicao.id.equals(aluno.instituicao.id)}">selected </c:if>>
									${instituicao.nome}</option>
							</c:forEach>
						</select>
						
						<label>Forma��o</label>
						<input type="text" placeholder="Digite sua forma��o academica..." class="form-control input-lg"
						name="formacao" value="${aluno.formacao}" required="required">
									
						<label>�rea preferida:</label>
						<select class="form-control input-lg" id="select"
							name="area.id">
							<c:forEach items="${area }" var="area">
								<option value="${area.id }"
									<c:if test="${area.id.equals(aluno.area.id)}">selected </c:if>>
									${area.nome}</option>
							</c:forEach>
						</select>
						
						<hr>
						<label>O que voc� cursa atualmente?</label><br>
						<label>
							<input type="checkbox"
							name="ensinoF" ${aluno.ensinoF ? 'checked' : ''}>Ensino Fundamental
						</label>
						<br>
						<label>
							<input type="checkbox"
							name="ensinoM" ${aluno.ensinoM ? 'checked' : ''}>Ensino M�dio
						</label>
						<br>
						<label>
							<input type="checkbox"
							name="ensinoS" ${aluno.ensinoS ? 'checked' : ''}>Ensino Superior 
						</label>
						<br>
						<label>
							<input type="checkbox"
							name="ensinoT" ${aluno.ensinoT ? 'checked' : ''}>Ensino T�cnico
						</label>
						
						</div>
					<button type="submit" class="btn btn-default input-lg">Salvar</button>
				</form>
			</div>
		</div>
	</section>
</div>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />