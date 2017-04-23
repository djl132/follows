
// STORE QUESTIONS adn CALL GET/POST METHODS DB DATA IN A SERVICE OBJECT.
(function(){

    function Answers($http){
      var o = { answers: []};

      // get all posts, and update SERVICE OBJECT(FRONTEND)
      o.getUsersAnswers = function(user_id) {

         return $http.get('/questions.json').then(function(q){
// COPY RESPONSE DATA INTO SERVICES
           angular.copy(q.data, o.answers);


         });
       };

       o.getComments = function(answer) {
          return $http.get('/answers/' + answer.id + '/comments.json').then(function(commentsResponse){
            console.log("Got comment data for answer!", commentResponse.data)
              return commentsReponse.data;
          }, console.log("failed to load"))
        };

// add new answer to a question
       o.addComment = function(id, answer) {
         return $http.post('/answers/' + id + '/comments.json', answer)
       };


       return o;
    }

angular
  .module('dunno')
  .factory('answers', ['$http', Answers])

})();
