

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <head>
        <meta name="layout" content="empty" />
        <title>Rent a Pixel</title>
    </head>
</head>x

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
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
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>
</body>
</html>