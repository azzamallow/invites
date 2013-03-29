'use strict'

angular.module('invitesApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.invited = [ 'Aaron' ]
    $scope.options = [ 'Aaron', 'Luke', 'Carol', 'Spiro' ] 