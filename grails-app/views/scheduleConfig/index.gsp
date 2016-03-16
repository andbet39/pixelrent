<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'check.label', default: 'Check')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>


<div class="row">
    <div class="col-md-12">
        <h2>Configurazione scheduler</h2>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <g:link action="create" ><button class="btn btn-success">Nuovo</button></g:link>
    </div>
</div>
<br>
<div class="row">
    <div class="col-md-12">
        <table id="table-config" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    Active
                </td>
                <td>
                    Paused
                </td>
                <td>
                    Repeating
                </td>
                <td>
                    Check
                </td>

            </tr>
            </thead>
            <g:each var="sconf" in="${scheduleConfigList}">
                <tr>
                    <td>
                        <g:link controller="ScheduleConfig" action="show" id="${sconf.id}">${sconf.id}</g:link>
                    </td>
                    <td>
                        ${sconf.is_started}
                    </td>
                    <td>
                        ${sconf.is_paused}
                    </td>
                    <td>
                        ${sconf.is_repeating}
                    </td>
                    <td>
                        ${sconf.check.name} - ${sconf.check.db.sid}
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</div>

<script>

</script>


</body>
</html>
