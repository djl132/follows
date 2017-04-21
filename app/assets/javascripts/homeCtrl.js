

// DATA IS RETRIEVED AND CHNAGED THROUGH MODEL DATA AND METHODS, CONTAINED IN SERVICES
(function(){

function HomeCtrl($scope,questions){
  // BIND question MODEL DATA TO FORNT END, thorugh a SERVICE
  $scope.questions = questions.questions

  // $scope.ask = function(){
  //   if(!$scope.title || $scope.title === '' || $scope.body || $scope.body === '') { return; }
  //
  //   // CREATS question ON BACKEND ANDTHEN UPDATES
  //   //IT IN THE FRONTEND
  //   questions.create({
  //     title: $scope.title,
  //     body: $scope.body,
  //     upvotes: 0
  //   });
  //   $scope.title = '';
  //   $scope.body = '';
  // };

  }


angular
.module('dunno')
.controller('HomeCtrl', ['$scope','questions', HomeCtrl])


})();
