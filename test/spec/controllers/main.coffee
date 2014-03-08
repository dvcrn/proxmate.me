'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  MainCtrl = {}
  scope = {}

  pageMethods = ['setTitle', 'setSection', 'finishLoading']
  page = jasmine.createSpyObj('page', pageMethods)

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope,
      Page: page
    }

  it 'should change the page content correctly', () ->
    for pageMethod in pageMethods
      expect(page[pageMethod]).toHaveBeenCalled()