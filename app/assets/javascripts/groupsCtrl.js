

// DATA IS RETRIEVED AND CHNAGED THROUGH MODEL DATA AND METHODS, CONTAINED IN SERVICES
(function(){

function GroupsCtrl($scope,groups){
  // BIND question MODEL DATA TO FORNT END, thorugh a SERVICE
  $scope.questions = questions.questions

    $scope.askGroup = function(){
      if(!$scope.title || $scope.title === '' || !$scope.body || $scope.body === ''|| !$scope.topic_name || $scope.topic_name === '') { return; }

      // CREATS question ON BACKEND ANDTHEN UPDATES
      //IT IN THE FRONTEND
      questions.create({
        title: $scope.title,
        body: $scope.body,
        topic: $scope.topic_name
      });
      $scope.title = '';
      $scope.body = '';
      $scope.topic_name = '';
    };
  }

angular
.module('dunno')
.controller('GroupsCtrl', ['$scope','groups', GroupsCtrl])
})();
