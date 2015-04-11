'use strict'

describe 'Service: Page', () ->

  # load the service's module
  beforeEach module 'proxmatemeApp'

  # instantiate service
  Page = {}


  beforeEach ->
    locationMock = {
      host: ->
        return 'abc.de'
    }

    module ($provide) ->
      $provide.value('$location', locationMock)
      return

    inject (_Page_) ->
      Page = _Page_

  it 'should generate the title correctly', () ->
    expect(Page.title).toBe 'ProxMate - Download for Chrome, Opera and Firefox'

    Page.setTitle('asdf')
    expect(Page.title).toBe 'ProxMate - asdf'

    Page.setTitle('asdf', true)
    expect(Page.title).toBe 'asdf'

  it 'should set the page infos correctly', ->
    expect(Page.section).toBe 'home'
    Page.setSection('AsDfGh')
    expect(Page.section).toBe 'asdfgh'

    expect(Page.description).toBe 'ProxMate is the worlds first proxy package manager that lives in your browser. Automatically install pre-defined proxy scripts, stay anonymous, mask your IP and more. All that, for free! Download now for Chrome, Firefox and Opera!'
    Page.setDescription('asdfgh')
    expect(Page.description).toBe 'asdfgh'

    Page.setImage('home.jpg')
    expect(Page.image).toBe 'https://abc.de/home.jpg'

    Page.setImage('home.jpg', true)
    expect(Page.image).toBe 'home.jpg'

    expect(Page.path).toBe 'https://proxmate.me/'
    Page.setPath('https://proxmate.me/somethingelse/')
    expect(Page.path).toBe 'https://proxmate.me/somethingelse/'



  it 'should handle the loadingindicator correctly', ->
    expect(Page.isLoading).toBe false
    expect(Page.loadingText).toBe 'Loading...'

    Page.startLoading('asdf')
    expect(Page.isLoading).toBe true
    expect(Page.loadingText).toBe 'Loading asdf...'

    Page.finishLoading()
    expect(Page.isLoading).toBe false
