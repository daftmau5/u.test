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
		<form action="salvar_prova" method="post">
		<h1>Formulação de prova</h1>
		<div>
			<h3>Título:</h3>
			<input type="text" name="titulo" value="${prova.titulo}" required="required"> 
		</div>
		
			
			
			<div>
			<h3>Tempo de prova(em horas):</h3>
			<input type="number" name="tempo" value="1" required="required"> 
			</div>
		
		<hr>

		<div class="dual-list list-left col-md-5">
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
				<ul class="list-group" style="height: 600px; overflow-y: scroll;"><h3 style="color: black;">Questões Dísponíveis</h3>
					<c:forEach items="${questao }" var="questao">
						<li class="list-group-item" id="teste"><input id="teste"
							type="hidden" name="vazio" value="${questao.id }">
							<input type="hidden" name="vazio2" value="${questao.area.id }">
							<h4 style="color: black;">${questao.area.nome}</h4>
							<h6 style="color: black;">Enunciado: ${questao.enunciado}</h6>
							<h6 style="color: black;">Tipo: ${questao.tipo == 0 ? "Dissertativa":"Alternativa"}</h6>
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
								${questao.utilizacoes} provas</h6>
							</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="list-arrows col-md-2 text-center">
			<button type="button" class="btn btn-default btn-lg move-left">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</button>

			<button type="button" class="btn btn-default btn-lg move-right">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</button>
		</div>

		<div class="dual-list list-right col-md-5">
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
					style="height: 600px; overflow-y: scroll;"><h3 style="color: black;">Prova</h3>
					<li class="list-group-item">
						<h4 style="color: black;">Cabeçalho</h4>
						<h6 style="color: black;">Instituição: ${profLogado.instituicao.nome }</h6>
						<h6 style="color: black;">Professor: ${profLogado.nome }</h6>
					</li>
				</ul>
				
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
				for (i = 0;i < actives.length; i++){
					input = actives[i].childNodes[0];
					input.setAttribute("name", "vazio");	
					input2 = actives[i].childNodes[2];
					input2.setAttribute("name", "vazio2");	
				};
				actives.clone().appendTo('.list-left ul');
				actives.remove();
			} else if ($button.hasClass('move-right')) {	
				actives = $('.list-left ul li.active');
				for (i = 0;i < actives.length; i++){
					console.log(actives[i].childNodes);
					input = actives[i].childNodes[0];
					input.setAttribute("name", "questoes["+cont+"].id");	
					input2 = actives[i].childNodes[2];
					input2.setAttribute("name", "questoes["+cont+"].area.id");	
					cont = cont + 1;
				};	
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