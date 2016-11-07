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

  .state('tabsController.searchPresent', {
    url: '/search',
    views: {
      'tab2': {
        templateUrl: 'templates/searchPresent.html',
        controller: 'searchPresentCtrl'
      }
    }
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
    url: '/search-results',
    templateUrl: 'templates/searchResults.html',
    controller: 'searchResultsCtrl'
  })

$urlRouterProvider.otherwise('/tabs/search')

  

});