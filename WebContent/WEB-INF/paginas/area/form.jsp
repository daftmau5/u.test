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
			<h1>Cadastro de Áreas</h1>
			<form action="salvar_area" method="post">
						
						<input type="hidden"
						class="form-control input-lg" name="id" value="${area.id}"
						readonly="readonly"> 
	
						<div class="field-wrap">
						<label>Nome<span class="req">*</span>
						</label> <input type="text" name="nome"
						value="${area.nome}" required="required" autocomplete="off"> 						
						</div>
												
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