'use strict'

angular.module('proxmatemeApp')
  .filter 'nl2br', () ->
    (input) ->
      input.replace(/\n/g, '<br/>')
