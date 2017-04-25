
// STORE QUESTIONS adn CALL GET/POST METHODS DB DATA IN A SERVICE OBJECT.
(function(){

    function Questions($http){
      var o = { questions: []};


      // get all posts, and update SERVICE OBJECT(FRONTEND)
      o.getAll = function() {

         return $http.get('/api/v1/questions.json').then(function(q){
           console.log(q.data)
// COPY RESPONSE DATA INTO SERVICES
           angular.copy(q.data, o.questions);


         });
       };

       o.get = function(id) {
          return $http.get('/api/v1/questions/' + id + '.json').then(function(q){
            console.log("it is updating questions", q.data)
            return q.data;
          });
        };

       o.create = function(question){
        //  send question to BACKEND API
         return $http.post('/api/v1/questions.json', question).then(function(q){
           console.log(q.data)
          //  update frontend if backend adds question
           o.questions.push(q.data);
         })
       };
// add new answer to a question
       o.addAnswer = function(id, answer) {
         return $http.post('/api/v1/questions/' + id + '/answers.json', answer)
       };


       return o;
    }

angular
  .module('dunno')
  .factory('questions', ['$http', Questions])

})();
