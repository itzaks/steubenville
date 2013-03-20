LayoutView = require 'views/layout'

module.exports = class Application
  name: "brunch-with-avocadoes"
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
