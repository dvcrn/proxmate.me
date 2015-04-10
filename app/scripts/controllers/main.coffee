'use strict'

angular.module('proxmatemeApp')
  .controller 'MainCtrl', ['$scope', '$location', 'dataFactory', 'Page', ($scope, $location, dataFactory, Page) ->
    Page.setSection('home')
    Page.setTitle('Proxy on steroids!')
    Page.setPath("https://#{$location.host() + $location.path()}")
    Page.finishLoading()
  ]
