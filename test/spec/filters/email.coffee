'use strict'

describe 'Filter: email', () ->

  # load the filter's module
  beforeEach module 'invitesApp'

  # initialize a new instance of the filter before each test
  email = {}
  beforeEach inject ($filter) ->
    email = $filter 'email'

  it 'should return the input prefixed with "email filter:"', () ->
    text = 'angularjs'
    expect(email text).toBe ('email filter: ' + text);
