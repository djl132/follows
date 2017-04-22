angular.module('dunno')
.controller('NavCtrl', [
'$scope',
'Auth',
function($scope, Auth){
  $scope.signedIn = Auth.isAuthenticated;
  console.log(Auth.isAuthenticated())
  $scope.logout = Auth.logout;
//retrive current user data
if (Auth.isAuthenticated()){
  Auth.currentUser().then(function (user){
    $scope.user = user;
  }, function(fail){ console.log("logged in, but error retreiveing current user", fail)});
}

// GET USER DATA USERNAME, AND STUFF.
$scope.$on('devise:new-registration', function (e, user){
  $scope.user = user;
});

$scope.$on('devise:login', function (e, user){
  $scope.user = user;
});

$scope.$on('devise:logout', function (e, user){
  $scope.user = {};
});

}]);
