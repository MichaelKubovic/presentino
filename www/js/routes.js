angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    
  

  .state('tabsController', {
    url: '/tabs',
    templateUrl: 'templates/tabsController.html',
    abstract:true
  })

  .state('searchPresent', {
    url: '/search',
    templateUrl: 'templates/searchPresent.html',
    controller: 'searchPresentCtrl'
  })

  .state('tabsController.history', {
    url: '/history',
    views: {
      'tab3': {
        templateUrl: 'templates/history.html',
        controller: 'historyCtrl'
      }
    }
  })

  .state('searchResults', {
    cache: false,
    url: '/search-results',
    params: {
      holiday: null,
      gender: null,
      age: null,
    },
    templateUrl: 'templates/searchResults.html',
    controller: 'searchResultsCtrl'
  })

  .state('showPresent', {
    url: '/show/:id', // TODO: add {id} param
    templateUrl: 'templates/showPresent.html',
    controller: 'showPresentCtrl'
  })

$urlRouterProvider.otherwise('/search')

  

});