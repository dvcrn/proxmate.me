'use strict'

describe 'Service: config', () ->

  # load the service's module
  beforeEach module 'proxmatemeApp'

  # instantiate service
  config = {}
  beforeEach inject (_config_) ->
    config = _config_

  it 'should be an object', () ->
    expect(typeof config).toBe 'object'
