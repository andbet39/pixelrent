<%--
  Created by IntelliJ IDEA.
  User: andreaterzani
  Date: 02/03/16
  Time: 10:33
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>


                <h1 class="page-header">This is the main page</h1>


<div ng-app="myapp" ng-controller="MainController">
    {{"This is Angular"}}


    <canvas id="line" class="chart chart-line" chart-data="data"
            chart-labels="labels" chart-legend="true" chart-series="series"
            chart-click="onClick" >
    </canvas>


</div>



</body>
</html>
