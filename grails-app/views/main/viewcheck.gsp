<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'check.label', default: 'Check')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <!-- Page Content -->

        <a href="#list-check" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home/index')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-check" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table id="table-checks" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        Description
                    </td>
                    <td>
                        DB
                    </td>
                    <td>
                        Execute
                     </td>
                    <td>
                        Results
                    </td>

                </tr>
                </thead>
                <g:each var="ck" in="${checkList}">
                    <tr>
                        <td>
                            <g:link controller="check" action="show" id="${ck.id}">${ck.name}</g:link>
                        </td>
                        <td>
                            ${ck.description}
                        </td>
                        <td>
                            ${ck.db.sid}
                        </td>
                        <td>
                            <g:link action="execute" controller="main" id="${ck.id}"><button class="btn btn-sm btn-success"> Exec </button></g:link>
                        </td>
                        <td>
                            <g:link action="viewCheckResult" controller="main" id="${ck.id}"><button class="btn btn-sm btn-success"> Result </button></g:link>
                        </td>

                    </tr>
                </g:each>
            </table>

            <div class="pagination">
                <g:paginate total="${checkCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
