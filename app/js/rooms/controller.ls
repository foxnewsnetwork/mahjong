requirements = []
define 'rooms/controller', requirements, ->
  class RoomsController
    index: ($scope) ->
      $scope.whatever = "dog"
    (app) ->
      @index.$inject = ['$scope']
      app.controller 'RoomsCtrl#index', @index