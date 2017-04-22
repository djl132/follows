angular.module('dunno')
.controller('AuthCtrl', [
'$scope',
'$state',
'Auth',
function($scope, $state, Auth){

// USE INFORMATION passed through scope form navctrl to authctrl
  $scope.login = function() {
   Auth.login($scope.user).then(function(){
     $state.go('home');
   });
 };

 $scope.register = function() {
   Auth.register($scope.user).then(function(){
     $state.go('home');
   });
 };

}]);
