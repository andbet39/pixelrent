<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'check.label', default: 'Check')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<br>
<g:if test="${flash.message}">
    <div class="alert alert-danger">
        <div class="message" role="status">${flash.message}</div>
    </div>
</g:if>
<g:hasErrors bean="${this.check}">
    <div class="alert alert-danger">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.check}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul></div>
</g:hasErrors>

<div class="row">
    <div class="col-md-6">

        <div class="panel panel-default">
            <div class="panel-heading">
                Create new check
            </div>

            <div class="panel-body">
                <g:form action="save">
                    <div class="form-group">
                        <label>Name</label>
                        <input class="form-control" type="text" name="name">
                    </div>

                    <div class="form-group">
                        <label>Description</label>
                        <input class="form-control" type="text" name="description">
                    </div>


                    <div class="form-group">
                        <label>Query</label>
                        <textarea class="form-control" name="query" rows="8"></textarea>
                    </div>

                    <g:select name="db" from="${databases}" optionKey="id" optionValue="sid"
                              noSelection="['': '-Choose Database -']"/>

                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
