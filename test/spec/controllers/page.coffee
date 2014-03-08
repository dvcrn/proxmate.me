'use strict'

describe 'Controller: PageCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  PageCtrl = {}
  scope = {}
  PageMock = {
    'asdf': 1
  }

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PageCtrl = $controller 'PageCtrl', {
      $scope: scope,
      Page: PageMock
    }

  it 'should attach Page object to the scope', () ->
    expect(scope.Page).toBe PageMock
