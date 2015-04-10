'use strict'

angular.module('proxmatemeApp')
  .controller 'AboutCtrl', ['$scope', '$location', 'Page', ($scope, $location, Page) ->
    Page.setSection('about')
    Page.setTitle('About the project')
    Page.setPath("https://#{$location.host() + $location.path()}")
    Page.finishLoading()
  ]
