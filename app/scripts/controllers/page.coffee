'use strict'

angular.module('proxmatemeApp')
  .controller 'PageCtrl', ['$rootScope', 'Analytics', 'Page', ($rootScope, Analytics, Page) ->
    $rootScope.Page = Page;
  ]
