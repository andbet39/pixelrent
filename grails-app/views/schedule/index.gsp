<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
     <div class="col-md-12">
        <table id="table-schedule" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    Start
                </td>
                <td>
                    Status
                </td>
                <td>
                    Name
                </td>
                <td>
                    Db
                </td>

            </tr>
            </thead>
            <g:each var="sched" in="${scheduleList}">
                <tr>
                    <td>
                        <g:link controller="Schedule" action="show" id="${sched.id}">${sched.id}</g:link>
                    </td>
                    <td>
                        ${sched.start_date}
                    </td>
                    <td>
                        ${sched.status}
                    </td>
                    <td>
                        ${sched.check.name}
                    </td>
                    <td>
                        ${sched.check.db.sid}
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
    </div>
    </body>
</html>