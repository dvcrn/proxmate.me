'use strict'

angular.module('proxmatemeApp')
  .controller 'DetailCtrl', ['$scope', '$route', '$routeParams', 'dataFactory', 'Page', 'config', '$location', ($scope, $params, $routeParams, dataFactory, Page, config, $location) ->
    Page.setSection('packages')
    Page.startLoading('Package Detail View')

    dataFactory.getPackage($routeParams.packageId, (data) ->
      $scope.packageData = data
      $scope.disqusUrl = "http://#{$location.host() + $location.path()}"
      $scope.disqusShortname = config.DISQUS_SHORTNAME
      Page.setTitle("#{data.name} proxy package")
      Page.finishLoading()
    )
  ]
