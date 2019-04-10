<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/paginas/template/cabecalho.jsp" />

<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

<link href="<c:url value="/resources/form-css/css/normalize.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/form-css/css/style.css"/>" rel="stylesheet">
	
	
	<body>

    <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Cadastre-se</a></li>
        <li class="tab"><a href="#login">Login</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Junte-se a nós gratuítamente!</h1>
          <h5 style="color: grey;">Obs: Esse cadastro serve apenas para estudantes e/ou alunos, se quiser se inscrever como professor, por favor clique <a href="<c:url value="/termos"/>">aqui.</a></h5> 
          <h4>Informações pessoais</h4>
          <hr>
          
          
          <form action="salvar_aluno" method="post">
          
            <input type="hidden"
			class="form-control input-lg" name="aluno.id" value="${aluno.id}"
			readonly="readonly">
			
			<input type="hidden"
			class="form-control input-lg" name="tipoUsuario" value=2
			readonly="readonly">
			
			
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                Nome<span class="req">*</span>
              </label>
              <input type="text" name="nome"
						value="${aluno.nome}" required autocomplete="off"> 
            </div>
        
            <div class="field-wrap">
              <label>
                Telefone<span class="req">*</span>
              </label>
              <input type="text" maxlength="15" name="telefone"	id="telefone" value="${aluno.telefone}" required autocomplete="off"/>
            </div>
          </div>
          
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

          <div class="field-wrap">
            <label>
              Email<span class="req">*</span>
            </label>
            <input type="email" name="email" autocomplete="off" value="${aluno.email}" required>
          </div>
          
          
          <div class="field-wrap">
          <label>Data de nascimento<span class="req">*</span></label>
          <input type="text" onfocus="(this.type='date')" required name="dataNasc" autocomplete="off"
			value='<fmt:formatDate value="${aluno.dataNasc.time }" 
			pattern="yyyy-MM-dd"/>'>
		 </div>
		 <h4>Informações de conta</h4>
		 <hr>
		 
		 <div class="field-wrap">
            <label>
              Nome de usuário<span class="req">*</span>
            </label>
		 <input type="text" maxlength="15"
						name="login" value="${aluno.login}" required autocomplete="off">
           </div>
           
           
          <div class="field-wrap">
            <label>
              Senha<span class="req">*</span>
            </label>
            <input type="password" id="password" maxlength="15"
						name="senha" value="${aluno.senha}" required autocomplete="off">
          </div>
          
          <div class="field-wrap">
            <label>
              Confirme a senha<span class="req">*</span>
            </label>
            <input type="password" id="confirm_password" maxlength="15"
						value="${aluno.senha}" required autocomplete="off">
          </div>
          
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
		
		<h4>Informações acadêmicas</h4>
		<hr>
		
		<div class="field-wrap">
            
		<select id="select"
			name="instituicao.id" required>
			<option value="" disabled selected>Selecione sua instituição</option>
			<c:forEach items="${instituicao }" var="instituicao">
				<option value="${instituicao.id }"
					<c:if test="${instituicao.id.equals(aluno.instituicao.id)}">selected </c:if>>
					${instituicao.nome}</option>
			</c:forEach>
		</select>
		</div>
		
		<div class="field-wrap">
            <label>
              Formação<span class="req">*</span>
            </label>
		<input type="text" name="formacao" value="${aluno.formacao}" required autocomplete="off">
          </div>   
          
          
          <div class="field-wrap">
          <select id="select"
			name="area.id" required>
			<option value="" disabled selected>Selecione sua área preferida</option>
			<c:forEach items="${area }" var="area">
				<option value="${area.id }"
					<c:if test="${area.id.equals(aluno.area.id)}">selected </c:if>>
						${area.nome}</option>
			</c:forEach>
		</select>
		</div>
		
		<h4>O que você cursa atualmente?</h4>
		<hr>
		
		<div class="field-wrap">
		<div class="checkbox">
  			<h4><input type="checkbox" name="ensinoF" ${aluno.ensinoF ? 'checked' : ''}>Ensino Fundamental</h4>
		</div>
		<div class="checkbox">
  			<h4><input type="checkbox" name="ensinoM" ${aluno.ensinoM ? 'checked' : ''}>Ensino Médio</h4>
		</div>
		<div class="checkbox">
  			<h4><input type="checkbox" name="ensinoS" ${aluno.ensinoS ? 'checked' : ''}>Ensino Superior</h4>
		</div>
		<div class="checkbox">
  			<h4><input type="checkbox" name="ensinoT" ${aluno.ensinoT ? 'checked' : ''}>Ensino Técnico</h4>
		</div>
		
		<br>
		
			</div>
          
          <button type="submit" class="button button-block"/>Inscreva-se!</button>
          
          </form>

        </div>
        
        
        <!--  ------------------------------------------------------------------------------------------------------ -->
        
        <div id="login">   
          <h1>Bem vindo de volta!</h1>
          
          <form action="logar" method="post">
          
            <div class="field-wrap">
            <label>
              Nome de usuário<span class="req">*</span>
            </label>
            <input type="text" name="login" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Senha<span class="req">*</span>
            </label>
            <input type="password" name="senha" required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Esqueceu a senha?</a></p>
          
          <button class="button button-block"/>Logar!</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="<c:url value="/resources/form-css/js/index.js"/>"></script>

  </body>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />