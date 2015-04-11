'use strict'

angular.module('proxmatemeApp')
  .controller 'PackagesCtrl', ['$scope', '$location', 'dataFactory', 'Page', ($scope, $location, dataFactory, Page) ->
    Page.startLoading('Packages')

    Page.setTitle('Browse available proxy packages')
    Page.setDescription("Check out and browse through the newest packages submitted to ProxMate and download what you like")
    Page.setSection('packages')

    dataFactory.getPackages((packages) ->
      $scope.packages = packages
      Page.setTitle("package listing")
      Page.setPath("https://#{$location.host() + $location.path()}")
      Page.finishLoading()
    )
  ]
