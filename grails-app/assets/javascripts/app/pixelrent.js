//= wrapped
//= require_self (1)


angular.module("pixelrent",[]).controller("PixelMainController", PixelMainController);

function PixelMainController($scope,$http,$location) {
    var vm = this;

    $scope.availability_matrix=[];
    $scope.pos="xxx"

    $scope.selected = ""


    $scope.select = function(cell){
        console.log(cell)

        var res = cell.split("-");

        $scope.start_x = res[1];
        $scope.start_y= res[2];

        console.log(res)

    };

    $scope.spaces =[
    ];

    $scope.updatepos = function (x) {

        $scope.pos=x
    };

    $scope.init = function(){

        $http.get('/api/activespaces').then(function(data){

           $scope.spaces  = data.data;
        });

        var row=[];
        $http.get('/api/freespace').then(function(data){
            $scope.availability_matrix = data.data
        });
     };

    $scope.init();
}
