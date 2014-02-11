'use strict'

describe 'Controller: PackagesCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  PackagesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PackagesCtrl = $controller 'PackagesCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
