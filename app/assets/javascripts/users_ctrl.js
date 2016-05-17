(function() {
  "use strict";

  angular.module("app").controller("usersCtrl", ['$scope', '$http', function($scope, $http){

    $scope.setupUsersIndex = function(){
      $http.get('/api/v1/users.json').then(function(response){
        $scope.users = response.data;
        $scope.message = "hi;"
      });
    };

    window.scope = $scope;
  }]);

}());