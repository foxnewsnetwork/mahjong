(function(){
  "use strict";
  var requirements;
  requirements = ["config/router", "angular", "angular-resource", "angular-cookies", "angular-sanitize"];
  require(requirements, function(Router){
    var app;
    app = angular.module("mahjongApp", []);
    return new Router(app);
  });
}).call(this);
