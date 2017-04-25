
// MVC for showing question

(function(){

function QuestionsCtrl($scope, questions, question, answers){
  // BIND question MODEL DATA TO FORNT END, thorugh a SERVICE
  $scope.question = question

  ///////TSHI Q HAS ANSWER, COMMENTS

  $scope.answer = function(questiony){
    if(!$scope.body) { return; }

    // CREATS question ON BACKEND ANDTHEN UPDATES
    //IT IN THE FRONTEND
    questions.addAnswer(questiony.id, {
      body: $scope.body

      // THIS WORKS BECAUSE JSON RETURNED ABOUT QUESTIONS, INCLUDES ANSWERS TOO RIGHT
      //DOES THIS CHANGE ORIGINAL DB question OR NO?

      // HOW DO WE UPDATE THE ORIGINAL QUESTIONS THINGY?
    }).then(function(answer){ $scope.question.answers.push(answer.data) });

    $scope.body = '';

    };

// // BUT THIS ISN'T SMART LOADING COMMENTS
//     $scope.getCommentsForAnswer = function(answer, index){
//       return answers.getComments(answer)
//     }

    $scope.commentOnAnswer = function(answer, index){
      if (!$scope.commentBody) {return;}
      answers.addComment(answer.id, {body: $scope.commentBody}).then(function(commentsResponse){
        console.log("Got comment data for answer!", commentResponse.data)
          $scope.question.answers[index].comments.push(commentsReponse.data);
      }, console.log("failed to load"))

      $scope.commentBody = '';
    }

    // $scope.followQuestion = function(question){
    //     question.follow(question.id
    // }

    $scope.upvoteAnswer = function(answer, index){
      answers.upvote(answer.id).then(function(answer){
        console.log(answer.data);
        $scope.question.answers[index] = answer.data;

      })
    }

    $scope.downvoteAnswer = function(answer, index){
      answers.downvote(answer.id).then(function(answer){
        console.log(answer.data);
        $scope.question.answers[index] = answer.data;

      })
    }


  }


angular
.module('dunno')
.controller('QuestionsCtrl', ['$scope','questions','question','answers', QuestionsCtrl])


})();
