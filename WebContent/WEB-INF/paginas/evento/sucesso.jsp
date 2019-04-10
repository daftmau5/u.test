<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/paginas/template/cabecalho.jsp" />

<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>

<link href="<c:url value="/resources/form-css/css/normalize.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/form-css/css/style.css"/>"
	rel="stylesheet">

<div class="form2">
	<div class="tab-content">
		<h1>EVENTO CORRIGIDO!</h1>
		<h3>Resumo da avaliação:</h3>
			<h3>Evento: ${evento.nome }</h3>
				
				<c:forEach items="${gabaritos }" var="gabarito" varStatus="contador1">
					<table>
						<thead>
						<tr>
							<th><h4>NOME DO ALUNO</h4></th>
							<script type="text/javascript">
								var cont = 1;
							</script>
							<c:forEach items="${gabarito.respostas }" var="resposta" varStatus="contador2">
								<th><h4>Q<script>document.write(cont); cont++;</script></h4></th>
							</c:forEach>
							<c:forEach items="${gabarito.alternativas }" var="alternativa" varStatus="contador1">
								<th><h4>Q<script>document.write(cont); cont++;</script></h4></th>
							</c:forEach>
							<th><h4>NOTA</h4></th>
						</tr>
						</thead>
						<tbody>
							<tr>
								<td><h4>${gabarito.aluno.nome}</h4></td>
								<c:forEach items="${gabarito.respostas }" var="resposta" varStatus="contador3">
									<c:if test="${resposta.correta == 0}">
										<td><h4 class="glyphicon glyphicon-remove"></h4></td>
									</c:if>
									<c:if test="${resposta.correta == 1}">
										<td><h4 class="glyphicon glyphicon-minus"></h4></td>
									</c:if>
									<c:if test="${resposta.correta == 2}">
										<td><h4 class="glyphicon glyphicon-ok"></h4></td>
									</c:if>
								</c:forEach>
								<c:forEach items="${gabarito.alternativas }" var="alternativa" varStatus="contador4">
									<c:if test="${alternativa.correta == true}">
										<td><h4 class="glyphicon glyphicon-ok"></h4></td>
									</c:if>
									<c:if test="${alternativa.correta == false}">
										<td><h4 class="glyphicon glyphicon-remove"></h4></td>
									</c:if>
									
								</c:forEach>
								<td><h4>${gabarito.nota}</h4></td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			
		<hr>
		<form action="/u.test/professor/RelatorioServlet/" method="post">
		<input name="id" type="hidden" value="${evento.id }">
		<button type="submit" class="button button-block">Gerar Relatório</button>
		</form>
		
	</div>
	
	
</div>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />