'use strict'

require.config
  paths:
    "faker": "components/Faker/Faker"
    "angular": "components/angular/angular"
    "angular-resource": "components/angular-resource/angular-resource"
    "angular-cookies": "components/angular-cookies/angular-cookies"
    "angular-sanitize": "components/angular-sanitize/angular-sanitize"
    "socket.io": "components/socket.io-client/dist/socket.io"
    "phonegap": "phonegap"
    "main": "js/main"
    "config/router": "js/config/router"
    "rooms": "js/rooms"
    "rooms/controller": "js/rooms/controller"
  shim:
    "angular":
      exports: "angular"
    "angular-resource": 
      deps: ["angular"]
    "angular-cookies": 
      deps: ["angular"]
    "angular-sanitize": 
      deps: ["angular"]