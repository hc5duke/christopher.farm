root = exports ? this

console.log root

root.myApp = angular.module('myApp', [])

root.MyCtrl = ($scope) ->
  $scope.test = 'hello'
