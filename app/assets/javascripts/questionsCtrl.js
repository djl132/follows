(function(){

function QuestionsCtrl($scope, questions, question){
  // BIND question MODEL DATA TO FORNT END, thorugh a SERVICE
  $scope.question = question

  $scope.answer = function(){
    if(!$scope.body || $scope.body === '') { return; }

    // CREATS question ON BACKEND ANDTHEN UPDATES
    //IT IN THE FRONTEND
    questions.addAnswer(question.id, {
      body: $scope.body
    }).then(function(answer){ $scope.question.answers.push(answer.data) });
    $scope.body = '';

    };

  }


angular
.module('dunno')
.controller('QuestionsCtrl', ['$scope','questions','question', QuestionsCtrl])


})();
