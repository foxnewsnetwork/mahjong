(function(){
  var requirements;
  requirements = ['rooms/controller'];
  define('config/router', requirements, function(RoomsCtrl){
    var Router;
    return Router = (function(){
      Router.displayName = 'Router';
      var prototype = Router.prototype, constructor = Router;
      function Router(app){
        this.app = app;
        this.establish_controllers();
        this.establish_routes();
      }
      prototype.establish_controllers = function(){
        return this.rooms_ctrl = new RoomsCtrl(this.app);
      };
      prototype.establish_routes = function(){
        var r;
        r = app.when('/', {
          controller: this.rooms_ctrl.index,
          templateUrl: "views/rooms/index.html"
        });
        return r.otherwise({
          redirectTo: '/'
        });
      };
      return Router;
    }());
  });
}).call(this);
