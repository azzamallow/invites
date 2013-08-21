'use strict'

angular.module('invitesApp')
  .directive 'autocomplete', ->
    restrict: 'E'
    replace: true
    scope:
      remoteData: '='
      placeholder: '@'
      itemsChosen: '='
      itemTemplate: '@'
    templateUrl: 'views/autocomplete.html'
    controller: 'AutocompleteCtrl'
    link: (scope, iElement) ->
      searchInput = angular.element(iElement.children()[0])
      searchInput.bind 'keydown', (event) ->
        switch event.keyCode
          when 38 then scope.$apply -> scope.selectPrevious()
          when 40 then scope.$apply -> scope.selectNext()
          when 13 then scope.$apply -> scope.selectMe(scope.selectedItem) if scope.selectedItem?