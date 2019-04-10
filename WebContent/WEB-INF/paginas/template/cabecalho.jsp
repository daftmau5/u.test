<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>u.test - simulados & vestibulares</title>

<!-- JQuery -->
<script src="<c:url value="/resources/jquery/jquery-2.2.4.min.js"/>"></script>

<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/imagens/icon.png"/>" />

<!-- Mask CPF -->
<script type="text/javascript"
	src="<c:url value="/resources/jquery/jquery.maskedinput-1.1.4.pack.js"/>"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link
	href="<c:url value="/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css"/>"
	rel="stylesheet">


<link
	href="<c:url value="/resources/bootstrap-3.3.6-dist/css/stylish-portfolio.css"/>"
	rel="stylesheet">



<!-- Custom Fonts -->
<link
	href="<c:url value="/resources/bootstrap-3.3.6-dist/font-awesome/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="fundo">

	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a id="menu-close" href="#"
				class="btn btn-light btn-lg pull-right toggle"><i
				class="fa fa-times"></i></a>
			<li class="sidebar-brand"><a onclick=$("#menu-close").click();><b>Menu</b></a>
			</li>
			<c:if test="${admLogado != null}">
				<li><a href="<c:url value="/logou/"/>">Home</a></li>
				<li><a href="<c:url value="/form_area"/>">Nova Area</a></li>
				<li><a href="<c:url value="/form_administrador"/>">Novo Adm</a></li>
				<li><a href="<c:url value="/form_instituicao"/>">Nova
						Instituição</a></li>
				<li><a href="<c:url value="/lista_area"/>">Listar Areas</a></li>
				<li><a href="<c:url value="/lista_questaoAdm"/>">Listar Questões</a></li>
				<li><a href="<c:url value="/lista_aluno"/>">Listar Alunos</a></li>
				<li><a href="<c:url value="/lista_administrador"/>">Listar
						Adms</a></li>
				<li><a href="<c:url value="/lista_professor"/>">Listar
						Professores</a></li>
				<li><a href="<c:url value="/lista_instituicao"/>">Listar
						Instituições</a></li>
			</c:if>
			<c:if test="${profLogado != null}">
				<li><a href="<c:url value="/logou/"/>">Home</a></li>
				<li><a href="<c:url value="/form_questao"/>">Nova Questão</a></li>
				<li><a href="<c:url value="/form_prova1"/>">Nova Prova</a></li>
				<li><a href="<c:url value="/form_evento"/>">Novo Evento</a></li>
				<li><a href="<c:url value="/lista_prova1"/>">Minhas Provas</a></li>
				<li><a href="<c:url value="/lista_questao"/>">Minhas Questões</a></li>
				<li><a href="<c:url value="/lista_evento1"/>">Meus Eventos</a></li>
			</c:if>
			<c:if
				test="${profLogado != null || admLogado != null || userLogado != null}">
				<li><a href="<c:url value="/usuario/logout"/>">Logout</a></li>
			</c:if>
			<c:if
				test="${profLogado == null && admLogado == null && userLogado == null}">
				<li><a href="<c:url value="/index/"/>">Home</a></li>
				<li><a href="<c:url value="/login"/>">Login</a></li>
			</c:if>
		</ul>
	</nav>