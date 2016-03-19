

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <head>
        <meta name="layout" content="ninestar" />
    </head>
</head>x

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 form-panel">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="form-title">Login</h3>
                    </div>
                    <div class="panel-body">
                        <g:if test='${flash.message}'>
                            <div class="login_message error-text" style="display: block">${flash.message}</div>

                        </g:if>


                        <form role="form" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">

                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember-me" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input class="btn btn-lg btn-success  btn-block" type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>

                            </fieldset>
                        </form>
                        </br>
                        <g:link controller="register" action="index">Signup here</g:link>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>
</body>
</html>