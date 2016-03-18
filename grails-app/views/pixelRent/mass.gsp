

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
         <meta name="layout" content="empty" />

        <title>Rent a Pixel</title>

</head>

<body>

<div class="container">
    <div ng-app="pixelrent" id="pix_content" ng-controller="MassController">

         <div masonry="{ transitionDuration: '0.4s',fitWidth: true,originTop: true}">
            <div class="masonry-brick grid-item" ng-repeat="space in spaces">
                <a target="_parent" href="http://{{space.ad_link}}">
                    <img ng-style="{width:space.size_x,height:space.size_y}" ng-src="{{space.img_url}}">
                </a>
             </div>
        </div>
    </div>
</div>
<script src="//code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/masonry/3.1.2/masonry.pkgd.min.js"></script>
<script src="//desandro.github.io/imagesloaded/imagesloaded.pkgd.min.js"></script>


</body>
</html>