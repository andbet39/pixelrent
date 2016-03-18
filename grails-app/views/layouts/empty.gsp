<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="simple.css"/>

    <g:layoutHead/>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Rent a Pixel</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:ifNotLoggedIn>
                        <g:link controller='login' action='auth'>Login</g:link>
                    </sec:ifNotLoggedIn>
                    <sec:ifLoggedIn>
                        <g:link controller='logout' > Logout <sec:loggedInUserInfo field='username'/></g:link>
                    </sec:ifLoggedIn>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

    <g:layoutBody/>


 <!-- /#wrapper -->

<asset:javascript src="simple.js"/>

</body>
</html>
