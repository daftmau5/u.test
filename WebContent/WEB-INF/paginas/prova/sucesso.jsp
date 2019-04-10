<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h1>PROVA CADASTRADA COM SUCESSO! </h1>
		<h2> _> Título: ${prova.titulo }</h2>
		<h2> _> Questões: ${prova.questoes.size() }</h2>
		<h2> _> Tempo: ${prova.tempo } hora(s)</h2>
		<hr>
		<a href="<c:url value="/lista_prova1"/>" class="btn btn-lg btn-dark" style="width: 100%">Listar minhas provas</a><hr>
		<a href="<c:url value="/form_prova"/>" class="btn btn-lg btn-dark" style="width: 100%">Cadastrar outra prova</a><hr>
		<a href="<c:url value="/form_evento"/>" class="btn btn-lg btn-dark" style="width: 100%">Criar um evento</a>
	</div>
	
	
</div>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />