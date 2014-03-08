'use strict'

describe 'Service: Analytics', () ->

  # load the service's module
  beforeEach module 'proxmatemeApp'

  # instantiate service
  Analytics = {}
  scope = {}
  window = {}
  location = {}
  timeout = {}

  beforeEach ->

    module(($provide) ->
      timeout = jasmine.createSpy('timeout spy').andCallFake((callback) -> callback())
      $provide.value('$timeout', timeout)
      return
    )

    inject (_Analytics_, $rootScope, $window, $location) ->
      console.info 'fooo'
      Analytics = _Analytics_
      scope = $rootScope
      window = $window
      location = $location

  it 'should call window.ga on page Event', () ->
    window.ga = ->

    locationMock = spyOn(location, 'path').andReturn('foo')
    ga = spyOn(window, 'ga').andReturn('bar')

    scope.$broadcast('$viewContentLoaded')
    expect(ga).toHaveBeenCalled()
