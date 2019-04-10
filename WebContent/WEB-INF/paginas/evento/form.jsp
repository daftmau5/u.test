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


<div class="form2">
	<div class="row">
		<h1>
			Selecione uma prova ou <a href="<c:url value="/form_prova1"/>"><u>crie
					uma você mesmo!</u></a>
		</h1>


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
					<h3 style="color: black;">Provas disponíveis</h3>
					<c:forEach items="${prova }" var="prova">
						<a href='prova?id=${prova.id }' style="background-color: white;"
							class="list-group-item">
							<h4 style="color: black;">${prova.titulo}</h4>
							<h5 style="color: black;">
								-
								<c:forEach items="${prova.areas}" var="area">- ${area.nome } -</c:forEach>
								-
							</h5>
							<h5 style="color: black;">Questões: ${prova.questoes.size()}</h5> <script
								type="text/javascript">
								var aux = "erro";
								var dificuldade = ${prova.dificuldade};
								switch (dificuldade) {
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
							<h5 style="color: black;">
								Dificuldade:
								<script>
									document.write(aux)
								</script>
							</h5>
						</a>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>



<script>
	$(function() {
		
		var cont = 0;

		$('body').on('click', '.list-group .list-group-item', function() {
			$(this).toggleClass('active');
		});
		$('[name="SearchDualList"]').keyup(function(e) {
			var code = e.keyCode || e.which;
			if (code == '9')
				return;
			if (code == '27')
				$(this).val(null);
			var $rows = $(this).closest('.dual-list').find('.list-group a');
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