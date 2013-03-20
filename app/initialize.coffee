class Application 
  views: {}
  routers: {}
  events: {}
  constructor: ->
    _.extend this, Backbone.Events

    @api = new API = require 'lib/api'
    @router = new Router = require 'lib/router'

  init: ->
    @chrome()
    @player = new Player = require 'views/player'


  chrome: ->
    LayoutView = require 'views/layout'
    @layout = new LayoutView
      el: $("#application")

$ ->
  app.init()
  Backbone.history.start
    pushState: yes
    root: root

@app = new Application