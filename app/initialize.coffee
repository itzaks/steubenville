class Application 
  views: {}
  routers: {}
  events: {}
  constructor: ->
    @Layout = require 'views/layout'
    @Index = require 'views/index'
    @Router = require 'lib/router'

  init: ->
    @add_views()
    @add_routers()

  add_routers: ->
    @routers.main = new @Router()

  add_views: ->
    @views.layout = new @Layout(el: $("#application"))
    @views.index = new @Index()

$ ->
  app.init()
  Backbone.history.start(pushState: yes)

@app = new Application