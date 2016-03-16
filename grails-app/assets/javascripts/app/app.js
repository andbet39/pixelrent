//= wrapped
//= require /angular/angular
//= require /angular/angular-route
//= require /socket.io-client/socket.io.js
//= require /Chart.js/Chart.js
//= require /angular-chart.js/dist/angular-chart.js


//= require_self (1)

angular.module("myapp",["chart.js"]).controller("MainController", MainController);

function MainController($scope,$http,$location) {
    var vm = this;

    $scope.interval  = "DAY";

    $scope.changeinterval=function(interval){
        console.log("Setting interval to :"+interval)

        $scope.interval=interval;
        $scope.initgraph()
    };

    $scope.initgraph = function()
    {
        var BASE_URL="http://localhost:8080";
        var id = ""

        var query = $location.absUrl().replace(BASE_URL,"");
        var data = query.split("/");
        id=data[data.length-1];

        $scope.data=[[]];
        $scope.labels=[];
        console.log(id);
        $http.get('/chartData/getCheckResult/'+id+"?interval="+$scope.interval).then(function(data){

            var i=0;
            console.log(data)
            data.data.forEach(function(item){
               $scope.data[0].push(item.result);
                $scope.labels.push(item.execute_time);

                i++;
            });
        })
    }
    $scope.labels = [];
    $scope.series = ['Series A'];
    $scope.data = [[]];

    $scope.initgraph();


 }
