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
		<h1>QUEST�O CADASTRADA COM SUCESSO! </h1>
		<h2> _> ${questaoD.enunciado } ${questaoA.enunciado }</h2>
	</div>
	
	
</div>
<script lang="JavaScript">
	setTimeout("document.location = 'form_questao'", 4500)
</script>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />