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
			<h1>Cadastro de quest�o alternativa</h1>
			<form action="criar_questao1A" method="get">
			
						<input type="hidden"
						class="form-control input-lg" name="id" value="${questaoA.id}"
						readonly="readonly"> 
						
						<input type="hidden"
						class="form-control input-lg" name="tipo" readonly="readonly" value="1">
						
						<div class="field-wrap">
          				<select id="select"
						name="area.id" required>
						<option value="" disabled selected>�rea da quest�o</option>
						<c:forEach items="${area }" var="area">
							<option value="${area.id }"
								<c:if test="${area.id.equals(questaoA.area.id)}">selected </c:if>>
							${area.nome}</option>
						</c:forEach>
						</select>
						</div>	
						
						<div class="field-wrap">
						<label>Enunciado<span class="req">*</span>
						</label> <textarea id="taForm" name="enunciado"
						required="required"></textarea> 
						</div>	
						
						<div class="field-wrap">
						<label>Alternativa 1<span class="req">*</span>
						</label> <input type="text" name="alternativas[0].descricao"
						required="required" autocomplete="off">
						<br>
						<div class="checkbox">
  							<h4><input type="checkbox" name="alternativas[0].correta">Correta?</h4>
						</div> 
						<input type="hidden" name="alternativas[0].questao.id" value="${questaoA.id}">
						</div>
						<hr>
						<br><br>
						
						
						<div class="field-wrap">
						<label>Alternativa 2<span class="req">*</span>
						</label> <input type="text" name="alternativas[1].descricao"
						required="required" autocomplete="off">
						<br>
						<div class="checkbox">
  							<h4><input type="checkbox" name="alternativas[1].correta">Correta?</h4>
						</div> 
						<input type="hidden" name="alternativas[1].questao.id" value="${questaoA.id}">
						</div>
						<hr>
						<br><br>
						
						<div class="field-wrap">
						<label>Alternativa 3<span class="req">*</span>
						</label> <input type="text" name="alternativas[2].descricao"
						required="required" autocomplete="off">
						<br>
						<div class="checkbox">
  							<h4><input type="checkbox" name="alternativas[2].correta">Correta?</h4>
						</div> 
						<input type="hidden" name="alternativas[2].questao.id" value="${questaoA.id}">
						</div>
						<hr>
						<br><br>
						
						
						
						<div id="maisAlt1" style="visibility: hidden; display: none">
						<div class="field-wrap">
						<label>Alternativa 4<span class="req">*</span>
						</label> <input type="text" name="alternativas[3].descricao"
						autocomplete="off">
						<br>
						<div class="checkbox">
  							<h4><input type="checkbox" name="alternativas[3].correta">Correta?</h4>
						</div> 
						<input type="hidden" name="alternativas[3].questao.id" value="${questaoA.id}">
						</div>
						<hr>
						<br>
						</div>
						
						<div id="maisAlt2" style="visibility: hidden; display: none">
						<div class="field-wrap">
						<label>Alternativa 5<span class="req">*</span>
						</label> <input type="text" name="alternativas[4].descricao"
						autocomplete="off">
						<br>
						<div class="checkbox">
  							<h4><input type="checkbox" name="alternativas[4].correta">Correta?</h4>
						</div> 
						<input type="hidden" name="alternativas[4].questao.id" value="${questaoA.id}">
						</div>
						<hr>
						<br>
						</div>
						 
						<button id="btMaisAlt1" style="width: 35%; display: inline;" onclick="myFunction()" class="button button-block" type=button>+ Alternativa</button>
						<button id="btMaisAlt2" style="width: 35%; display: none;" onclick="myFunction2()" class="button button-block" type=button>+ Alternativa</button>
						
						<script type="text/javascript">
							function myFunction() {
								document.getElementById("maisAlt1").style.visibility = 'visible';
								document.getElementById("maisAlt1").style.display = 'inline';	
								document.getElementById("btMaisAlt1").style.display = 'none';
								document.getElementById("btMaisAlt2").style.display = 'inline';
							}
							function myFunction2() {
								document.getElementById("maisAlt2").style.visibility = 'visible';
								document.getElementById("maisAlt2").style.display = 'inline';	
								document.getElementById("btMaisAlt2").style.display = 'none';		
							}
						</script>
							<br><br>											
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