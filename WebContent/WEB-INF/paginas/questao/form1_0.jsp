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

<div class="form">
	<div class="tab-content">
			<h1>Cadastro de questão dissertativa</h1>
			<form action="criar_questao1D" method="post">
			
						<input type="hidden"
						class="form-control input-lg" name="id" value="${questaoD.id}"
						readonly="readonly"> 
						
						<div class="field-wrap">
          				<select id="select"
						name="area.id" required>
						<option value="" disabled selected>Área da questão</option>
						<c:forEach items="${area }" var="area">
							<option value="${area.id }"
								<c:if test="${area.id.equals(questaoD.area.id)}">selected </c:if>>
							${area.nome}</option>
						</c:forEach>
						</select>
						</div>					
						
						<div class="field-wrap">
						<label>Enunciado<span class="req">*</span>
						</label> <textarea id="taForm" name="enunciado"
						required="required"></textarea> 
						</div>	
						
																
						<button type="submit" class="button button-block" />
						Cadastrar!
						</button>
			</form>
	</div>	
</div>

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />