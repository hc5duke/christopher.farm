root = exports ? this

root.myApp = angular.module('myApp', [])

root.MyCtrl = ($scope) ->
  $scope.test = 'hello'
