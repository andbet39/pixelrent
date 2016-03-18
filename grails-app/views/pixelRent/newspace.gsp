<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="empty" />
        <g:set var="entityName" value="${message(code: 'space.label', default: 'Space')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>




    <div class="container">
        <div ng-app="pixelrent"   ng-controller="NewSpaceController">

            <form>
                <input type="text" name="img_url" ng-model="newSpace.img_url">
            </form>





        </div>


    </div>



            <g:form action="save">
                <fieldset class="form">
                    <f:all bean="space"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
    </body>
</html>
