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

<div class="form2">
	<div class="tab-content">
	<h1>BEM VINDO, ${profLogado.nome }${userLogado.nome }${admLogado.nome }.</h1>
		<h2>
		<c:if test="${admLogado != null}">
			Login: ${admLogado.login }<br>
			Tipo: Administrador<br>
			E-Mail: ${admLogado.email }<br></h2>
			<h3><a href="altera_adm"><span class="glyphicon glyphicon-pencil">Atualizar</span></a><br></h3>
			<br>
			<br>
			<h2>
			<br>
			<br>
			Acesse o menu no canto superior direito para começar...
		</c:if>
		<c:if test="${userLogado != null}">
			Login: ${userLogado.login }<br>
			Level: ${userLogado.level }<br>
			Tipo: Usuário<br>
			Level: ${userLogado.instituicao.nome }<br>
			<br>
			<br>
			Para ter controle sobre suas notas, eventos futuros e correções, baixe nosso aplicativo grátis!
		</c:if>
		<c:if test="${profLogado != null}">
			Login: ${profLogado.login }<br>
			Tipo: Professor<br>
			Instituíção: ${profLogado.instituicao.nome }<br>
			Área: ${profLogado.area.nome }<br>
			Formação: ${profLogado.formacao }<br>
			E-Mail: ${profLogado.email }<br></h2>
			<h3><a href="altera_professor"><span class="glyphicon glyphicon-pencil">Atualizar</span></a><br></h3>
			<br>
			<br>
			<h2>
			Acesse o menu no canto superior direito para começar...
			
		</c:if>
		</h2>
	</div>
</div>

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>
<c:import url="/WEB-INF/paginas/template/rodape.jsp" />