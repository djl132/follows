
// STORE QUESTIONS adn CALL GET/POST METHODS DB DATA IN A SERVICE OBJECT.
(function(){

  console.log("groups service is loaded")

    function Groups($http){
      var o = { groups: []};

      // get all posts, and update SERVICE OBJECT(FRONTEND)
      o.getAll = function() {
         return $http.get('/groups.json').then(function(groups){
           console.log(groups.data)
// COPY RESPONSE DATA INTO SERVICES
           angular.copy(groups.data, o.groups);
         }
       };

       o.get = function(id) {
          return $http.get('/groups/' + id + '.json').then(function(group){
            console.log("it is getting a single group view")
            return group.data;
          });
        };

       o.create = function(group){
        //  send question to BACKEND API
         return $http.post('/groups.json', group).then(function(group){
          //  update frontend if backend adds question
           o.groups.push(group.data);
         })
       };


       return o;
    };

angular
  .module('dunno')
  .factory('groups', ['$http', Groups])

})();
