'use strict'

angular.module('proxmatemeApp')
  .controller 'DetailCtrl', ['$scope', '$route', '$routeParams', 'dataFactory', 'Page', ($scope, $params, $routeParams, dataFactory, Page) ->
    Page.setSection('packages')
    Page.startLoading('Package Detail View')

    dataFactory.getPackage($routeParams.packageId, (data) ->
      Page.setTitle("#{data.name} proxy package")
      Page.finishLoading()
      $scope.packageData = data
    )
  ]
