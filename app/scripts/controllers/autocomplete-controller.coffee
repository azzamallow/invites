'use strict'

angular.module('invitesApp')
  .controller 'AutocompleteCtrl', ($scope, $element) ->
    $scope.$watch 'searchTerm', (searchTerm) ->
      if !!searchTerm
        $scope.results = $scope.remoteData
      else 
        $scope.results = []

    $scope.selectNext = ->
      $scope.$apply ->
        if !$scope.index?
          $scope.index = 0
        else
          $scope.index = Math.min $scope.results.length - 1, $scope.index + 1
        $scope.selectedItem = $scope.results[$scope.index]

    $scope.selectPrevious = ->
      $scope.$apply ->
        return if !$scope.index?
        $scope.index = Math.max 0, $scope.index - 1
        $scope.selectedItem = $scope.results[$scope.index]

    $scope.selectMe = (choice) ->
      $scope._reset()
      $element.children()[0].focus()
      $scope.itemsChosen.push choice
      $scope.index = null

    $scope.hoverMe = (choice) ->
      $scope.index = $scope.results[choice]
      $scope.selectedItem = choice

    $scope._reset = ->
      $scope.selectedItem = null
      $scope.searchTerm = ''