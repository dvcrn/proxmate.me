'use strict'

describe 'Service: dataFactory', () ->

  # load the service's module
  beforeEach module 'proxmatemeApp'

  # instantiate service
  dataFactory = {}
  $httpBackend = {}
  config = {}

  beforeEach inject (_dataFactory_, _$httpBackend_, _config_) ->
    dataFactory = _dataFactory_
    $httpBackend = _$httpBackend_
    config = _config_

    # Overwrite API host so we can test it
    config.API_HOST = 'google.de'

    $httpBackend.when('GET', 'google.de/package/list.json').respond({});

  it 'should call the server api and execute callback', () ->
    $httpBackend.expectGET('google.de/package/list.json').respond(200)
    spy = jasmine.createSpy()
    dataFactory.getPackages(spy)
    $httpBackend.flush()

    expect(spy).toHaveBeenCalled()
