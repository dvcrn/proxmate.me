'use strict'

angular.module('proxmatemeApp')
  .factory 'Page', () ->
    # Service logic
    # ...

    titlePrefix = 'ProxMate ::'
    title = "#{titlePrefix} Home"

    section = 'home'

    loadingPrefix = "Loading"
    loadingText = 'Loading...'
    isLoading = false

    # Public API here
    {
      title: title
      setTitle: (newTitle) ->
        @title = "#{titlePrefix} #{newTitle}"

      section: section
      setSection: (newSection) ->
        @section = newSection.toLowerCase()

      isLoading: isLoading
      loadingText: loadingText
      startLoading: (text) ->
        @loadingText = "#{loadingPrefix} #{text}..."
        @isLoading = true

      finishLoading: ->
        @isLoading = false
    }
