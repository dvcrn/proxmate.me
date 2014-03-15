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
    $locationProvider.html5Mode(true)

    # Temporary code for redirecting hashes to new urls
    # TODO: remove me once browser extension is updated to new endpoints
    if (window.location.hash.indexOf("#!") != -1)
      window.location = window.location.hash.substr(2)

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
      .when '/about',
        templateUrl: 'views/comingsoon.html'
      .when '/donate',
        templateUrl: 'views/comingsoon.html'
      .otherwise
        redirectTo: '/'
