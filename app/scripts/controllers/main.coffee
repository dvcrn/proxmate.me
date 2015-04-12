'use strict'

angular.module('proxmatemeApp')
  .controller 'MainCtrl', ['$scope', '$location', 'dataFactory', 'Page', ($scope, $location, dataFactory, Page) ->
    Page.startLoading "Download Page"
    Page.setSection('home')
    Page.finishLoading()
  ]
