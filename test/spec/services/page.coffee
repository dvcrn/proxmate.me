'use strict'

describe 'Service: Page', () ->

  # load the service's module
  beforeEach module 'proxmatemeApp'

  # instantiate service
  Page = {}
  beforeEach inject (_Page_) ->
    Page = _Page_

  it 'should generate the title correctly', () ->
    Page.setTitle('asdf')
    expect(Page.title).toBe 'ProxMate :: asdf'

