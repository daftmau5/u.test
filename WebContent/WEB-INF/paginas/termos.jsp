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
		<h1>Termos de uso</h1>
		<form action="form_professor" method="post">

			<textarea id="termos" disabled="disabled">Al�m das classes que s�o pe�a-chave dentro da arquitetura, foi adicionada tamb�m � '�ltima milha', classes de apoio ao desenvolvimento, ou melhor, classes que fazem o papel de ferramentas, onde possuem m�todos que ser�o utilizados da mesma forma em todos os sistemas. Por exemplo, classes respons�veis por fazer a leitura das propriedades do sistema, classes que representam as constantes do sistema, classes que facilitaram a valida��o e a formata��o dos dados de entrada no sistema, entre outros. A arquitetura � composta por alguns elementos, entenda-se classes, que em conjunto produzem o efeito desejado pela arquitetura como um produto final para o desenvolvimento. Para uma descri��o detalhada de como cada classe trabalha, faz parte de toda a metodologia de desenvolvimento da '�ltima milha' a cria��o do Javadoc, detalhando cada m�todo e se voc� aceitar esses termos sua m�e vai ter que me dar uma chupada rsrs atributo existente, para que a curva de aprendizado na utiliza��o da '�ltima milha' seja a menor poss�vel. Por esse motivo foi criado o elemento chamado Controlador dentro da arquitetura. Um controlador � respons�vel pela execu��o de um ou mais fluxos de execu��o que s�o modeladas em um caso de uso, ou seja, podemos dizer que o controlador � em si a implementa��o da regra de neg�cio. O mesmo pode ser modularizado, quando existem algumas particularidades dentro da implementa��o das regras, em classes que chamamos de RN (regras de neg�cio). O controlador faz uso do cadastro para obter as informa��es necess�rias para o seu processamento. 
Com isso temos para cada caso de uso existente no sistema um controlador respons�vel por implement�-lo, assim temos um controle transacional muito mais robusto (por caso de uso ou pela intera��o entre eles), por exemplo, cada m�todo dentro do controlador estar� sempre sobre o mesmo contexto transacional. At� agora s� falamos dos principais elementos que comp�em a camada de regras de neg�cio, ou seja, n�o falamos nada de interface gr�fica ou at� mesmo de intera��es externas com as mesmas. � ai que entra o papel fundamental da fachada.  
A fachada � a divis�o entre as camadas superiores �s regras de neg�cio (Controlador) e as regras propriamente ditas. Ela � a entrada �nica, tanto das interfaces gr�ficas do usu�rio como de outros sistemas, para o acesso as regras de neg�cio. Com a fachada, conseguimos ent�o ter uma independ�ncia de interface gr�fica, como tamb�m podemos proteger e controlar o acesso �s regras de neg�cio. Assim, por exemplo, podemos ter um sistema totalmente desenvolvido utilizando a tecnologia Swing (recurso usado para a elabora��o de interfaces gr�ficas clientes em JAVA) e um sistema totalmente desenvolvido para WEB (usando JSP  Java Server Page) utilizando as mesmas regras de neg�cio. Conseguimos tamb�m facilitar e controlar o acesso �s regras de neg�cio por outros sistemas atrav�s da fachada.
De uma forma sucinta podemos descrever a fachada como sendo a porta de entrada para um conjunto de casos de usos, que possuem afinidades, que ser�o acessadas por elementos externos como interfaces gr�ficas e/ou sistemas. Podemos ter, por exemplo, mais de uma fachada por sistema.	</textarea>
			<br>

			<button type="submit" class="button button-block" />
			Aceitar
			</button>
		</form>
	</div>
</div>

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="<c:url value="/resources/form-css/js/index.js"/>"></script>

<c:import url="/WEB-INF/paginas/template/rodape.jsp" />