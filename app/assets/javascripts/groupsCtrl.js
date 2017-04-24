
// 
// // DATA IS RETRIEVED AND CHNAGED THROUGH MODEL DATA AND METHODS, CONTAINED IN SERVICES
// (function(){
//
// function GroupsCtrl($scope,groups){
//   // BIND group MODEL DATA TO FORNT END, thorugh a SERVICE
//   $scope.groups = groups.groups
//
//   $scope.createGroup = function(){
//     if(!$scope.name || $scope.name === '' || !$scope.description || $scope.description === ''){
//        return; }
//
//     // CREATS group ON BACKEND ANDTHEN UPDATES
//     //IT IN THE FRONTEND
//     groups.create({
//       topic: $scope.name,
//       description: $scope.description,
//     });
//     $scope.name = '';
//     $scope.description = '';
//   };
//
//   }
//
// angular
// .module('dunno')
// .controller('GroupsCtrl', ['$scope','groups', GroupsCtrl])
//
//
// })();
