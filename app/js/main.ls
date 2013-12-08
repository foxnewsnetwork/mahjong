"use strict"

requirements = [
  "config/router", 
  "angular", 
  "angular-resource", 
  "angular-cookies", 
  "angular-sanitize"
]
require requirements, (Router) ->
  app = angular.module "mahjongApp", []
  new Router app
