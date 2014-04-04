'use strict'

angular.module('proxmatemeApp')
  .controller 'AboutCtrl', ['$scope', 'Page', ($scope, Page) ->
    Page.setSection('about')
    Page.setTitle('About the project')
    Page.finishLoading()
  ]
