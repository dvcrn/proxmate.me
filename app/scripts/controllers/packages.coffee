'use strict'

angular.module('proxmatemeApp')
  .controller 'PackagesCtrl', ['$scope', 'dataFactory', 'Page', ($scope, dataFactory, Page) ->
    Page.setTitle('Package Listing')
    Page.setSection('packages')
    Page.startLoading('Packages')

    dataFactory.getPackages((packages) ->
      $scope.packages = packages
      Page.finishLoading()
    )
  ]