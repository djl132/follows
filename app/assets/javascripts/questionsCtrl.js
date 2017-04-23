
// MVC for showing question

(function(){

function QuestionsCtrl($scope, questions, question, answers){
  // BIND question MODEL DATA TO FORNT END, thorugh a SERVICE
  $scope.question = question

  $scope.answer = function(){
    if(!$scope.body || $scope.body === '') { return; }

    // CREATS question ON BACKEND ANDTHEN UPDATES
    //IT IN THE FRONTEND
    questions.addAnswer(question.id, {
      body: $scope.body

      // THIS WORKS BECAUSE JSON RETURNED ABOUT QUESTIONS, INCLUDES ANSWERS TOO RIGHT
      //DOES THIS CHANGE ORIGINAL DB question OR NO?

      // HOW DO WE UPDATE THE ORIGINAL QUESTIONS THINGY?
    }).then(function(answer){ $scope.question.answers.push(answer.data) });

    $scope.body = '';

    };

// BUT THIS ISN'T SMART LOADING COMMENTS
    $scope.getCommentsForAnswer = function(answer){
      return answers.getComments(answer)
    }

    $scope.commentOnAnswer = function(answer){
      
    }


  }


angular
.module('dunno')
.controller('QuestionsCtrl', ['$scope','questions','question','answers', QuestionsCtrl])


})();
