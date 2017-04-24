
(function(){


  function config($locationProvider, $stateProvider) {

  //PROVIDES RULES ABOUT HOW TO DISPLAY LOCATION url info?
  $locationProvider
    .html5Mode({
      enabled:true,//prevent hashbang - humanly readable form easier to parse path info.
      requireBase: false
  });

  //configures EACH component(MVCs) OF THE APP based on states
  //$stateProvider.state(stateName, stateConfig)
  //stateName is a unique string that identifies a state and stateConfig is an object that defines specific properties of the state.
  $stateProvider //METHOD-CHAINING

  .state('login', {
   url: '/login',
   templateUrl: 'auth/_login.html',
   controller: 'AuthCtrl',
   onEnter: ['$state', 'Auth', function($state, Auth) {
     if (Auth.isAuthenticated()){
     Auth.currentUser().then(function (){
       $state.go('home');
     })
   }
 }]
 })
 .state('register', {
   url: '/register',
   templateUrl: 'auth/_register.html',
   controller: 'AuthCtrl',
   onEnter: ['$state', 'Auth', function($state, Auth) {
     if (Auth.isAuthenticated()){
     Auth.currentUser().then(function (){
       $state.go('home');
     })
   }
 }]
})
    .state('home', {
        url:'/',
        templateUrl: 'home/_home.html',
        controller:'HomeCtrl',
        resolve: {
          // get real-time questions from backend
          questionPromise: ['questions', function(questions){
            return questions.getAll();
          }]
        }

  })
    .state('question', {
        url:'/questions/{id}',
        templateUrl: 'questions/_question.html',
        controller: 'QuestionsCtrl',
        resolve: {
          question: ['$stateParams', 'questions','answers', function($stateParams, questions, answers) {
            return questions.get($stateParams.id);
          }]
        }//SIMPLY TELLS VIEW OF STATE WHICH CONTROLLER TO USE, DOES NOT GIVE IT ACCESS
    })
    .state('groups', {
        url:'/groups',
        templateUrl: 'groups/_groups.html',
        controller: 'GroupsCtrl',
        resolve: {
          groupsPromise: ['groups', function(groups) {
            return groups.getAll();
          }]
        }//SIMPLY TELLS VIEW OF STATE WHICH CONTROLLER TO USE, DOES NOT GIVE IT ACCESS
    })
    // .state('group', {
    //     url:'/groups/{id}',
    //     templateUrl: 'groups/_group.html',
    //     controller: 'GroupCtrl',
    //     resolve: {
    //       group: ['$stateParams', 'groups', function($stateParams, groups) {
    //
    //         return groups.get($stateParams.id);
    //       }]
    //     }//SIMPLY TELLS VIEW OF STATE WHICH CONTROLLER TO USE, DOES NOT GIVE IT ACCESS
    // });


    };


  angular.module('dunno',['templates','Devise', 'ui.router'])
  .config(config)

})();
