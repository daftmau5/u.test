<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
			<h1>Cadastro de Instituições</h1>
			<form action="salvar_instituicao" method="post">
						
						<input type="hidden"
						class="form-control input-lg" name="id" value="${instituicao.id}"
						readonly="readonly"> 
							
						<div class="field-wrap">
						<label>Nome<span class="req">*</span>
						</label> <input type="text" name="nome"
						value="${instituicao.nome}" required="required" autocomplete="off"> 						
						</div>
						
						<div class="field-wrap">
						<label>Endereço<span class="req">*</span>
						</label> <input type="text" name="endereco"
						value="${instituicao.endereco}" required="required" autocomplete="off"> 
						</div>
						
						<div class="field-wrap">
						<label> Telefone<span class="req">*</span>
						</label> <input type="text" maxlength="15" name="telefone" id="telefone"
						value="${instituicao.telefone}" required autocomplete="off" />
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
						
						<hr>
						
							
  								<h3 style="color: grey;">*Instituição avaliativa<input type="checkbox" name="tipo" style="display:inline; width: 25px; left: 100px;" 
  								${instituicao.tipo ? 'checked' : ''}></h3>
							
						
						<h6 style="color: grey;">* Instituições avaliativas tem como único objetivo avaliar estudantes e criar concursos e vestibulares.</h6>
						
						<button type="submit" class="button button-block" />
						Cadastrar!
						</button>
			</form>
	</div>	
</div>

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />

