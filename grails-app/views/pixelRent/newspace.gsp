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

            <g:form controller="cusSpace" action="save">
                <input type="text" name="ad_link" ng-model="newSpace.ad_link">

                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

            </g:form>





        </div>


    </div>

    </body>
</html>
