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
		<h2>Bem Vindo ao u.test, usu�rio <i>${professor.login }.</i></h2>
		<h2>Seu cadastro foi conclu�do com sucesso.</h2>
		<h2>Seus privil�gios como professor incluem formula��o de quest�es e provas gratu�tamente!</h2>
		<h2>Use o menu na lateral direita para logar e come�ar.</h2>
	</div>
</div>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />