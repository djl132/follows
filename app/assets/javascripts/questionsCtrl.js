(function(){

function QuestionsCtrl($scope, questions, question){
  // BIND question MODEL DATA TO FORNT END, thorugh a SERVICE
  // $scope.questions = questions.questions

  $scope.answer = function(question){
    if(!$scope.body || $scope.body === '') { return; }

    // CREATS question ON BACKEND ANDTHEN UPDATES
    //IT IN THE FRONTEND
    questions.addAnswer(question.id, {
      body: $scope.body
    }).then(function(answer){ $scope.questions.answers.push(answer) });
    $scope.body = '';

    };

  }


angular
.module('dunno')
.controller('QuestionsCtrl', ['$scope','questions', QuestionsCtrl])


})();
