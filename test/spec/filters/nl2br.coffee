'use strict'

describe 'Filter: nl2br', () ->

  # load the filter's module
  beforeEach module 'proxmatemeApp'

  # initialize a new instance of the filter before each test
  nl2br = {}
  beforeEach inject ($filter) ->
    nl2br = $filter 'nl2br'

  it 'should replace newlines with <br/> tags"', () ->
    text = 'angularjs\nis\nawesome'
    expect(nl2br text).toBe ('angularjs<br/>is<br/>awesome')
