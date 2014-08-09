'use strict'

angular.module('proxmatemeApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'angular-carousel',
  'angularUtils.directives.dirDisqus'
])
  .config ($locationProvider, $routeProvider) ->
    $locationProvider.hashPrefix('!')
    $locationProvider.html5Mode(true)

    # Temporary code for redirecting hashes to new urls
    # TODO: remove me once browser extension is updated to new urls
    if (window.location.hash.indexOf("#!") != -1)
      window.location = window.location.hash.substr(2)

    $routeProvider
      .when '/',
        templateUrl: '/views/main.html'
        controller: 'MainCtrl'
      .when '/packages/',
        templateUrl: '/views/packages.html'
        controller: 'PackagesCtrl'
      .when '/package/:packageId/',
        templateUrl: '/views/detail.html'
        controller: 'DetailCtrl'
      .when '/about/',
        templateUrl: '/views/about.html'
        controller: 'AboutCtrl'
      .when '/support/',
        templateUrl: '/views/support.html'
        controller: 'SupportCtrl'
      .when '/donate/',
        redirectTo: '/support'
      .otherwise
        redirectTo: '/'
