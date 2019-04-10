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

<div class="form1">
	<div class="row">
		<form action="criar_evento1" method="post">

		
		<div>
			<h3>Título:</h3>
			<input type="text" name="titulo" value="${prova.titulo}" disabled="disabled"> 
		</div>
		
			
			
		<div>
			<h3>Tempo de prova (em horas):</h3>
			<input type="number" name="tempo" value="1" required="required" disabled="disabled" style="width: 60px;"> 
		</div>
			<input type="hidden" name="id" value="${prova.id}"> 
			
		
		<hr>

		<div class="dual-list list-right col-md-12">
			<div class="well text-left">
				<div class="row">
					<div class="col-md-9">
						<div class="input-group">
							<span class="input-group-addon glyphicon glyphicon-search"></span>
							<input type="text" name="SearchDualList" class="form-control"
								placeholder="search" />
						</div>
					</div>
				</div>
				<ul class="list-group" style="height: 600px; overflow-y: scroll;">
				<h3 style="color: black;">Questões</h3>
					<c:forEach items="${prova.questoes }" var="questao">					
						<li class="list-group-item" id="teste"><input id="teste"
							type="hidden" name="vazio" value="${questao.id }">
							<h4 style="color: black;">${questao.area.nome}</h4>
							<h6 style="color: black;">Enunciado: ${questao.enunciado}</h6>
							<script type="text/javascript">
							var aux = "erro";
							var dificuldade = ${questao.dificuldade};
							switch (dificuldade){
							case 0:
								aux = "Fácil"
								break;
							case 1:
								aux = "Médio"
								break;
							case 2:
								aux = "Difícil"
								break;
							default:
								aux = "Indefinido"
								break;
							}
							</script>
							<h6 style="color: black;">Dificuldade: <script>document.write(aux)</script></h6>
							<h6 style="color: black;">Utilizações:
								${questao.utilizacoes} provas</h6></li>
					</c:forEach>
				</ul>
			</div>
		</div>			
		</div>
		<div>
			<button type="button" onclick="location.href='<c:url value="/form_evento"/>'" class="button button-block" style="width: 49%; float: left; text-align: center;">
			<span class="glyphicon glyphicon-chevron-left"></span>Voltar</button>
			<button style="width: 49%; margin-left: 51%;" type="submit" class="button button-block">
			Prosseguir<span class="glyphicon glyphicon-chevron-right"></span></button>
		</div>
		</form>
	</div>
	
</div>
<script>
	$(function() {
		
		var cont = 0;

		$('[name="SearchDualList"]').keyup(function(e) {
			var code = e.keyCode || e.which;
			if (code == '9')
				return;
			if (code == '27')
				$(this).val(null);
			var $rows = $(this).closest('.dual-list').find('.list-group li');
			var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
			$rows.show().filter(function() {
				var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
				return !~text.indexOf(val);
			}).hide();
		});

	});
</script>

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>
<c:import url="/WEB-INF/paginas/template/rodape.jsp" />