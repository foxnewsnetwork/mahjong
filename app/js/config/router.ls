requirements = [
  'rooms/controller'
]

define 'config/router', requirements, (RoomsCtrl) ->
  class Router
    (app) ->
      @app = app
      @establish_controllers!
      @establish_routes!
    establish_controllers: ->
      @rooms_ctrl = new RoomsCtrl @app
    establish_routes: ->
      r = app.when '/',
        controller: @rooms_ctrl.index
        templateUrl: "views/rooms/index.html"
      r.otherwise redirectTo: '/'