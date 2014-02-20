'use strict'

angular.module('proxmatemeApp')
  .controller 'DetailCtrl', ['$scope', '$route', '$routeParams', 'dataFactory', ($scope, $params, $routeParams, dataFactory) ->

    dataFactory.getPackage($routeParams.packageId, (data) ->
      # console.info data
      $scope.packageData = data
    )
  ]
