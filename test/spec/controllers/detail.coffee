'use strict'

describe 'Controller: DetailCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  DetailCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DetailCtrl = $controller 'DetailCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
