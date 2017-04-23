
// STORE QUESTIONS adn CALL GET/POST METHODS DB DATA IN A SERVICE OBJECT.
(function(){

    function Questions($http){
      var o = { questions: []};


      // get all posts, and update SERVICE OBJECT(FRONTEND)
      o.getAll = function() {

         return $http.get('/questions.json').then(function(q){
           console.log(q.data)
// COPY RESPONSE DATA INTO SERVICES
           angular.copy(q.data, o.questions);


         });
       };

       o.get = function(id) {
          return $http.get('/questions/' + id + '.json').then(function(q){
            console.log("it is getting")
            return q.data;
          });
        };

       o.create = function(question){
        //  send question to BACKEND API
         return $http.post('/questions.json', question).then(function(q){
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
