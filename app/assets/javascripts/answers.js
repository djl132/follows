
// STORE QUESTIONS adn CALL GET/POST METHODS DB DATA IN A SERVICE OBJECT.
(function(){

    function Answers($http){
      var o = { answers: []};

      // get all posts, and update SERVICE OBJECT(FRONTEND)
      o.getUsersAnswers = function() {

         return $http.get('/questions.json').then(function(q){
// COPY RESPONSE DATA INTO SERVICES
           angular.copy(q.data, o.questions);


         });
       };

       o.getComments = function(id) {
          return $http.get('/answers/' + id + '/comments.json').then(function(comments){
            console.log("it is getting comments of an answer")
            return comments.data;
          });
        };

       o.create = function(id){
        //  send question to BACKEND API
         return $http.post('/answers/'+ id + '/comments.json', comment).then(function(q){
          //  update frontend if backend adds question
           o.questions.push(q.data);
         })
       };

// add new answer to a question
       o.addAnswer = function(id, answer) {
         return $http.post('/questions/' + id + '/answers.json', answer)
       };


       return o;
    }

angular
  .module('dunno')
  .factory('questions', ['$http', Questions])

})();
