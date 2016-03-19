<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="ninestar"/>

    <title>Rent a Pixel</title>

</head>

<body data-spy="scroll">

<section id="intro" class="intro">

    <div class="row intro-text">
        <div class="col-md-12 ">
            <h2>Rented space :${total_space} Sq.Px in ${spaceCount} images <g:link controller="cusSpace"
                                                                                               action="newspace"></h2><button
                        style="float: right" class="btn btn-lg btn-success">Rent your space</button></g:link>
        </div>
    </div>


    <div ng-app="pixelrent" id="pix_content" ng-controller="MassController">

        <div masonry="{ transitionDuration: '0.1s',fitWidth: true,originTop: false}">
            <div class="masonry-brick grid-item" ng-repeat="space in spaces">
                <a target="_parent" href="http://{{space.ad_link}}">
                    <img ng-style="{width:space.size_x,height:space.size_y}"
                         ng-src="/cusSpace/showPayload/{{space.id}}">
                </a>
            </div>
        </div>
    </div>


</section>


<script src="//code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/masonry/3.1.2/masonry.pkgd.min.js"></script>
<script src="//desandro.github.io/imagesloaded/imagesloaded.pkgd.min.js"></script>

</body>
</html>