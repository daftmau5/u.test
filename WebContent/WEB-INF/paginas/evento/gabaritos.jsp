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
	
}
</style>

<form action="corrigir_gabaritos1" method="post">
<div class="form2">
	<div class="row">
		<h1>
			Gabaritos...
		</h1>


		<div class="dual-list list-right col-md-12">
			<div class="well text-left">
				<ul class="list-group" style="height: 600px; overflow-y: scroll;">
					
					<c:forEach items="${gabaritos }" var="gabarito" varStatus="contador1">
		
						
						<li class="list-group-item" id="teste">
							<h2 style="color: black;"><b>Aluno: ${gabarito.aluno.nome }</b></h2>
							<input type="hidden" name="lista[${contador1.count-1}].id" value="${gabarito.id}">
							<input type="hidden" name="lista[${contador1.count-1}].aluno.id" value="${gabarito.aluno.id}">
							<hr>
							<c:forEach items="${gabarito.respostas }" var="resposta" varStatus="contador">
								
								<h2 style="color: black;">Pergunta:</h2> <h3 style="color: black;">${resposta.questao.enunciado }</h3>
								<h2 style="color: black;">Resposta:</h2> <h3 style="color: black;"><i>${resposta.resposta }</i></h3><br>
								
								<div>
									<input type="hidden" name="lista[${contador1.count-1}].respostas[${contador.count-1}].id" value=${resposta.id}>
									<input type="hidden" name="lista[${contador1.count-1}].respostas[${contador.count-1}].questao.id" value=${resposta.questao.id}>
									<input type="radio" id="1" name="lista[${contador1.count-1}].respostas[${contador.count-1}].correta" style="width: 20px; height: 20px;" value="0"><a style="color: black; font-size: 20px;"> Errada</a><br> 
  									<input type="radio" id="2" name="lista[${contador1.count-1}].respostas[${contador.count-1}].correta" style="width: 20px; height: 20px;" value="1"><a style="color: black; font-size: 20px;"> Meio Certo</a><br>
  									<input type="radio" id="3" name="lista[${contador1.count-1}].respostas[${contador.count-1}].correta" style="width: 20px; height: 20px;" value="2"><a style="color: black; font-size: 20px;"> Certa</a>
  								</div><br>
  								<textarea cols="50" id="4" name="lista[${contador1.count-1}].respostas[${contador.count-1}].consideracao" placeholder="Considerações..." style="color: black"></textarea>
  								<hr>
							</c:forEach>
							
						</li>
					</c:forEach>
				</ul>
				
				<button type="submit" class="button button-block">Finalizar Correção</button>
			
			</div>
		</div>
	</div>
</div>

</form>

<script>
	$(function() {
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

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>
<c:import url="/WEB-INF/paginas/template/rodape.jsp" />