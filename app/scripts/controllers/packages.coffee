'use strict'

angular.module('proxmatemeApp')
  .controller 'PackagesCtrl', ['$scope', '$location', 'dataFactory', 'Page', ($scope, $location, dataFactory, Page) ->
    Page.setTitle('Package Listing')
    Page.setSection('packages')
    Page.startLoading('Packages')

    dataFactory.getPackages((packages) ->
      $scope.packages = packages
      Page.setTitle("package listing")
      Page.setDescription("Check out the newest packages submitted to ProxMate and download what you like :)")
      Page.setPath("https://#{$location.host() + $location.path()}")
      Page.finishLoading()
    )
  ]
