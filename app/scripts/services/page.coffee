'use strict'

angular.module('proxmatemeApp')
  .factory 'Page', () ->
    # Service logic
    # ...

    titlePrefix = 'ProxMate ::'
    title = "#{titlePrefix} Home"

    # Public API here
    {
      title: title
      setTitle: (newTitle) ->
        @title = "#{titlePrefix} #{newTitle}"
    }
