<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>u.test - Simulados & Vestibulares</title>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/imagens/icon.png"/>" />
    
    <!-- Mask CPF -->
    <script type="text/javascript" src="<c:url value="/resources/jquery/jquery.maskedinput-1.1.4.pack.js"/>"></script>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css"/>"
	rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/stylish-portfolio.css"/>" 
    rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bootstrap-3.3.6-dist/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top" onclick=$("#menu-close").click();><b>Menu</b></a>
            </li>
            <li>
                <a href="#top" onclick=$("#menu-close").click();>Home</a>
            </li>
            <li>
                <a href="#about" onclick=$("#menu-close").click();>Sobre</a>
            </li>
            <li>
                <a href="#services" onclick=$("#menu-close").click();>Servi�os</a>
            </li>
            <li>
                <a href="#portfolio" onclick=$("#menu-close").click();>Nossa Equipe</a>
            </li>
            <li>
                <a href="#contact" onclick=$("#menu-close").click();>Contato</a>
            </li>
            <li>
                <a href="#comece" onclick=$("#menu-close").click();>Junte-se a n�s</a>
            </li>
            <c:if test="${profLogado != null || admLogado != null || userLogado != null}">
				<li><a href="<c:url value="/usuario/logout"/>">Logout</a></li>
			</c:if>
			<c:if test="${profLogado == null && admLogado == null && userLogado == null}">
				<li><a href="<c:url value="/login"/>">Login</a></li>
			</c:if>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center" style="margin-top: 1000px;">
        	<div style="width: 30%; margin-top: 600px;">
            <img src="<c:url value="/resources/imagens/logo.png"/>">
            <h3>Fa�a provas e vestibulares gratuitamente!</h3>
            <br>
            <a href="#about" class="btn btn-dark btn-lg">Descubra...</a>
            </div>
        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 id="preto"><b>u.test</b> � perfeito para estudantes e escolas!</h2>
                    <p class="lead">Com <i>u.test</i> voc� pode participar de avalia��es online, testar conhecimentos de diversas �reas e acompanhar seu desempenho via celular de onde estiver!</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Nossos servi�os</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-laptop fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Mobilidade</strong>
                                </h4>
                                <p>Acompanhe seu desempenho e consulte resultados de qualquer lugar por meio de nosso aplicativo Android.</p>
                              <!--  <a href="#" class="btn btn-light">Saiba mais</a> -->
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-graduation-cap fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Provas</strong>
                                </h4>
                                <p>Fa�a provas avaliativas de sua institui��o via sistema, com possibilidade de consulta dos resultados em tempo real.</p>
                                <!--  <a href="#" class="btn btn-light">Saiba mais</a> -->
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-pencil fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Contribua</strong>
                                </h4>
                                <p>Professores de qualquer �rea do conhecimento podem contribuir com quest�es e corre��es para sua institui��o.</p>
                           <!--  <a href="#" class="btn btn-light">Saiba mais</a> -->
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-building fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Eventos</strong>
                                </h4>
                                <p>Fa�a vestibulares, concursos e outras avalia��es classificat�rias elaboradas por institui��es avaliativas ou empresas.</p>
                               <!--  <a href="#" class="btn btn-light">Saiba mais</a> -->
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Callout -->
    <aside class="callout">
        <div class="text-vertical-center">
            <h1>E o melhor de tudo:<br>� gr�tis!</h1>
        </div>
    </aside>

    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2 id="preto">Nossa Equipe</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="https://www.instagram.com/carvalhodudu_/" target="_blank">
                                    <img class="img-portfolio img-responsive" src="<c:url value="/resources/bootstrap-3.3.6-dist/img/portfolio-1.JPG"/>">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="https://www.youtube.com/channel/UCn7uPFHAjQeP2iHr7siwJnQ" target="_blank">
                                    <img class="img-portfolio img-responsive" src="<c:url value="/resources/bootstrap-3.3.6-dist/img/portfolio-2.jpg"/>">
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) 
                    <a href="#" class="btn btn-dark">Mais...</a>
                    -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Call to Action -->
    <aside id="comece" class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>Comece j�!</h3>
                    <h4>Cadastre-se gratu�tamente e entre para a fam�lia <b>u.test</b>!</h4>
                    <a href="<c:url value="/logar"/>" class="btn btn-lg btn-dark" style="max-width: 100%;">Inscreva-se como usu�rio</a>
                    <a href="<c:url value="/termos"/>" class="btn btn-lg btn-dark" style="max-width: 100%;">Inscreva-se como professor</a>
                </div>
            </div>
        </div>
    </aside>

    <!-- Map -->
    <section id="contact" class="map">
        <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.88899325395!2d-46.64832798438674!3d-23.53649466656111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5843deb99025%3A0xb23619858bc7e63e!2sEscola+SENAI+de+Inform%C3%A1tica!5e0!3m2!1spt-BR!2sbr!4v1474400379972"></iframe>
        <br />
        <small>
            <a href="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.88899325395!2d-46.64832798438674!3d-23.53649466656111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5843deb99025%3A0xb23619858bc7e63e!2sEscola+SENAI+de+Inform%C3%A1tica!5e0!3m2!1spt-BR!2sbr!4v1474400379972"></a>
        </small>
        </iframe>
    </section>

    <!-- Footer -->
    <footer style="background-color: black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4 id="preto1"><strong>OakCoast</strong>
                    </h4>
                    <p>Alameda Bar�o de Limeira, 539
                        <br>Santa Cecilia, S�o Paulo</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (11) 960-648-723</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i> <a href="mailto:OakCoast@outlook.com">OakCoast@outlook.com</a>
                        </li>
                    </ul>
                    
                    
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; u.test 2016</p>
                    <p class="text-muted">Designed by <a href="#portfolio"><i>Eduardo Carvalho</i></a></p>
                </div>
            </div>
        </div>
        <a id="to-top" href="#top" class="btn btn-dark btn-lg"><i class="fa fa-chevron-up fa-fw fa-1x"></i></a>
    </footer>

    <!-- jQuery -->
    <script src="<c:url value="/resources/bootstrap-3.3.6-dist/js/jquery.js"/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"/>"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    //#to-top button appears after scrolling
    var fixed = false;
    $(document).scroll(function() {
        if ($(this).scrollTop() > 250) {
            if (!fixed) {
                fixed = true;
                // $('#to-top').css({position:'fixed', display:'block'});
                $('#to-top').show("slow", function() {
                    $('#to-top').css({
                        position: 'fixed',
                        display: 'block'
                    });
                });
            }
        } else {
            if (fixed) {
                fixed = false;
                $('#to-top').hide("slow", function() {
                    $('#to-top').css({
                        display: 'none'
                    });
                });
            }
        }
    });
    // Disable Google Maps scrolling
    // See http://stackoverflow.com/a/25904582/1607849
    // Disable scroll zooming and bind back the click event
    var onMapMouseleaveHandler = function(event) {
        var that = $(this);
        that.on('click', onMapClickHandler);
        that.off('mouseleave', onMapMouseleaveHandler);
        that.find('iframe').css("pointer-events", "none");
    }
    var onMapClickHandler = function(event){
            var that = $(this);
            // Disable the click handler until the user leaves the map area
            that.off('click', onMapClickHandler);
            // Enable scrolling zoom
            that.find('iframe').css("pointer-events", "auto");
            // Handle the mouse leave event
            that.on('mouseleave', onMapMouseleaveHandler);
        }
        // Enable map zooming with mouse scroll when the user clicks the map
    $('.map').on('click', onMapClickHandler);
    </script>

</body>

</html>
