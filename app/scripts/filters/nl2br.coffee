'use strict'

angular.module('proxmatemeApp')
  .filter 'nl2br', () ->
    (input) ->
      if input
        input.replace(/\n/g, '<br/>')
