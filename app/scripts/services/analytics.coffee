'use strict'

angular.module('proxmatemeApp')
  .service 'Analytics', ['$rootScope', '$window', '$location', '$timeout', ($rootScope, $window, $location, $timeout) ->
    track = ->
      $timeout(->
        $window.ga('send', 'pageview', { page: $location.path() })
      , 500)

    $rootScope.$on('$viewContentLoaded', track)
  ]
