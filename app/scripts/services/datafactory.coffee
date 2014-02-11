'use strict'

angular.module('proxmatemeApp')
  .factory 'dataFactory', ['$http', 'config', ($http, config) ->

    meaningOfLife = 42

    # Public API here
    {
      someMethod: () ->
        meaningOfLife

      getPackages: (callback) ->
        $http.get("#{config.API_HOST}/package/list.json").success(callback)

      getPackage: (id, callback) ->
        $http.get("#{config.API_HOST}/package/#{id}.json").success(callback)
    }
  ]