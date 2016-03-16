

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <head>
          <title>Rent a Pixel</title>
    </head>
</head>
<asset:stylesheet src="nobootstrap.css"/>

<body>
<style>
    body{
        padding-top: 0px;
    }
</style>
<div ng-app="pixelrent" id="pix_content" ng-controller="PixelMainController">

    <div class="pix_row" ng-repeat="row in availability_matrix">
        <a href="#"   ng-repeat="cell in row" >
        <div class="pix_cell" ng-click="select(cell)" >

        </div>
        </a>
    </div>

    <div ng-repeat="space in spaces" style="position:absolute" ng-style="{left:space.pos_x,
                           top:space.pos_y,
                           width:space.size_x,
                           height:space.size_y}">
        <div >
            <a class="space_link"  target="_parent" href="{{space.ad_link}}">
                <img ng-style="{width:space.size_x,height:space.size_y}" ng-src="{{space.img_url}}" style="display: block">
            </a>
        </div>
    </div>

</div>

<asset:javascript src="simple.js"/>

</body>
</html>