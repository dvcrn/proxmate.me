'use strict'

angular.module('proxmatemeApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'angular-carousel'
])
  .config ($locationProvider, $routeProvider) ->
    $locationProvider.hashPrefix('!')

    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/packages',
        templateUrl: 'views/packages.html'
        controller: 'PackagesCtrl'
      .when '/package/:packageId',
        templateUrl: 'views/detail.html'
        controller: 'DetailCtrl'
      .otherwise
        redirectTo: '/'
