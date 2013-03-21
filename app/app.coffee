LayoutView = require 'views/layout'

module.exports = class Application
  name: "streubenville"
  root: "streubenville"
  views: {}
  routers: {}
  events: {}
  constructor: ->
    _.extend this, Backbone.Events

    @router = new Router = require 'lib/router'

  init: ->
    @chrome()

  chrome: ->
    @layout = new LayoutView
      el: $("#application")
