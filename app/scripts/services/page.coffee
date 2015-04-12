'use strict'

angular.module('proxmatemeApp')
  .factory 'Page', ['$location', ($location) ->
    # Service logic
    # ...

    titlePrefix = 'ProxMate -'
    path = "https://proxmate.me/"
    title = "#{titlePrefix} Download for Chrome, Opera and Firefox"
    description = "ProxMate is the worlds first proxy package manager that lives in your browser. Automatically install pre-defined proxy scripts, stay anonymous, mask your IP and more. All that, for free! Download now for Chrome, Firefox and Opera!"

    image = "https://#{$location.host()}/images/proxmate-logo-single.png"

    section = 'home'

    loadingPrefix = "Loading"
    loadingText = 'Loading...'
    isLoading = false


    # Public API here
    {
      title: title
      setTitle: (newTitle, absolute) ->
        absolute = absolute || false

        @title = "#{titlePrefix} #{newTitle}"
        if absolute
          @title = newTitle

      description: description
      setDescription: (newDescription) ->
        @description = newDescription

      image: image
      setImage: (newImage, absolute) ->
        absolute = absolute || false
        @image = "https://#{$location.host()}/#{newImage}"

        if absolute
          @image = newImage


      path: path
      setPath: (newPath) ->
        @path = newPath

      section: section
      setSection: (newSection) ->
        @section = newSection.toLowerCase()

      isLoading: isLoading
      loadingText: loadingText
      startLoading: (text) ->
        @loadingText = "#{loadingPrefix} #{text}..."
        @isLoading = true
        @description = description
        @image = image
        @title = title
        @path = "https://#{$location.host() + $location.path()}"
      finishLoading: ->
        @isLoading = false
    }
  ]
