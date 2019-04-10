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
		<form action="criar_evento2" method="post">
			<h1>Continue o cadastro...</h1>
			<input type="hidden" value="${evento.id }" name="id">

			<div>
				<h3>Defina um nome para o evento:</h3>
				<input type="text" name="nome" required placeholder="Digite aqui..." autocomplete="off">
			</div>


			<div>
				<h3>Defina a data e a hora que seu evento acontecerá:</h3>
				<input type="date" name="data" required style="width: 250px;">
				<input type="time" name="hora" required style="width: 250px;">
			</div>

			<div>
				<h3>Defina o tipo de evento:</h3>
				<select name=tipo>
					<option value="0">Concurso</option>
					<option value="1">Avaliação</option>
					<option value="2">Vestibular</option>
				</select>
			</div>

		<hr>

			<div class="dual-list list-left col-md-5" style="width: 425px;">
				<div class="well text-right">
					<div class="row">
						<div class="col-md-10">
							<div class="input-group">
								<span class="input-group-addon glyphicon glyphicon-search"></span>
								<input type="text" name="SearchDualList" class="form-control"
									placeholder="search" />
							</div>
						</div>
						<div class="col-md-2">
							<div class="btn-group">
								<a class="btn btn-default selector" title="Selecionar Tudo"><i
									class="glyphicon glyphicon-unchecked"></i></a>
							</div>
						</div>
					</div>
					<ul class="list-group" style="height: 600px; overflow-y: scroll;">
						<h3 style="color: black;">Alunos Dísponíveis</h3>
						<c:forEach items="${aluno }" var="aluno">
							<li class="list-group-item" id="teste"><input id="teste"
								type="hidden" name="vazio" value="${aluno.id }">
								<h4 style="color: black;">${aluno.nome}</h4>
								<h6 style="color: black;">ID: ${aluno.id}</h6>
								<h6 style="color: black;">Instituição: ${aluno.instituicao}</h6>
								<h6 style="color: black;">Level: ${aluno.level}</h6></li>
						</c:forEach>
					</ul>
				</div>
			</div>



			<div style="width: 100%; top: 200%;">
				<div class="list-arrows col-md-1 text-center">
					<button type="button" class="btn btn-default btn-sm move-left">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</button>

					<button type="button" class="btn btn-default btn-sm move-right">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</button>
				</div>



				<div class="dual-list list-right col-md-5" style="width: 425px;">
					<div class="well">
						<div class="row">
							<div class="col-md-2">
								<div class="btn-group">
									<a class="btn btn-default selector" title="Selecionar Tudo"><i
										class="glyphicon glyphicon-unchecked"></i></a>
								</div>
							</div>
							<div class="col-md-10">
								<div class="input-group">
									<input type="text" name="SearchDualList" class="form-control"
										placeholder="search" /> <span
										class="input-group-addon glyphicon glyphicon-search"></span>
								</div>
							</div>
						</div>


						<ul class="list-group" class="list-group"
							style="height: 600px; overflow-y: scroll;">
							<h3 style="color: black;">Evento</h3>
						</ul>

					</div>
				</div>
			</div>
			
			<button type="submit" class="button button-block" />Cadastrar!</button>
		</form>
	</div>
</div>




<script>
	$(function() {

		var cont = 0;

		$('body').on('click', '.list-group .list-group-item', function() {
			$(this).toggleClass('active');
		});
		$('.list-arrows button').click(function() {
			var $button = $(this), actives = '';
			if ($button.hasClass('move-left')) {
				actives = $('.list-right ul li.active');
				for (i = 0; i < actives.length; i++) {
					input = actives[i].childNodes[0];
					input.setAttribute("name", "vazio");
				}
				;
				actives.clone().appendTo('.list-left ul');
				actives.remove();
			} else if ($button.hasClass('move-right')) {
				actives = $('.list-left ul li.active');
				for (i = 0; i < actives.length; i++) {
					console.log(actives[i].childNodes);
					input = actives[i].childNodes[0];
					input.setAttribute("name", "alunosParticipantes[" + cont + "].id");
					cont = cont + 1;
				}
				;
				actives.clone().appendTo('.list-right ul');
				actives.remove();
			}
		});
		$('.dual-list .selector').click(
				function() {
					var $checkBox = $(this);
					if (!$checkBox.hasClass('selected')) {
						$checkBox.addClass('selected').closest('.well').find(
								'ul li:not(.active)').addClass('active');
						$checkBox.children('i').removeClass(
								'glyphicon-unchecked').addClass(
								'glyphicon-check');
					} else {
						$checkBox.removeClass('selected').closest('.well')
								.find('ul li.active').removeClass('active');
						$checkBox.children('i').removeClass('glyphicon-check')
								.addClass('glyphicon-unchecked');
					}
				});
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