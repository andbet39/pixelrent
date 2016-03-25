<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Rent your Pixel</title>
    <asset:stylesheet src="simple.css"/>


</head>

<body data-spy="scroll">

<div class="container">
    <ul id="gn-menu" class="gn-menu-main">
        <li class="gn-trigger">
            <a class="gn-icon gn-icon-menu"><span>Menu</span></a>
            <nav class="gn-menu-wrapper">
                <div class="gn-scroller">
                    <ul class="gn-menu">
                        <li>
                            <g:link  class="gn-icon gn-icon-download" controller="cusSpace" action="newspace">Rent a new space</g:link>
                        </li><li>
                            <g:link  class="gn-icon gn-icon-archive" controller="pixelRent" action="myspaces">My Spaces</g:link>
                        </li>

                        <li>
                            <g:link  class="gn-icon gn-icon-earth" controller="about" action="index">About</g:link>

                        </li>
                        <li>
                            <sec:ifNotLoggedIn>
                                <g:link controller='login' class="gn-icon gn-icon-help" action='auth'>Login</g:link>
                            </sec:ifNotLoggedIn>
                            <sec:ifLoggedIn>
                                <a href="/logout" class="gn-icon gn-icon-cog">Logout <sec:loggedInUserInfo field='username'/></a>
                            </sec:ifLoggedIn>
                        </li>
                    </ul>
                </div><!-- /gn-scroller -->
            </nav>
        </li>
        <li><g:link controller="pixelRent" action="mass">RENTYOURPIXEL</g:link></li>
        <li><ul class="company-social">
            <li class="social-facebook"><a href="https://www.facebook.com/sharer/sharer.php?u=www.rentyourPixel.com/about" target="_blank"><i class="fa fa-facebook"></i></a></li>
            <li class="social-twitter"><a href="http://www.twitter.com/share?url=http://www.rentyourPixel.com/about/" target="_blank"><i class="fa fa-twitter"></i></a></li>
            <li class="social-google"><a href="https://plus.google.com/share?url=http://www.rentyourPixel.com/about/" target="_blank"><i class="fa fa-google-plus"></i></a></li>
        </ul>	</li>
    </ul>
</div>


<g:layoutBody/>




<!-- /#wrapper -->



<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <p>Copyright &copy; 2016 CODETutorial.io - by <a href="http://codetutoria.io">Pixel Rent</a></p>
            </div>
        </div>
    </div>
</footer>

<asset:javascript src="simple.js"/>


</body>

</html>
