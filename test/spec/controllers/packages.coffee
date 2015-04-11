'use strict'

describe 'Controller: PackagesCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  PackagesCtrl = {}
  scope = {}
  pageMethods = ['setTitle', 'setSection', 'startLoading', 'finishLoading', 'setPath', 'setDescription']
  page = jasmine.createSpyObj('page', pageMethods)

  dataFactoryMock = jasmine.createSpyObj('dataFactory', ['getPackages'])
  dataFactoryMock.getPackages.andCallFake (callback) ->
    callback 'foo'


  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PackagesCtrl = $controller 'PackagesCtrl', {
      $scope: scope,
      Page: page,
      dataFactory: dataFactoryMock
    }

  it 'should change the title of the page', () ->
    for pageMethod in pageMethods
      expect(page[pageMethod]).toHaveBeenCalled()
