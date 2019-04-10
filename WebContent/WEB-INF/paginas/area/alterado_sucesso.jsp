<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/paginas/template/cabecalho.jsp" />

<div class="row">
	<div class="col-sm-4 col-sm-offset-4">
		<h1><span class="glyphicon glyphicon-saved"></span></h1>
		<h2>Área ${area.nome } alterada com sucesso!</h2>
	</div>
	
	
</div>
<script lang="JavaScript">
	setTimeout("document.location = 'lista_area'", 4500)
</script>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />