'use strict'

describe 'Service: Page', () ->

  # load the service's module
  beforeEach module 'proxmatemeApp'

  # instantiate service
  Page = {}
  beforeEach inject (_Page_) ->
    Page = _Page_

  it 'should generate the title correctly', () ->
    expect(Page.title).toBe 'ProxMate :: Home'

    Page.setTitle('asdf')
    expect(Page.title).toBe 'ProxMate :: asdf'

  it 'should set the page section correctly', ->
    expect(Page.section).toBe 'home'

    Page.setSection('AsDfGh')
    expect(Page.section).toBe 'asdfgh'

  it 'should handle the loadingindicator correctly', ->
    expect(Page.isLoading).toBe false
    expect(Page.loadingText).toBe 'Loading...'

    Page.startLoading('asdf')
    expect(Page.isLoading).toBe true
    expect(Page.loadingText).toBe 'Loading asdf...'

    Page.finishLoading()
    expect(Page.isLoading).toBe false