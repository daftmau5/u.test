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
var vetorQuestoes = JSON.parse('${questoes}');
var tamanho = Object.keys(vetorQuestoes).length;

function paginar(){
	tamanho = Object.keys(vetorQuestoes).length;
	// removendo as linhas da tabela antes de repaginar
	$('table > tbody > tr').remove();
	var tbody = $('table > tbody');
	for (var i = pagAtual * qtdPorPagina; i < tamanho && i < (pagAtual + 1) * qtdPorPagina; i++){
		var questao = vetorQuestoes[i];
		var aux = "erro";
		switch (questao.tipo){
		case 1:
			aux = "Alternativa"
			break;
		case 0:
			aux = "Dissertativa"
			break;
		default:
			aux = "Indefinido"
			break;
		}
		var aux2 = "erro";
		switch (questao.ativa){
		case true:
			aux2 = "<a style='color: green;'>Ativa</a>"
			break;
		case false:
			aux2 = "<a>Inativa</a>"
			break;
		default:
			aux2 = "<a>Indefinido</a>"
			break;
		}
		tbody.append(
			$("<tr id='linha_"+questao.id+"'>")
			.append($("<td>").append(questao.id))
			.append($("<td>").append(aux))
			.append($("<td>").append(aux2))
			.append($("<td>").append(questao.enunciado))
			.append($("<td>").append(questao.utilizacoes))
			.append($("<td>").append(questao.aplicacoes))
			.append($("<td>").append(questao.acertos))
			.append($("<td>").append(questao.erros))
			.append($("<td>").append("<a href='#' onclick='ativar("+questao.id+","+i+")'><span class='glyphicon glyphicon-pencil'></span></a>"))
		);
	}
	$("#numeracao").text("P�gina "+(pagAtual+1)+" de "+Math.ceil(tamanho/qtdPorPagina));
}

function configBotoes(){
	$("#proximo").prop("disabled", tamanho <= qtdPorPagina || pagAtual > tamanho / qtdPorPagina -1);
	$("#anterior").prop("disabled", tamanho <= qtdPorPagina || pagAtual == 0);
}

function ativar(id, index) {
	$.post("ativar_questao", {
		'id' : id
	}, function() {
		$("#linha_" + id).hide("slow",function(){
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
<h1>Quest�es Cadastradas</h1>

<table class="table">
	
	<thead>
		<tr>
			<th>ID</th>
			<th>TIPO</th>
			<th>STATUS</th>
			<th>ENUNCIADO</th>
			<th>UTILIZA��ES</th>
			<th>APLICA��ES</th>
			<th>ACERTOS</th>
			<th>ERROS</th>
			<th>ATIVAR</th>
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