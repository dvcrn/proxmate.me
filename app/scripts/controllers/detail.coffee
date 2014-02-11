'use strict'

angular.module('proxmatemeApp')
  .controller 'DetailCtrl', ['$scope', '$route', '$routeParams', 'dataFactory', ($scope, $params, $routeParams, dataFactory) ->
    console.info $routeParams.packageId

    dataFactory.getPackage($routeParams.packageId, (data) ->
      $scope.packageData = data
      console.info data
    )

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
  ]
