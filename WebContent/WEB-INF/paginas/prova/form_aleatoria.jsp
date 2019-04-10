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
		<form action="salvar_prova_aleatoria" method="post">
		<h1>GERAR PROVA AUTOMATICAMENTE</h1>
		<div>
			<h3>Título:</h3>
			<input type="text" name="titulo" value="${prova.titulo}" required="required"> 
		</div>
		
			
			
			<div>
			<h3>Tempo de prova(em horas):</h3>
			<input type="number" name="tempo" value="1" required="required"> 
			</div>
		
		<h3>Áreas:</h3>
		<c:forEach items="${areas }" var="area" varStatus="cont">
			<h4><input type="checkbox" name="areas[${cont.count-1 }].id" value="${area.id}">  ${area.nome }</h4>
		</c:forEach>
		
		
		<div>
			<h3>Número de questões máximas:</h3>
			<input type="number" name="qtd_ques" value="1" required="required"> 
		</div>
		
		
			<br>
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