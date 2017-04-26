
// STORE QUESTIONS adn CALL GET/POST METHODS DB DATA IN A SERVICE OBJECT.
(function(){

    function Follows($http){
      var followService = { follows: []};


      // get all posts, and update SERVICE OBJECT(FRONTEND)
      followService.getAll = function() {
         return $http.get('/api/v1/followings.json').then(function(f){
           console.log(f.data)
// COPY RESPONSE DATA INTO SERVICES
           angular.copy(f.data, followService.follows);

         });
       };

       followService.create = function(question){
        //  send question to BACKEND API
         return $http.post('/api/v1/questions/' + question.id + '/followings.json')
          //  update frontend if backend adds question

       };

       followService.destroy = function(question){
        //  send question to BACKEND API
        return $http.delete('/api/v1/questions/' + question.id + '/followings/' + follow.id + '.json').then(function(q){
           console.log('successfully deleted')
          //  update frontend if backend adds question
         })
       };

       return followService;
    }

angular
  .module('dunno')
  .factory('follows', ['$http', Follows])

})();
