//= wrapped
//= require_self (1)


angular.module("pixelrent",['wu.masonry','ngFileUpload','rzModule']).controller("MassController", MassController);

function MassController($scope,$http) {
    var vm = this;


    $scope.spaces =[

    ];


    $scope.init = function(){

        $http.get('/api/activespaces').then(function(data){

           $scope.spaces  = data.data;
            console.log($scope.spaces);
        });


     };

    $scope.init();
}
