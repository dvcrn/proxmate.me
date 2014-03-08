'use strict'

angular.module('proxmatemeApp')
  .controller 'MainCtrl', ['$scope', 'dataFactory', 'Page', ($scope, dataFactory, Page) ->
    Page.setSection('home')
    Page.setTitle('Proxy on steroids!')
    Page.finishLoading()
  ]