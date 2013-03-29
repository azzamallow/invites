'use strict'

angular.module('invitesApp')
  .filter 'email', ->
    (input) -> 
      input if input? && input.match /\S+@\S+\.\S+/