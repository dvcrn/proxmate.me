'use strict'

describe 'Controller: DetailCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  DetailCtrl = {}
  scope = {}
  $httpBackend = {}
  config = {}
  dataFactory = {}
  getPackageSpy = {}

  pageMethods = ['setTitle', 'setSection', 'startLoading', 'finishLoading']
  pageSpy = jasmine.createSpyObj('page', pageMethods)
  testPackage = {
    "name": "Test Package 2",
    "description": "Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.",
    "smallIcon": "https://proxmatedavecx.s3.amazonaws.com/service_imgs/pandora.png",
    "bigIcon": "https://proxmatedavecx.s3.amazonaws.com/service_imgs/pandora.png",
    "screenshots": [
      "https://photos-5.dropbox.com/t/0/AADLVMgInaLkelem7hb6rANO6AhzwoeigPiHy-7UpbYgmA/12/27953127/png/1024x768/3/1392375600/0/2/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202014-02-14%2018.33.25.png/owx93-1LSNjEVRAKmVnKkub6GEPBowFOXEXVlZrO4Ko"
    ]
    "pageUrl": "http://google.com",

    "_id": "1337",
    "version": 2,
    "user": "52e51a98217d32e2270e211f",
    "country": "52e5c40294ed6bd4032daa49",

    "createdAt": new Date(1390790046874).getTime(),
    "routing": [
      {
        "startsWith": "http://www.beatsmusic.com",
        "contains": [],
        "host": ""
      },
      {
        "startsWith": "",
        "contains": ['beatsmusic.com', 'drdresux'],
        "host": ""
      },
      {
        "startsWith": "",
        "contains": [],
        "host": "drdudu.com"
      }
    ],
    "hosts": [
      "pandora.com",
      "*.pandora.com"
    ]
  }

  configMock = {
    'DISQUS_SHORTNAME': 'foo'
  }

  locationMock = {
    path: ->
      return 'foo'

    host: ->
      return 'abc.de/'
  }

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, _$httpBackend_, _config_, $rootScope, _dataFactory_) ->
    $httpBackend = _$httpBackend_
    config = _config_
    dataFactory = _dataFactory_

    getPackageSpy = spyOn(dataFactory, 'getPackage').andCallFake((param, callback) ->
      callback(testPackage)
    )

    routeParamMock = jasmine.createSpy('$routeParams')
    routeParamMock.packageId = 'asdf'

    scope = $rootScope.$new()
    DetailCtrl = $controller 'DetailCtrl', {
      $scope: scope
      $routeParams: routeParamMock,
      Page: pageSpy,
      config: configMock,
      $location: locationMock
    }

  it 'should call dataFactory with the routing param', () ->
    expect(getPackageSpy).toHaveBeenCalledWith('asdf', jasmine.any(Function))

  it 'should fill the scope with the correct data', () ->
    expect(scope.packageData).toBe testPackage
    expect(scope.disqusShortname).toBe 'foo'
    expect(scope.disqusUrl).toBe 'http://abc.de/foo'

  it 'should change the page body correctly', () ->
    for pageMethod in pageMethods
      expect(pageSpy[pageMethod]).toHaveBeenCalled()

    expect(pageSpy.setTitle).toHaveBeenCalledWith('Test Package 2 proxy package')