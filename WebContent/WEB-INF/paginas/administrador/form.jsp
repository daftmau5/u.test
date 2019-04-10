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
		<div id="signup">
			<h1>Cadastro de Administradores</h1>
			<h4>Informações pessoais</h4>
			<hr>
			<form action="salvar_administrador" method="post">

				<input type="hidden" class="form-control input-lg"
					name="administrador.id" value="${administrador.id}"
					readonly="readonly"> <input type="hidden"
					class="form-control input-lg" name="tipoUsuario" value=0
					readonly="readonly">

				<div class="field-wrap">
					<label>Nome<span class="req">*</span>
					</label> <input type="text" name="nome" value="${administrador.nome}"
						required="required" autocomplete="off">
				</div>

				<div class="field-wrap">
					<label>Email<span class="req">*</span>
					</label> <input type="email" name="email" value="${administrador.email}"
						required="required" autocomplete="off">
				</div>

				<div class="field-wrap">
					<label> Telefone<span class="req">*</span>
					</label> <input type="text" maxlength="15" name="telefone" id="telefone"
						value="${administrador.telefone}" required autocomplete="off" />
				</div>
		</div>

		<script type="text/javascript">
			function mascara(o, f) {
				v_obj = o
				v_fun = f
				setTimeout("execmascara()", 1)
			}
			function execmascara() {
				v_obj.value = v_fun(v_obj.value)
			}
			function mtel(v) {
				v = v.replace(/\D/g, ""); //Remove tudo o que não é dígito
				v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
				v = v.replace(/(\d)(\d{4})$/, "$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
				return v;
			}
			function id(el) {
				return document.getElementById(el);
			}
			window.onload = function() {
				id('telefone').onkeyup = function() {
					mascara(this, mtel);
				}
			}
		</script>

		<h4>Informações de conta</h4>
		<hr>

		<div class="field-wrap">
			<label>Nome de Usuário<span class="req">*</span>
			</label> <input type="text" maxlength="15" name="login"
				value="${administrador.login}" required="required"
				autocomplete="off">
		</div>

		<div class="field-wrap">
			<label>Senha<span class="req">*</span>
			</label> <input type="password" id="password" maxlength="15" name="senha"
				value="${administrador.senha}" required="required"
				autocomplete="off">
		</div>

		<div class="field-wrap">
			<label>Confirmar senha<span class="req">*</span>
			</label> <input type="password" id="confirm_password" maxlength="15"
				value="${administrador.senha}" required="required"
				autocomplete="off">
		</div>

		<script type="text/javascript">
			var password = document.getElementById("password"), confirm_password = document
					.getElementById("confirm_password");
			function validatePassword() {
				if (password.value != confirm_password.value) {
					confirm_password.setCustomValidity("Senhas diferentes!");
				} else {
					confirm_password.setCustomValidity('');
				}
			}
			password.onchange = validatePassword;
			confirm_password.onkeyup = validatePassword;
		</script>

	</div>
	<button type="submit" class="button button-block" />
	Cadastrar!
	</button>
</div>


<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />