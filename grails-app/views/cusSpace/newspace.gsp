<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="ninestar" />
    <title>PixelRent</title>
</head>
<body>


<style>
.drop-box {
    background: #F8F8F8;
    border: 2px dashed #DDD;
    width: 100%;
    text-align: center;
    padding: 50px 10px ;
}

.up-buttons {
    float: right;
}

.drop-box.dragover {
    border: 2px dashed blue;
}

.drop-box.dragover-err {
    border: 2px dashed red;
}

.img-info{
    padding-top: 20px;
    padding-bottom: 20px;
    font-size: 2rem;
}
</style>



<div class="container" ng-app="pixelrent"   ng-controller="NewSpaceController">


    <div class="row">
        <div class="col-md-6 col-sm-12 col-md-offset-3 form-panel">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="form-title">New space</h3>
                </div>
                <div class="panel-body">
                    <div>
                        <img style="max-width: 200px;max-height: 200px;" class ="preview-img center-block" ngf-src="file" >

                        <div ng-show="!fileplaced">
                            <div ngf-drop ng-model="file" name="file" ngf-accept="'image/*'"
                                 ngf-drag-over-class="'dragover'" ngf-multiple="false" class="drop-box">Drop jpeg image here
                            </div>
                        </div>
                    </div>


                    <div ng-show="fileplaced">
                        <div class="img-info" >
                            <span style="float: right"><strong>AREA </strong> {{area}} Sq./Px</span>
                            <span><strong>Price </strong> {{size_x*size_y/100 | currency}}</span>

                        </div>


                        <div class="form-group">
                            <label for="ad_link">Image Link URL</label>
                            <input type="text" class="form-control" id="ad_link" placeholder="Link" name="ad_link" ng-model="newSpace.ad_link">
                        </div>


                        <div class="form-group">
                            <label for="scale">Scale</label>
                            <rzslider
                                    rz-slider-model="scale"
                                    rz-slider-options="slider.options"></rzslider>

                        </div>



                        <div class="control-group">
                            <div class="controls">

                            </div>
                        </div>


                        <div class="control-group">
                            <div class="controls">
                                <button style="float: right" class="btn btn-success" ng-click="submit()">Check Out</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


</body>
</html>
