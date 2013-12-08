(function(){
  var requirements;
  requirements = ['rooms/directive'];
  define('rooms/controller/index', [], function(){
    return function($scope){
      return $scope.thing = "dogs";
    };
  });
}).call(this);
