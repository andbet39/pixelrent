<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'scheduleConfig.label', default: 'ScheduleConfig')}"/>
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
                Create new scheduling
            </div>

            <div class="panel-body">
                <g:form action="save">

                    <div class="checkbox">
                        <label>
                            <input type="checkbox"   name="is_repeating">
                            Repeating Job
                        </label>
                    </div>


                    <div class="form-group">
                        <label>Interval mins.</label>
                        <input class="form-control" type="text" name="rpt_int_min">
                    </div>


                    <div class="form-group">
                        <label>Check</label>
                        <g:select class="form-control" name="check" from="${checks}" optionKey="id" optionValue="name"
                                  noSelection="['': '-Choose Check -']"/>

                    </div>


                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-success"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
