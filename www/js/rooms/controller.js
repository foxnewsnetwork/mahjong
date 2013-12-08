(function(){
  var requirements;
  requirements = [];
  define('rooms/controller', requirements, function(){
    var RoomsController;
    return RoomsController = (function(){
      RoomsController.displayName = 'RoomsController';
      var prototype = RoomsController.prototype, constructor = RoomsController;
      prototype.index = function($scope){
        return $scope.whatever = "dog";
      };
      function RoomsController(app){
        this.index.$inject = ['$scope'];
        app.controller('RoomsCtrl#index', this.index);
      }
      return RoomsController;
    }());
  });
}).call(this);
