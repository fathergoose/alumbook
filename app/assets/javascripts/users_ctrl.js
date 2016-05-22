(function() {
  "use strict";

  angular.module("app").controller("usersCtrl", ['$scope', '$http', function($scope, $http){

    $scope.setupUsersIndex = function(){
      $http.get('/api/v1/users.json').then(function(response){
        $scope.users = response.data;
      });
    };

    $scope.sort = function(keyname){
      $scope.sortKey = keyname;   
      $scope.reverse = !$scope.reverse;
    }

    $scope.setupUserShow = function(userId){
      $http.get('/api/v1/users/' + userId + '.json').then(function(response){
        $scope.user = response.data;
        $scope.userId = userId;
      });
    };



    window.scope = $scope;
  }]);

}());