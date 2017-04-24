

// DATA IS RETRIEVED AND CHNAGED THROUGH MODEL DATA AND METHODS, CONTAINED IN SERVICES
(function(){

function GroupCtrl($scope,groups,group){
  // BIND question MODEL DATA TO FORNT END, thorugh a SERVICE
  $scope.group = group

    $scope.askGroup = function(){
      if(!$scope.title || $scope.title === '' || !$scope.body || $scope.body === ''|| !$scope.topic_name || $scope.topic_name === '') { return; }

      // CREATS question ON BACKEND ANDTHEN UPDATES
      //IT IN THE FRONTEND
      groups.create({
        title: $scope.title,
        body: $scope.body,
        topic: group.name
      });
      $scope.title = '';
      $scope.body = '';
    };
  }

angular
.module('dunno')
.controller('GroupCtrl', ['$scope','groups','group', GroupCtrl])
})();
