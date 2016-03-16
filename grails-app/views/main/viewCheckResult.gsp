<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'check.label', default: 'Check')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

    <br>

    <div ng-app="myapp" ng-controller="MainController">

    <div class="row">
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-small" ng-click="changeinterval('HOUR')">Last hour</button>
                <button class="btn btn-small" ng-click="changeinterval('DAY')">Last 24h</button>
                <button class="btn btn-small btn-danger" ng-click="changeinterval('ALL')">All</button>
            </div>
        </div>
        <div class="col-md-8">
            <canvas id="result-graph" class="chart chart-line" chart-data="data"
                    chart-labels="labels" chart-legend="true" chart-series="series"
                    chart-click="onClick" >
            </canvas>
        </div>
    </div>





    </div>

    <div class="row">
        <div class="col-md-12">
            <h2>Latest check result</h2>
        </div>
    </div>
     <div class="row">
        <div class="col-md-12">
            <table id="table-checks" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td>
                        Result
                    </td>
                    <td>
                        Date
                    </td>
                    <td>
                        Check
                    </td>
                </tr>
                </thead>
                <g:each var="res" in="${resList}">
                    <tr>
                        <td>
                            ${res.result}
                        </td>
                        <td>
                            <g:formatDate format="dd-MM-yyyy HH:mm:ss" date="${res.execute_time}"/>

                        </td>
                        <td>
                            ${res.c.db.sid}
                        </td>
                    </tr>
                </g:each>
            </table>

        </div>

    </div>

     </body>
</html>
