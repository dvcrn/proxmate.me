'use strict'

describe 'Service: config', () ->

  # load the service's module
  beforeEach module 'proxmatemeApp'

  # instantiate service
  config = {}
  beforeEach inject (_config_) ->
    config = _config_

  it 'should do something', () ->
    expect(typeof config).toBe 'object'
