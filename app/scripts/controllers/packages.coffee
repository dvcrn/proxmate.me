'use strict'

angular.module('proxmatemeApp')
  .controller 'PackagesCtrl', ['$scope', 'dataFactory', ($scope, dataFactory) ->
    dataFactory.getPackages((packages) ->
      $scope.packages = packages
    )

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
  ]