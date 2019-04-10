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
var vetorInstituicoes = JSON.parse('${instituicoes}');
var tamanho = Object.keys(vetorInstituicoes).length;

function paginar(){
	tamanho = Object.keys(vetorInstituicoes).length;
	// removendo as linhas da tabela antes de repaginar
	$('table > tbody > tr').remove();
	var tbody = $('table > tbody');
	for (var i = pagAtual * qtdPorPagina; i < tamanho && i < (pagAtual + 1) * qtdPorPagina; i++){
		var instituicao = vetorInstituicoes[i];
		tbody.append(
			$("<tr id='linha_"+instituicao.id+"'>")
			.append($("<td>").append(instituicao.id))
			.append($("<td>").append(instituicao.nome))
			.append($("<td>").append(instituicao.telefone))
			.append($("<td>").append(instituicao.endereco))
			.append($("<td>").append("<a href='alterar_instituicao?id="+instituicao.id+"'><span class='glyphicon glyphicon-pencil'></span></a>"))
			.append($("<td>").append("<a href='#' onclick='excluir("+instituicao.id+","+i+")'><span class='glyphicon glyphicon-remove'></span></a>"))
		);
	}
	$("#numeracao").text("P�gina "+(pagAtual+1)+" de "+Math.ceil(tamanho/qtdPorPagina));
}

function configBotoes(){
	$("#proximo").prop("disabled", tamanho <= qtdPorPagina || pagAtual > tamanho / qtdPorPagina -1);
	$("#anterior").prop("disabled", tamanho <= qtdPorPagina || pagAtual == 0);
}

function excluir(id, index) {
	$.post("excluir_instituicao", {
		'id' : id
	}, function() {
		$("#linha_" + id).hide("slow",function(){
			vetorInstituicoes.splice(index, 1);
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
<h1>Institui��es cadastradas</h1>

<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>NOME</th>
			<th>TELEFONE</th>
			<th>ENDERE�O</th>
			<th>ALTERAR</th>
			<th>EXCLUIR</th>
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