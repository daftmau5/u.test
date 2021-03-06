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
		<h2>Instituição <i>${instituicao.nome }</i> cadastrada com sucesso!</h2>
		<h2>Selecione uma das opções para continuar:</h2>
		<a href="<c:url value="/lista_instituicao"/>" class="btn btn-lg btn-dark" style="width: 100%">Listar instituições</a><hr>
		<a href="<c:url value="/form_instituicao"/>" class="btn btn-lg btn-dark" style="width: 100%">Cadastrar outra instituição</a>
	</div>
</div>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />