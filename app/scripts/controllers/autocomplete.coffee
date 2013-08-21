'use strict'

angular.module('invitesApp')
  .controller 'AutocompleteCtrl', ($scope) ->
    index = null

    reset = ->
      $scope.selectedItem = null
      $scope.searchTerm = ''
      index = -1

    reset()

    $scope.$watch 'searchTerm', (searchTerm) ->
      if !!searchTerm
        $scope.results = $scope.remoteData
      else 
        $scope.results = []

    $scope.selectNext = ->
      index = Math.min $scope.results.length - 1, index + 1
      $scope.selectedItem = $scope.results[index]

    $scope.selectPrevious = ->
      return if index < 0
      index = Math.max 0, index - 1
      $scope.selectedItem = $scope.results[index]

    $scope.selectMe = (choice) ->
      $scope.itemsChosen.push choice
      reset()

    $scope.hoverMe = (choice) ->
      index = $scope.results[choice]
      $scope.selectedItem = choice