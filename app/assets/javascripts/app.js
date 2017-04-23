
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
    .state('home', {
        url:'/',
        templateUrl: 'home/_home.html',
        controller:'HomeCtrl',
        resolve: {
          // get real-time questions from backend
          getQuestionsForFeed: ['questions', function(questions){
            return questions.getAll();
          }]
        }

  })

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

    .state('questions', {
        url:'/questions/{id}',
        templateUrl: 'questions/_question.html',
        controller: 'QuestionsCtrl',
        resolve: {
          question: ['$stateParams', 'questions', function($stateParams, questions) {
            console.log($stateParams.id)
            return questions.get($stateParams.id);
          }]
        }//SIMPLY TELLS VIEW OF STATE WHICH CONTROLLER TO USE, DOES NOT GIVE IT ACCESS
    })

  // $urlRouterProvider.otherwise('home');

    };


  angular.module('dunno',['templates','Devise','ui.router'])
  .config(config)

})();
