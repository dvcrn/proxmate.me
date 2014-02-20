'use strict'

describe 'Controller: TitleCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  TitleCtrl = {}
  scope = {}
  PageMock = {
    'asdf': 1
  }

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TitleCtrl = $controller 'TitleCtrl', {
      $scope: scope,
      Page: PageMock
    }

  it 'should attach Page object to the scope', () ->
    expect(scope.Page).toBe PageMock
