<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/paginas/template/cabecalho.jsp" />

<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>

<link href="<c:url value="/resources/form-css/css/normalize.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/form-css/css/style.css"/>"
	rel="stylesheet">

<script>
var qtdPorPagina = 10;
var pagAtual = 0;
var vetorProvas = JSON.parse('${provas}');
var tamanho = Object.keys(vetorProvas).length;

function paginar(){
	tamanho = Object.keys(vetorProvas).length;
	// removendo as linhas da tabela antes de repaginar
	$('table > tbody > tr').remove();
	var tbody = $('table > tbody');
	for (var i = pagAtual * qtdPorPagina; i < tamanho && i < (pagAtual + 1) * qtdPorPagina; i++){
		var prova = vetorProvas[i];
		var aux = "erro";
		switch (prova.qtd_ques){
		case 1:
			aux = "M�dia"
			break;
		case 0:
			aux = "F�cil"
			break;
		default:
			aux = "Dif�cil"
			break;
		}
		tbody.append(
			$("<tr id='linha_"+prova.id+"'>")
			.append($("<td>").append(prova.id))
			.append($("<td>").append(prova.titulo))
			.append($("<td>").append(prova.qtd_ques))
			.append($("<td>").append(aux))
			.append($("<td>").append(prova.aplicacoesA))
		);
	}
	$("#numeracao").text("P�gina "+(pagAtual+1)+" de "+Math.ceil(tamanho/qtdPorPagina));
}

function configBotoes(){
	$("#proximo").prop("disabled", tamanho <= qtdPorPagina || pagAtual > tamanho / qtdPorPagina -1);
	$("#anterior").prop("disabled", tamanho <= qtdPorPagina || pagAtual == 0);
}

function excluir(id, index) {
	$.post("excluir_prova", {
		'id' : id
	}, function() {
		$("#linha_" + id).hide("slow",function(){
			vetorProvas.splice(index, 1);
			paginar();
			configBotoes();
		});
	});
}

$(function(){
	$("#proximo").click(function(){
		if(pagAtual < tamanho / qtdPorPagina - 1){
			pagAtual++;
			paginar();
			configBotoes();
		}
	});
	$("#anterior").click(function(){
		if(pagAtual > 0){
			pagAtual--;
			paginar();
			configBotoes();
		}
	});
	
	paginar();
	configBotoes();
});
</script>

<div class="form2">
<div class="tab-content">
<h1>Provas Cadastradas</h1>

<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>T�TULO</th>
			<th>QUEST�ES</th>
			<th>DIFICULDADE</th>
			<th>APLICA��ES AVALIATIVAS</th>
		</tr>
	</thead>
	<tbody>
		
	</tbody>
</table>
<section>
	<button class="btn btn-default" id="anterior" disabled>&lsaquo;&lsaquo;Anterior</button>
	<span id="numeracao"></span>
	<button class="btn btn-default" id="proximo" disabled>Pr�ximo&rsaquo;&rsaquo;</button>
</section>
</div>
</div>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />