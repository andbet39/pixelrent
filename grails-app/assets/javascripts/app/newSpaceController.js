//= wrapped
//= require_self (1)


angular.module("pixelrent",[]).controller("NewSpaceController", NewSpaceController);

function NewSpaceController($scope,$http,$location) {
    var vm = this;

    $scope.newSpace={img_url:"www.google.com",size_x:100,size_y:100};

    $scope.init = function(){




     };

    $scope.init();
}
