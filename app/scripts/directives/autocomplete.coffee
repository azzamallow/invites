'use strict'

angular.module('invitesApp')
  .directive 'autocomplete', ->
    restrict: 'E'
    replace: true
    scope:
      remoteData: '='
      placeholder: '@placeholder'
      itemsChosen: '='
    template: '<div class="dropdown search" ng-class="{open: _choices.length>0}">' + 
        '     <input type="text" ng-model="searchTerm" placeholder="{{placeholder}}" /> ' + 
        '     <ul class="dropdown-menu"> ' + 
        '         <li ng-repeat="choice in _choices" ng-class="{active: selectedItem == choice}" ng-mouseover="hoverMe(choice)">' + 
        '          <a href="javascript:void(0);" ng-click="selectMe(choice)">{{choice}}</a></li>' + 
        '     </ul>' + 
        '</div>'
    controller: ($scope, $element, $attrs) ->
      $scope.$watch 'searchTerm', (searchTerm) ->
        if !!searchTerm
          $scope._choices = $scope.remoteData
        else 
          $scope._choices = []

      $scope.selectNext = ->
        $scope.$apply ->
          if !$scope.index?
            $scope.index = 0
          else
            $scope.index = Math.min $scope._choices.length - 1, $scope.index + 1
          $scope.selectedItem = $scope._choices[$scope.index]

      $scope.selectPrevious = ->
        $scope.$apply ->
          return if !$scope.index?
          $scope.index = Math.max 0, $scope.index - 1
          $scope.selectedItem = $scope._choices[$scope.index]

      $scope.selectMe = (choice) ->
        $scope._reset()
        $element.children()[0].focus()
        $scope.itemsChosen.push choice
        $scope.index = null

      $scope.hoverMe = (choice) ->
        $scope.index = $scope._choices[choice]
        $scope.selectedItem = choice

      $scope._reset = ->
        $scope.selectedItem = null
        $scope.searchTerm = ''

    link: ($scope, iElement, iAttrs, controller) ->
      searchInput = angular.element(iElement.children()[0])
      searchInput.bind 'blur', -> $scope._reset()

      searchInput.bind 'keydown', (event) ->
          switch (event.keyCode)
            when 38 then $scope.selectPrevious()
            when 40 then $scope.selectNext()
            when 13 then $scope.$apply ->
              $scope.selectMe($scope.selectedItem)
            when 108 then console.log('Enter pressed');
            when 32 then console.log('Space pressed');
            when 37 then console.log('Escape Pressed');