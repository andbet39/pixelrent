<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="ninestar" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

    <div class="container">

        <div class="row">
            <div class="col-md-4 col-md-offset-4 form-panel">



                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="form-title">Signup</h3>
                    </div>
                    <div class="panel-body">


                        <g:if test="${flash.errors}">
                            <div class="alert alert-error error-text" role="alert" style="display: block">${flash.errors}</div>
                        </g:if>


                    <g:form controller="register" action="save">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Email" name="email" type="email" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="form-group">
                                 <input class="form-control" placeholder="Confirm Password" name="confirmpassword" type="password" value="">
                                </div>

                                  <g:submitButton name="create" class="btn btn-success" value="Signup" />

                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>



    </div>
    </body>
</html>
