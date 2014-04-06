'use strict'

angular.module('proxmatemeApp')
  .controller 'SupportCtrl', ['$scope', 'Page', ($scope, Page) ->
    Page.setSection('support')
    Page.setTitle('Support ProxMate')
    Page.finishLoading()
  ]
