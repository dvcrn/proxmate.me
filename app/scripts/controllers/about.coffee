'use strict'

angular.module('proxmatemeApp')
  .controller 'AboutCtrl', ['$scope', '$location', 'Page', ($scope, $location, Page) ->
    Page.startLoading("About Page")
    Page.setSection('about')
    Page.setTitle('About our project')
    Page.setDescription("Learn more about the behind the scenes of the ProxMate project and support us on github!")
    Page.setPath("https://#{$location.host() + $location.path()}")
    Page.finishLoading()
  ]
