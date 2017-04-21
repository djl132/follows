
// STORE QUESTIONS adn CALL GET/POST METHODS DB DATA IN A SERVICE OBJECT.

(function(){

    function Questions($http){
      var o = { questions: []};


      // get all posts, and update SERVICE OBJECT(FRONTEND)
      o.getAll = function() {
         return $http.get('/questions.json').success(function(data){
           angular.copy(data, o.questions);
         });
       };

//        o.get = function(id) {
//           return $http.get('/questions/' + id + '.json').then(function(res){
//             return res.data;
//           });
//         };
//
      //  o.create = function(question){
      //   //  send question to BACKEND API
      //    return $http.post('/questions.json', question).success(function(data){
      //     //  update frontend if backend adds question
      //      o.questions.push(data);
      //    })
      //  }
// // add new answer to a question
//        o.addAnswer = function(id, answer) {
//          return $http.post('/questions/' + id + '/answers.json', answer)
//          }

       return o;
    }

angular
  .module('dunno')
  .factory('questions', ['$http', Questions])

})();
