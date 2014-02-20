'use strict'

angular.module('proxmatemeApp')
  .controller 'TitleCtrl', ['$scope', 'Page', ($scope, Page) ->
    $scope.Page = Page;
  ]
