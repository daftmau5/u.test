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

<style>
.dual-list .list-group {
	margin-top: 8px;
}

.list-left li, .list-right li {
	cursor: pointer;
}

.list-arrows {
	padding-top: 100px;
}

.list-arrows button {
	margin-bottom: 20px;
}
</style>

<div class="form">
	<div class="row">
		<img src="<c:url value="/resources/imagens/sem_acesso.jpg"/>" style="margin: auto; width: 100%; height: 500px;">
		<br><br>
		<h2>SEM ACESSO :(</h2>
		<h4>Você não tem permissão para acessar essa área.</h4>					
	</div>
</div>	

<c:import url="/WEB-INF/paginas/template/rodape.jsp"/>