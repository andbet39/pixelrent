//= wrapped
//= require_self (1)


angular.module("pixelrent").controller("NewSpaceController", NewSpaceController);

function NewSpaceController($scope,$http,$window,Upload) {
    var vm = this;

    $scope.newSpace={ad_link:"www.google.com",img_url:"xxxx",size_x:100,size_y:100};

    $scope.ad_link = "www.google.com";
    $scope.d={};
    $scope.scale=100;
    $scope.size_x=0;
    $scope.size_y=0;
    $scope.base_scale=0;
    $scope.fileplaced = false;
    $scope.area = 0;

    $scope.slider = {
        value: 100,
        options: {
            floor: 10,
            ceil: 100,
            step:10,
            showTicksValues: true,
            ticksValuesTooltip: function(v) {
                return 'Scale ' + v/100;
            },
            translate: function(value) {
                return value + '%';
            }
        }
    };

    $scope.submit = function() {
        console.log("upload");
        if ($scope.file) {
            $scope.upload($scope.file);
        }
    };


    $scope.$watch('file', function (file) {
        $scope.formUpload = false;
        if (file != null) {

                Upload.imageDimensions(file).then(function (d) {
                    $scope.d = d;
                    console.log(d);
                    if(d.width>200 || d.height>200){
                        if(d.width > d.height ){
                            $scope.base_scale  = 200/d.width;
                        }else{
                            $scope.base_scale = 200/d.height;
                        }
                    }
                    $scope.size_x = parseInt($scope.d.width*$scope.scale*$scope.base_scale/100);
                    $scope.size_y = parseInt($scope.d.height*$scope.scale*$scope.base_scale/100);
                    $scope.fileplaced = true
                    $scope.area = $scope.size_x*$scope.size_y;

                });

        }

    });

    $scope.$watch('scale', function (file) {
            console.log("scale changed");
            $scope.formUpload = false;
            $scope.size_x = parseInt($scope.d.width*$scope.scale*$scope.base_scale/100);
            $scope.size_y = parseInt($scope.d.height*$scope.scale*$scope.base_scale/100);
            $scope.area = $scope.size_x*$scope.size_y;

            $(".preview-img").css('width', $scope.d.width*$scope.base_scale*$scope.scale/100);
        }
    );

    // upload on file select or drop
    $scope.upload = function (file) {
        Upload.upload({
            url: 'save',
            data: {file: file, ad_link:$scope.newSpace.ad_link,img_url:"xxxx",size_x:$scope.size_x,size_y:$scope.size_y}
        }).then(function (resp) {
            console.log('Success ' + resp.config.data.file.name + 'uploaded. Response: ' + resp.data);

            console.log(resp);

            $window.location.href = "/cusSpace/checkout/"+ resp.data.id

        }, function (resp) {
            console.log('Error status: ' + resp.status);
        }, function (evt) {
            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
            console.log('progress: ' + progressPercentage + '% ' + evt.config.data.file.name);
        });
    };

}
