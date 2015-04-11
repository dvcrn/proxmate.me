'use strict'

describe 'Controller: AbouCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  MainCtrl = {}
  scope = {}

  pageMethods = ['setTitle', 'setSection', 'finishLoading', 'setPath']
  page = jasmine.createSpyObj('page', pageMethods)

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $location) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'AboutCtrl', {
      $scope: scope,
      Page: page,
      $location: $location
    }

  it 'should change the page content correctly', () ->
    for pageMethod in pageMethods
      expect(page[pageMethod]).toHaveBeenCalled()
