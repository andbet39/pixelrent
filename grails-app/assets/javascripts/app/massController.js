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
        {img:"http://localhost:8080/assets/simple.png",
            pos_type:"absolute",
            size_x:150,
             size_y:150,
             pos_x:100,
        pos_y:100}
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
