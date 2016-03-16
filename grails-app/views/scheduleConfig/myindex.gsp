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
                            ${sconf.is_active}
                        </td>
                        <td>
                            ${sconf.is_paused}
                        </td>
                        <td>
                            ${sconf.is_repeating}
                        </td>
                        <td>
                            ${sconf.check.name} - ${sconf.check.db}
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>

<script>
    $(document).ready(function() {
        $('#table-config').DataTable({
            responsive: true
        });
    });
</script>


</body>
</html>
