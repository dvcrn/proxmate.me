'use strict'

angular.module('proxmatemeApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
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
