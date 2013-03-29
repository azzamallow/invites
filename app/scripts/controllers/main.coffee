'use strict'

angular.module('invitesApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.invited = []
    $scope.options = [ 'Aaron', 'Luke', 'Carol', 'Spiro' ] 