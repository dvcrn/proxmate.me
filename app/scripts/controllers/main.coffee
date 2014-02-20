'use strict'

angular.module('proxmatemeApp')
  .controller 'MainCtrl', ['$scope', 'dataFactory', ($scope, dataFactory) ->
    dataFactory.getPackages((deta) ->
      # console.info deta
    )

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
  ]